#!/bin/bash

App_Log_dir=/home/centos/app-logs

DATE=$(date +%F %T)
Logdir=/home/centos/Shelllogs
Script_name=$0 
LogFile=$Logdir/$0-$DATE.log


FILES_TO_DELETE=$(find $App_Log_dir -name "*.log" -type f -mtime +14)

echo "$FILES_TO_DELETE"

while read line
do
    echo "Deleting $line" &>> $LogFile
    rm -rf $line
done <<< $FILES_TO_DELETE