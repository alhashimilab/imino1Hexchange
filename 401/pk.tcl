#!/bin/sh
# The next line restarts using nmrWish \
exec nmrWish "$0" -- "$@"

message .msg -relief raised -bg blue -fg white \
 -width 30c -text "Detecting Peaks ..."

pack    .msg
update

set tabName  test.tab
set specName pkROI_1d.dat
set tabCount 1

set tabDir [file dirname $tabName]

if {![file exists $tabDir]} {file mkdir $tabDir}


set thisSpecName $specName
set thisTabName  $tabName

set x1      1
set xN      3719
set xInc    3719
set xExtra  3
set xLast   [expr $xN + $xExtra + 1]

    set xFirst  $x1

while {$xFirst <= 1 + $xN - $xExtra} \
   {
    set xNext [expr $xFirst+$xInc+2*$xExtra-1]
    if {$xNext > $xLast} {set xNext $xLast}

    readROI -roi 1 -ndim 1 -in $thisSpecName \
       -x X_AXIS $xFirst $xNext           \
       -verb

    pkFindROI -roi 1 \
      -sigma 515843 -pChi 0.0001 -plus 1.22941e+06 -minus -1.22941e+06 \
      -dx        3 \
      -idx       3 \
      -tol   11.12 \
      -hiAdj  1.20 \
      -lw    15.00 \
       -sinc -mask -out $thisTabName -verb

    set xFirst [expr 1 + $xNext - 2*$xExtra]
   }


exit
