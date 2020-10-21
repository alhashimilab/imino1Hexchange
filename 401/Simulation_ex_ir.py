#!/usr/bin/python

import os

with open('vdlist') as f:
    lines = f.read().splitlines()
newlines = [line.split() for line in lines]
taulist = [float(newline[0]) for newline in newlines]

os.system("mkdir -p sim dif fit_tab")
os.system("rm sim/* dif/* fit_tab/*")

for i in range(len(taulist)):
    os.system("autoFit.tcl -specName ft/T1_1Dpeak-%03d.ft2 -inTab test.tab -outTab fit_tab/T1_1DFit-%03d.tab"%(i+1,i+1))
    os.system("mv sim.ft1 sim/test-%03d.ft1"%(i+1))
    os.system("mv dif.ft1 dif/test-%03d.ft1"%(i+1))
    os.system("rm autoFit.com axt.tab")



