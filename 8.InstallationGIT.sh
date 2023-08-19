#!/bin/bash

user=$(id -u)

if [ $user -ne 0 ]
then
echo "Error: Please execute with root user"
exit 1
fi
yum install git -y