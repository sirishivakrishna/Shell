#!/bin/bash

user=$(id -u)

if [ $user -ne 0 ]
then
echo "Error: Please execute with root user"
exit 1
fi
yum install mysql -y
if [ $? -ne 0 ]
then
echo "mysql installation Failed"
else
echo "mysql installation success"
fi

yum install postfix -y
if [ $? -ne 0 ]
then
echo "postfix installation Failed"
else
echo "postfix installation success"
fi