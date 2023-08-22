#!/bin/bash

#Colors
#Validations
#LogRedirection

Logfile_Directory=/tmp
DATE=$(date +%F:%H:%M:%S)
Script_Name=$0
Log_File=$Logfile_Directory/$Script_Name-$DATE.log

R="/e[31m"
G="/e[32m"
Y="/e[33m"
N="/e[0m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesyatem')
DISK_USAGE_THRESHOLD=1
message=""
while IFS= read line
do
    #This command will give you usage in number format for comparision
    usage=$(echo $line | awk '{print-$6}' | cut -d % -f1)

    #This command will give us partition
    partition=$(echo $line | awk '{print-$1}')

    #Now we need to check more than threshold or not
    if [  $usage -gt $DISK_USAGE_THRESHOLD ]
    then
        message+="HIGH DISK USAGE ON $partition: $usage \n"
    fi
done <<< $DISK_USAGE

echo -e "message: $message"

