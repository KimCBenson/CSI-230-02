#! /bin/bash

link="http://10.0.17.30/Assignment.html"

press=$(curl -sL "$link" | \
#xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --value-of "//table[@id='press']//tr//td" | \
awk ' NR % 2 == 1')

temp=$(curl -sL "$link" | \
xmlstarlet select --template --value-of "//table[@id='temp']//tr//td" | \
awk 'NR % 2 == 1')

dat=$(curl -sL "$link" | \
xml starlet select --template --value-of "//table[@id='press']//tr//td" | \
awk 'NR % 2 == 0')

cnt=$(echo "$press" | wc -1)
for ((  i=1; i<="${cnt}"; i++ ))
do
var1=$(echo "$press" | head -n $i  | tail -n 1)
var2=$(echo "$temp" | head -n $i | tail -n 1)
var3=$(echo "$dat" | head -n $i | tail -n 1)
done

#echo "$press"
#echo "$temp"
#echo "$dat"
