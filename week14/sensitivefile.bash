#!/bin/bash

logfile="/home/champuser/CSI-230-02/week14/fileaccesslog.txt"
#emailfile="/home/champuser/CSI-230-02/week14/emailform.txt"

dat=$(date)

message="File was access $dat"
echo "$message" >> "$logfile"

function getAccessLogs(){
	logline=$(cat "$logfile" | cut -d' ' -f 4,5,6,7,8 | sed 's/[\:]/-/g')
	echo "$logline"
}


echo "To: kimberly.benson@mymail.champlain.edu" > emailform.txt
echo "Subject: Access" >> emailform.txt
getAccessLogs >> emailform.txt

cat emailform.txt || ssmtp kimberly.benson@mymail.champlain.edy
