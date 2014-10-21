#!/usr/bin/python

import ctypes
libc = ctypes.CDLL("libc.so.6")
libc.pause()

