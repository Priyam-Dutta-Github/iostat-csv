#!/bin/sh
## iostat csv generator ##
# This script converts iostat output every second in one line and generates a csv file.

# Settings
COMMAND_OUTPUT_LINE_NUMBERS=`iostat|wc -l`
UNNECESSARY_LINE_NUMBERS=2

# Preparation
i=`expr ${COMMAND_OUTPUT_LINE_NUMBERS} - ${UNNECESSARY_LINE_NUMBERS}`
PASTE_LINE_HYPHENS=`seq -s' -' ${i}|tr -d '[:digit:]'`
#  => print " -" for i times to concatenate output lines by using paste command

# Main part
LANG=C; iostat -t -x -m 1 | tail -n +3 | grep -v -e avg-cpu -e avgqu-sz \
 | paste ${PASTE_LINE_HYPHENS} | awk 'BEGIN {OFS=","} {$1=$1;print $0}'

# tail -n +3
#  => Output after 3rd lines of the iostat output

# grep -v -e avg-cpu -e avgqu-sz
#  => Exclude title columns

# paste ${PASTE_LINE_HYPHENS}
#  => Concatenate output lines in each second to one line

# awk 'BEGIN {OFS=","} {$1=$1;print $0}'
#  => Separate each value by comma
