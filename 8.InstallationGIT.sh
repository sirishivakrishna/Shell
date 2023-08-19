#!/bin/bash

user=$(id -u)

if [ $user -ne 0 ]
then
echo "Please execute with root user"
fi
yum install git -y