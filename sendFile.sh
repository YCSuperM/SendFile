#!/bin/bash
#send file to hosts.list
#传目录15s
prsync -r -t 15 -h hosts.list -l root -r /Users/moxi/Desktop/ImessageFile /Users/moxi/Desktop > .sendipfile.txt
# split begin @ end :
echo '======== send failure ip ==== '
awk -F' ' '$3=="[FAILURE]"{split($4,a,"[@:]");print a[2]}' .sendipfile.txt > .retryhosts.list
cat .retryhosts.list
echo '======== send failure ip ==== '
