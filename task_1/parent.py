#!/usr/bin/python3
import os
import sys
import random

# author: Fedusiv
# 11-901

for i in range(int(sys.argv[1])):
        child = os.fork()
        if child > 0:
                res = os.wait()
                print('PARENT PROCESS\tChild with PID: {} stopped. Status: {}'.format(res[0], res[1]))
        else:
                os.execl(sys.executable, '"{}"'.format(sys.executable), './child.py', str(random.randint(5, 10)))
