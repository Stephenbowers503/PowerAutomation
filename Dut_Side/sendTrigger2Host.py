from __future__ import print_function

import socket, sys, time



IP = "192.168.137.1"



_dNamedPorts = {

    'start': 6003,

    'stop': 6002,

    'asleep': 6013,

    'awake': 6012,

    'rebooting': 6023,

    'booted': 6022,

}





def send_trigger(portNum):

    bBlocking = (portNum != 6002 and portNum != 6003)

    i = 1

    while True:

        out_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        try:

            out_socket.connect((IP, portNum))

            return 0

        except Exception as e:

            print("Attempt {}: Trigger (to {}:{}) was not sent. Reason: {}".format(i, IP, portNum, str(e)))

            if not bBlocking:

                return 1

            i += 1

            time.sleep(0.5)

        finally:

            out_socket.close()





def get_port_number():

    if sys.argv[1] not in _dNamedPorts:

        if str(sys.argv[1]).isdigit() and int(sys.argv[1]) not in list(_dNamedPorts.values()):

            print("Wrong trigger")

            exit(1)

    if str(sys.argv[1]).isdigit():

        portNum = int(sys.argv[1])

    else:

        portNum = _dNamedPorts[sys.argv[1]]



    return portNum





if __name__ == '__main__':

    exit(send_trigger(get_port_number()))
