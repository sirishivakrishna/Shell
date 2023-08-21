#!/bin/bash
#date format
date=$(date +%F)

#Logs Directory
Logdir=/home/centos/Shelllogs
Script_Name=$0
Logfile=$Logdir/$0-$date.log

#user status whether root access or not
user=$(id -u)

#colors for user experience
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $user -ne 0 ];
then
    echo -e "$R Error: Please execute with root user $G"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "Installing...$2 $R FAILURE $N"
        exit 1
    else
        echo -e "Installing...$2 $G Success $N" 
    fi
}
for i in $@
do 
    yum list installed $i &>> $Logfile
        if [ $? -ne 0 ]
        then
            echo "$i is not installed, let's install it" &>> $Logfile
            yum install $i -y
            validate $? "$i"
        else
            echo -e "$Y $i is already installed $N"
        fi
done
