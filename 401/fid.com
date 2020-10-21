#!/bin/csh

bruk2pipe -in ./ser \
  -bad 0.0 -aswap -DMX -decim 1296 -dspfvs 20 -grpdly 67.9876556396484  \
  -xN              3328  -yN                21  \
  -xT              1542  -yT                21  \
  -xMODE            DQD  -yMODE           Real  \
  -xSW        15432.099  -ySW           21.000  \
  -xOBS         700.333  -yOBS           1.000  \
  -xCAR           4.771  -yCAR           0.000  \
  -xLAB              1H  -yLAB             TAU  \
  -ndim               2  -aq2D          States  \
  -out ./test.fid -verb -ov

sleep 0
