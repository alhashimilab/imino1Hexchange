#!/usr/bin/python

import os

filename1 = "Ex_IR.com"

with open('vdlist') as f:
    lines = f.read().splitlines()
newlines = [line.split() for line in lines]
taulist = [float(newline[0]) for newline in newlines]

file = open('%s'%filename1,"wt")

file.write("#!/bin/csh\n")
file.write("\n")
file.write("set tauList = (")
for tau in taulist:
    file.write("%.3f "%tau)

file.write(")\n")
file.write('''
nmrPipe -in test.fid            \\
#| nmrPipe  -fn SOL            \\
#| nmrPipe  -fn POLY -time           \\
| nmrPipe  -fn SP -off 0.5 -end 0.95 -pow 2.0 -c 0.5    \\
#| nmrPipe  -fn GM -g1 10 -g2 15 -g3 0 -c 0.5    \\
| nmrPipe  -fn ZF -size 32768        \\
| nmrPipe  -fn FT -auto           \\
| nmrPipe  -fn PS -p0 128.0 -p1 0.00  -verb     \\
#| nmrPipe  -fn POLY -auto -ord 4        \\
| nmrPipe  -fn EXT -x1 14.5ppm -xn 12.0ppm -sw \\
   -ov -out out.ft2
''')
file.write("split2D.com -in out.ft2 -outDir ft -outName T1_1Dpeak-%03d.ft2 -tau $tauList\n")
file.write("\n")

file.close()

os.system("chmod +x %s"%filename1)
os.system("./%s"%filename1)

