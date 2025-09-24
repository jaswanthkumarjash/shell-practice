#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "Script name is: $0"
echo "Current directory: $PWD"
echo "Who is running this script: $USER"
echo "Home directory of the user: $HOME"
echo "Process ID of the current script: $$"
sleep 50 &
echo "Process ID of the last background command: $!"
echo "Total number of arguments passed: $#"
echo "Last command exit status: $?"
echo "Shell name: $SHELL"
echo "Operating System: $OSTYPE"