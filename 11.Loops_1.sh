#!/bin/bash

user=$(id -u)
R="e/31m"
G="e/32m"

if [ $user -ne 0 ]
then
    echo "$RError: Please execute with root user$G"
    exit 1
fi