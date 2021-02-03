#! /usr/bin/python3

import io

rn=dict()

def readN(fn):
    if fn in rn:
        fh=rn[fn]
    else:
        fh=io.FileIO(fn)
        rn[fn]=fh
    buf=fh.read(4)
    if len(buf)==0:
        fh.close
        del rn[fn]
    return buf
    
import unittest

class TestReadN(unittest.TestCase):

    def test_ex1(self):
        self.assertEqual(readN('input.txt'),b'1234','example 1')

    def test_ex2(self):
        self.assertEqual(readN('input.txt'),b'5678','example 2')

    def test_ex3(self):
        self.assertEqual(readN('input.txt'),b'90','example 3')

unittest.main()
