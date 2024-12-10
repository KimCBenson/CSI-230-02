#!/bin/bash

link="10.0.17.19/IOC-1.html"

curl -s $link | grep -oP '<td>\K.*?(?=</td>)' | sed -n '1~2p'  > IOC.txt
