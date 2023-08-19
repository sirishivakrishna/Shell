#!/bin/bash

date=$(date +%F)
scriptname=$0
Logfile=/temp/$scriptname-$date

R=\e[31m
G=\e[32m
N=\e[0


#this function should validate the previous command and inform user it is success or failure
validate(){
    if [ $1 -ne 0 ] #It will receive the first argument
    then
        echo "$2 ...$R Failure $N"
        exit 1
    else
        echo "$2 ... $F Success $N"
    fi
}

userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo "Error :: Pleaase run this script with use"
fi
yum install git -y &>> Logfile
validate $? "Instlling GIT"

yum install mysql -y &>> Logfile
validate $? "Instlling mysql"

yum install postfix -y &>> Logfile
validate $? "Instlling postfix"