#!/bin/sh

if [ -e $1 ]
then
  RPM=8000
else
  RPM=$1
fi

for fan in `seq 0 3`; do
    i2cset -y 3 0x52 0x00 $fan b
    i2cset -y 3 0x52 0x3A 0xD0 b
    i2cset -y 3 0x52 0xD1 0x00 0x00 i
    i2cset -y 3 0x52 0xD9 0x00 b
    i2cset -y 3 0x52 0xF1 0x40 0xF3 i
    i2cset -y 3 0x52 0xF5 0x00 0x00 i
    i2cset -y 3 0x52 0xF6 0x00 0x00 i
    i2cset -y 3 0x52 0x3B $RPM w
done
