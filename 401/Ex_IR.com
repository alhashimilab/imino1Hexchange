#!/bin/csh

set tauList = (0.000 0.050 0.100 0.150 0.200 0.250 0.300 0.400 0.500 0.600 0.800 1.000 1.200 1.500 1.800 2.100 2.400 3.000 3.600 4.200 4.800 )

nmrPipe -in test.fid            \
#| nmrPipe  -fn SOL            \
#| nmrPipe  -fn POLY -time           \
| nmrPipe  -fn SP -off 0.5 -end 0.95 -pow 2.0 -c 0.5    \
#| nmrPipe  -fn GM -g1 10 -g2 15 -g3 0 -c 0.5    \
| nmrPipe  -fn ZF -size 32768        \
| nmrPipe  -fn FT -auto           \
| nmrPipe  -fn PS -p0 128.0 -p1 0.00  -verb     \
#| nmrPipe  -fn POLY -auto -ord 4        \
| nmrPipe  -fn EXT -x1 14.5ppm -xn 12.0ppm -sw \
   -ov -out out.ft2
split2D.com -in out.ft2 -outDir ft -outName T1_1Dpeak-%03d.ft2 -tau $tauList

