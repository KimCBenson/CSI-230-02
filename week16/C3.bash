#!/bin/bash

# start of doc
echo "<html>" > report.html
echo "<head><title>IOC Compromise Report</title></head>" >> report.html
echo "<body>" >> report.html

# the report
echo "<p>Access logs with IOC indicators</p>" >> report.html
echo "<table>" >> report.html

echo "<tr><td>IP</td><td>Time</td><td>Page</td></tr>" >> report.html

while IFS= read -r line;
do
	ip=$(echo "$line" | awk '{print $1}')
	date=$(echo "$line" | awk '{print $2 " " $3 " " $4}')
	page=$(echo "$line" | awk '{print $5}')

	echo "<tr><td>$ip</td><td>$date</td><td>$page</td></tr>" >> report.html
done < results.txt

echo "</table>" >> report.html

# end of doc
echo "</body>" >> report.html
echo "</html>" >> report.html

sudo mv report.html /var/www/html
