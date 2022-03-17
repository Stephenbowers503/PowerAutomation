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
# Name:        CSWTimer
# Purpose:     Runs an empty timer solely on the host
#
# Author:      mhashavi
#
# Created:     28-Jul-2015
# -------------------------------------------------------------------------------
import time
from evtar.base.data_item.leaf.base.CUiReprAttributes import HiddenRepr
from evtar.ux import vc, di_spec
from evtar.maple.base.workloads.CTfSubWorkload import CTfSubWorkload


class CSWTimer(CTfSubWorkload):

    @classmethod
    def _ParamsCreate(cls):
        return dict(super()._ParamsCreate(),
            TimeSec = di_spec.CDataItemSpec(vc.UintType, 'Timer loop duration in seconds', ReprFunction=HiddenRepr),
        )

    def Run(self):

        if self.Params.TimeSec <= self.nTimeoutSec:
            time.sleep(self.Params.TimeSec)
            self.AddResult('ExecutionTime', str(self.Params.TimeSec))
        else:
            time.sleep(self.nTimeoutSec)
            raise Exception('Timeout in execution of Timer workload')

    def RunAsync(self):
        self.__startTime = time.time()

    def PollTargetCommandStatus(self):
        now = time.time()
        if (now - self.__startTime) > self.Params.TimeSec:
            self._PostRun()
            return None, None, 0

        if (now - self.__startTime) > self.nTimeoutSec:
            raise Exception('Timeout expired for SubWorkload {0}'.format(self.Params.Name))
        return None
