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
# Name:        CWTimer
# Purpose:     Runs an empty timer solely on the host
#
# Author:      mhashavi
#
# Created:     27-Jul-2015
# -------------------------------------------------------------------------------
from __future__ import print_function
from type_check.CTypeSpec import CTypeSpec
from type_check.typecheck import typecheck
from evtar.ux import vc, di_spec
from evtar.maple.base.workloads.CTfSubWorkload import CTfSubWorkload
from evtar.maple.base.workloads.CTfWorkload import CTfWorkload
from evtar.maple.workloads.timer.CSWTimer import CSWTimer


class CWTimer(CTfWorkload):

    _DEFAULT_NAME = 'Timer'
    _DEFAULT_TIME_OUT_SEC = 9999999.0
    _DEFAULT_TRIGGER = '1'

    @classmethod
    def _ParamsCreate(cls):
        return dict(super()._ParamsCreate(),
            TimeSec = di_spec.CDataItemSpec(vc.UintType, 'Timer loop duration in seconds', 10),
        )

    @classmethod
    @typecheck(CTypeSpec(Array=CTypeSpec(CTfSubWorkload)))
    def _DefaultSubWorkloads(cls):
        subWorkload = CSWTimer()
        subWorkload.Params.Name = 'Timer'
        return subWorkload,  # One tuple still has to have a comma at the end!

    def CheckExistenceOnTarget(self):
        return True

    def _BeforeSubWorkload(self, subWorkload):
        super()._BeforeSubWorkload(subWorkload)
        subWorkload.Params.TimeSec = self.Params.TimeSec
        subWorkload.nTimeoutSec = self.Params.TimeoutSec

    @property
    def _sTargetRunFileDir(self):
        return None

    @property
    def TargetRunFilePath(self):
        return None

    def GetTargetRunFileDir(self):
        return None

    def GetTargetResultsDir(self):
        return None

    def _SetTargetRunFileDir(self):
        pass

    def _SetTargetResultsDir(self):
        pass

    def CreateTargetDirs(self, sParentTargetDir):
        pass

if __name__ == '__main__':
    from doctest import testmod
    print(testmod())
