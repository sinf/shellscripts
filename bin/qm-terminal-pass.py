#!/usr/bin/env python3
import time
import os
import pty
import subprocess
import sys

"""
Glue script for GNU pass and "qm terminal" to send username+password to serial console and continue using it interactively. A simple "cat <(pass show xxx) - | qm terminal" almost works, except qm wants a TTY and not pipe and dies to failed ioctl.

Usage:
./qm-terminal-pass.py 101 foobar
"""

vmid=sys.argv[1]
pass_name=sys.argv[2]

lines = subprocess.check_output(['pass', 'show', pass_name], timeout=60).splitlines()
username = lines[0].strip()
password = lines[1].strip()

print('vm id', vmid)
print('username', username)
assert len(password)>0

lf = b'\n'
inputs = [
        username + lf,
        password + lf,
]
def read_callback(fd):
        if inputs:
                time.sleep(0.25) # doesn't work without this sleep !?
                return inputs.pop(0)
        return os.read(fd, 1024)

command = ['qm', 'terminal', vmid]
exit_status = pty.spawn(command, stdin_read = read_callback)
sys.exit(exit_status)


