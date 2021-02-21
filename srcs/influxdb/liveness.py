#!/usr/bin/python3

import os, sys

def main(argv):
    services = argv[1:]
    output = os.popen('ps').read()
    trim = ''
    for s in services:
        trim += f' {s}'
    output = output.replace(f'python3 {argv[0]}{trim}', '')
    for service in services:
        if not service in output:
            sys.exit(1)
    sys.exit(0)

if __name__ == '__main__':
    main(sys.argv)