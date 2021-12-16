#!/bin/bash

# What's got my file? script. This script takes a file name as an argument and returns the PID of the process and the username of the user who has the file open. I recommend using lsof to accomplish the meat of this task.
if [ -z $1 ]
then
       echo "
       Usage: whats_got_my_file.sh [file name]
       Example: whats_got_my_file.sh /home/ubuntu/hello.txt
       script will pring PID process and username that is using the file
       "
       exit 0;
fi
fileName=$1
# take the file name and return it as PID process then have the username of the user who has the file open
# test and see if the user has the
if [ ! -e "$fileName" ] 
then
       echo  "$fileName does not exist, please enter a file name"
       exit 0;
fi
lsof | grep $fileName | awk '{print $1, $2}'
