# iostat-csv
Convert iostat output every second in one line and generates a csv file.

## Usage
Execute the script and it outputs a line to stdout in every seconds.
```
./iostat-csv.sh
```

If you want to save the result, do like this:
```
./iostat-csv.sh | tee -a iostat$(date +%Y%m%d%H%M).csv
```

Then you can process the csv file with other tools like awk, gnuplot, MSExcel, OpenOfficeCalc, etc.
This might be useful to investigate io-related problems. This script is tested in RHEL6/RHEL7.

## Output example

* iostat default output looks like:
```
root@localhost:~# iostat -t -x -m 1
Linux 3.16.0-57-generic (localhost)        03/13/16        _x86_64_        (2 CPU)

03/13/16 02:42:24
avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.14    0.00    0.07    0.00    0.00   99.78

Device:         rrqm/s   wrqm/s     r/s     w/s    rMB/s    wMB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
vda               0.00     0.02    0.05    0.47     0.00     0.00    19.77     0.00    0.80    0.57    0.83   0.14   0.01
scd1              0.00     0.00    0.00    0.00     0.00     0.00     6.17     0.00    0.33    0.33    0.00   0.33   0.00
```

* This script outputs a line in every seconds like this:
```
03/13/16,02:42:24,0.14,0.00,0.07,0.00,0.00,99.78,vda,0.00,0.02,0.05,0.47,0.00,0.00,19.77,0.00,0.80,0.57,0.83,0.14,0.01,scd1,0.00,0.00,0.00,0.00,0.00,0.00,6.17,0.00,0.33,0.33,0.00,0.33,0.00
```
