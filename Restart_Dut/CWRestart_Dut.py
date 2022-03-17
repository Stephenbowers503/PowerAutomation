############################################################################
# INTEL CONFIDENTIAL
# Copyright 2015 Intel Corporation All Rights Reserved.
#
# The source code contained or described herein and all documents related
# to the source code ("Material") are owned by Intel Corporation or its
# suppliers or licensors. Title to the Material remains with Intel Corp-
# oration or its suppliers and licensors. The Material may contain trade
# secrets and proprietary and confidential information of Intel Corpor-
# ation and its suppliers and licensors, and is protected by worldwide
# copyright and trade secret laws and treaty provisions. No part of the
# Material may be used, copied, reproduced, modified, published, uploaded,
# posted, transmitted, distributed, or disclosed in any way without
# Intel's prior express written permission.
#
# No license under any patent, copyright, trade secret or other intellect-
# ual property right is granted to or conferred upon you by disclosure or
# delivery of the Materials, either expressly, by implication, inducement,
# estoppel or otherwise. Any license under such intellectual property
# rights must be express and approved by Intel in writing.
#
# Name:        CIdle
# Purpose:     Idle command on the target for a duration of time
#
# Author:      tcase & jfrankm (converted to Maple3 by rsher)
#
# Created:     17-Mar-2015
# -------------------------------------------------------------------------------

import os
import sys
import subprocess
import time

from type_check.CTypeSpec import CTypeSpec
from type_check.typecheck import typecheck
from evtar.ux import vc
from evtar.ux import di_spec
from evtar.services.communicator.type_check_defs.TargetOsNameEnum import TargetOsNameEnum
from evtar.services.communicator.ux import Communicator
from evtar.maple.base.workloads.CTfSubWorkload import CTfSubWorkload
from evtar.maple.workloads.ux import CTfWorkload
from evtar.services.communicator.ux import CommunicatorConfig
from evtar.maple.ux import MapleAppConfig

class CWRestart_Dut(CTfWorkload):
    _DEFAULT_NAME = 'Restart_Dut'
    _DEFAULT_NUM_OF_RETRIES = 1
    _DEFAULT_TRIGGER = '0'
    _DEFAULT_TIME_OUT_SEC = 360.0

    originalCommunicatorMode = CommunicatorConfig.Execution.Mode

    @classmethod
    @typecheck(CTypeSpec(Array=CTypeSpec(CTfSubWorkload)))
    def _DefaultSubWorkloads(cls):
        subWorkload = CTfSubWorkload()
        subWorkload.Params.Name = 'Restart_Dut'
        return subWorkload,  # One tuple still has to have a comma at the end!

    @classmethod
    def _ParamsCreate(cls):
        return dict(super(CWRestart_Dut, cls)._ParamsCreate(),
                    OsName=di_spec.CDiEnumSpec(TargetOsNameEnum, 'Operation system Name', TargetOsNameEnum.nt),
                    DurationSec=di_spec.CDataItemSpec(vc.IntType, 'workLoad duration in sec', 300),
                    )

    def CheckExistenceOnTarget(self):
        """
        Checks if the OS on target is NT
        """
        if self.Params.OsName != Communicator.GetOSName():
            return False
        return True

    def _BeforeSubWorkload(self, subWorkload):
        super(CWRestart_Dut, self)._BeforeSubWorkload(subWorkload)
        subWorkload.sArgForRunning = str(self.Params.DurationSec)
        self._bPossibleUnresponsiveTarget = True
        CommunicatorConfig.Execution.Mode = 'Polling'
        # try:
            # Communicator.ExecuteCommandOnTarget(r'C:\tools\elevate\elevate.exe -c shutdown /r')
        # except:
            # self._Logger.Info("Didnt restart DUT")

    def _AfterSubWorkload(self, subWorkload, currentIteration):
        super(CWRestart_Dut, self)._AfterSubWorkload(subWorkload, currentIteration)
        CommunicatorConfig.Execution.Mode = self.originalCommunicatorMode
                
    def _RunSubWorkloadSyncOrAsync(self, subWorkload):
        # Start subworkload and take over polling of target
        # subWorkload.RunAsync()
        # self._SleepTillUserAbort(CommunicatorConfig.Execution.PollingTimeSec)
        status = ''
        testString = 'ThePlatformIsBackUp'
        Communicator.RebootTarget()

        while testString.lower() not in status.lower():

            try:
                time.sleep(1)
                status = Communicator.ExecuteCommandOnTarget(r'echo ' + testString)
                time.sleep(1)
            except:
                self._Logger.Info('Communicator is not back up yet. Sleeping for ' + str(CommunicatorConfig.Execution.PollingTimeSec) + ' seconds')
                
        
                
        # Finish subworkload
        subWorkload._PostRun()