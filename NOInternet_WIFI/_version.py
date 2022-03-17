############################################################################
# INTEL CONFIDENTIAL
# Copyright 2017 Intel Corporation All Rights Reserved.
# The source code contained or described herein and all documents related
# to the source code ("Material") are owned by Intel Corporation or its
# suppliers or licensors. Title to the Material remains with Intel Corp-
# oration or its suppliers and licensors. The Material contains trade
# secrets and proprietary and confidential information of Intel Corpor-
# ation or its suppliers and licensors. The Material is protected by world-
# wide copyright and trade secret laws and treaty provisions. No part of
# the Material may be used, copied, reproduced, modified, published,
# uploaded, posted, transmitted, distributed, or disclosed in any way
# without Intel's prior express written permission.
# No license under any patent, copyright, trade secret or other intellect-
# ual property right is granted to or conferred upon you by disclosure or
# delivery of the Materials, either expressly, by implication, inducement,
# estoppel or otherwise. Any license under such intellectual property
# rights must be express and approved by Intel in writing.
#
# _version.py
# Encapsulation of the version index of this package
#
# Created on:      16-Jan-2017
# Original author: mmaylat
############################################################################
from distutils.version import LooseVersion
import datetime

# You must have SVN keywords applied for this to work
# which will happen if you ran the tortoise_setup before adding your package
__revision__ = "$Revision: $"
__revision__ = __revision__.replace("$Revision:", "")
__revision__ = __revision__.replace("$", "")
__revision__ = __revision__.strip()
# for GIT users, you do not have to have the above, as long as __version__ is filled
# in properly below

# for the ww release format:
today = datetime.datetime.today()
year, week, day = today.isocalendar()
year_work_week = "{0}{1}".format(year-2000, week)

# MAJOR ----------
# 0 = beta/alpha code
# incremented any time you change the API that may break backwards compatibility
# in a fairly major way
MAJOR = 1
# MINOR ------------
# recommend using datetime info to show last update as part of versiona
# but the other option is to manually rev, and put the revision in the build
MINOR = 2
# BUILD ------
# either make this a manual number to increment or use the SVN revision
# (which increments like crazy...hopefully it doesn't drive users a bit crazy)
BUILD = '1' # or __revision__
__version__ = LooseVersion("{major}.{minor}.{build}".format(
                major=MAJOR,
                minor=MINOR,
                build=BUILD, ))
