#!/bin/sh
LANG=C;iostat -t -x -m 1 | tail -n +3 | grep -v -e avg-cpu -e avgqu-sz |paste $(i=`iostat|wc -l`;i=$(($i-3));while( [ $i -gt 0 ] );do i=$((i-1));echo -n " -";done)|awk 'BEGIN {OFS=","} {$1=$1;print $0}'
