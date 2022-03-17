
import sys
import time

sys.path.append("C:\SVShare\\User_Apps\TTK3")
sys.path.append("C:\SVShare\\User_Apps\TTK3\API\Python")

from GpiosManager import *
from evtar.services.communicator.ux import Communicator


gpioint = GpiosManager()
##Define GPIO Pins and Orientation)
Relay1 = gpioint.GetGpioObj(3, 7)
Relay2 = gpioint.GetGpioObj(8, 3)
Relay3 = gpioint.GetGpioObj(8, 0)
Relay4 = gpioint.GetGpioObj(3, 13)

Relays = [Relay1, Relay2, Relay3, Relay4]

gpioint.SetGpiosDirection(Relays, 4, 0)

gpioint.ClearGpios(Relays, 4)
time.sleep(1)
gpioint.SetGpios(Relays, 4)


vs = gpioint.ReadGpios(Relays,4)
print("relay status")
print((vs[0]))
print((vs[1]))
print((vs[2]))
print((vs[3]))

time.sleep(10)


exit()



