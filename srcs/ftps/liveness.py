import os, sys

def main(argv):
    services = argv[1:]
    output = os.popen('ps | head -n -4').read()
    print(output)
    for service in services:
        if not service in output:
            sys.exit(1)
    sys.exit(0)

if __name__ == '__main__':
    main(sys.argv)