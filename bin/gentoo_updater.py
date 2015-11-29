#!/usr/bin/python3

import sys
import signal
import subprocess


def sigterm_handler(_signo, _stack_frame):
    sys.exit(0)

if __name__ == "__main__":
    signal.signal(signal.SIGTERM, sigterm_handler)
    signal.signal(signal.SIGINT, sigterm_handler)
    # subprocess.call(["emerge", "--sync"])
    subprocess.call(["eix-sync"])
    subprocess.call(["emerge", "-uDU", "--with-bdeps=y", "@world",
                     "--keep-going"])
