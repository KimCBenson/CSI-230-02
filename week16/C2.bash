#!/bin/bash

logfile=$1
iocfile=$2

while IFS= read -r ioc; do
	grep "$ioc" "$logfile" | awk '{print $1, substr($4,2), $7}' >> results.txt
done < "$iocfile"
