#!/bin/bash

user=$(id -u)

validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ... Failure"
        exit 1
    else
        echo "$2 ... Success"
    fi
}

yum install git -y
validate $? "Instlling GIT"

yum install mysql -y
validate $? "Instlling mysql"

yum install postfix -y
validate $? "Instlling postfix"