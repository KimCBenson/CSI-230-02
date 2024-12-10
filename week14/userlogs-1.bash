#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser" 
}

#function getFailedLogins(){
# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
#}

function getFailedLogins(){
	logline=$(cat "$authfile" | grep "authentication failure")
	dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11,13,14 | tr -d '\.')
	echo "$dateAndUser"
}

# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: kimberly.benson@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp kimberly.benson@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 
echo "To: kimberly.benson@mymail.champlain.edu"
echo "Subject: Failed Logins" >> failedlogins.txt
getFailedLogins >> failedlogins.txt
cat failedlogins.txt | kimberly.benson@mymail.champlain.edu
