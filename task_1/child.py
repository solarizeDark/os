#!/usr/bin/python3
import os
import time
import sys

# author: Fedusiv
# 11-901

print('CHILD  PROCESS\tChild in process with PID: {} arg: {}'.format(os.getpid(), sys.argv[1]))
time.sleep(int(sys.argv[1]))
#print('CHILD  PROCESS\tProcess with PID: {} ended'.format(os.getpid()))

status = 0 if int(sys.argv[1]) % 2 == 0 else 1
os._exit(status)
