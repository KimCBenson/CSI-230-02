#!bin/bash

file="/var/log/apache2/access.log"

function countingCurlAccess()
{
	results=$(cat $file | grep "curl" | cut -d' ' -f1,12)
	sortedLogs=$(echo "$results" | sort | uniq -c)
}

countingCurlAccess
echo "$sortedLogs"
