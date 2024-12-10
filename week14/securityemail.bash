echo "To: kimberly.benson@mymail.champlain.edu" > emailform.txt
echo "Subject: Security Incident" >> emailform.txt
echo "Test" >> emailform.txt
cat emailform.txt | ssmtp kimberly.benson@mymail.champlain.edu
