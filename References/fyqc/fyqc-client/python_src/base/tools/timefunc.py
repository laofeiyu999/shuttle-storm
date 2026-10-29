# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\tools\timefunc.py
# Compiled at: 2023-04-06 17:07:45
# Size of source mod 2**32: 184 bytes
import time

def GetTimeSec(iYear, iMonth, iDay, iHour=0, iMin=0, iSec=0):
    return int(time.mktime((iYear, iMonth, iDay, iHour, iMin, iSec, 0, 0, 0)))
