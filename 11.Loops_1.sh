#!/bin/bash

user=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $user -ne 0 ];
then
    echo -e "$R Error: Please execute with root user $G"
    exit 1
fi