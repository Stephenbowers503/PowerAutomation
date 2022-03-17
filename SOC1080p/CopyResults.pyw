import time
import os
import sys

from evtar.services.communicator.ux import Communicator
from evtar.maple.workloads import Paths
##Copy results
Communicator.GetFileFromTarget(r'c:\\users\\Local_Admin\\Documents\\Socwatch\\VP1080p\\VP1080p.csv', r'c:\\Automation\Socwatch_Results\VP1080p\\VP1080p.csv')
