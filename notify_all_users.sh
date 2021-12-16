#!/bin/bash
  
# "Message all logged in users" script. This script takes a text file path as input and will send its contents to all logged in users, both those logged into the terminal and into a gnome session (note, you will have to use two different mechanisms to accomplish this) I recommend using wall for the command line message and notify-send for the gui. More info on the gui here: https://www.baeldung.com/linux/script-gui-notification.

if [ -z $1 ]
then
        echo "  
        Usage: script [text file path to send all logged in users]
        Example: script /home/jampacis/Announcement.txt
        Please input text file path to the message that you want sent out
        "
        exit 0;
fi

message="$1"

echo "The path to the message being sent is $message"

if [ ! -e  "$message" ]
then
        echo "The file name you have provided does not exist, please provide a valid filename"
        exit 0;
fi

cat $message | wall
text=$( cat $message )
notify-send -t 3000 -i
