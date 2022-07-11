#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo 'No parameter passed: rememeber to pass the name of the script!'
    exit 0
elif [[ ! $# -eq 1 ]]; then
    echo 'Too many parameters passed, retry'
    exit 1
elif [[ $1 -eq 'background_traffic' or $1 -eq 'command_ack' ]]; then
    echo 'Wrong parameter'
    exit 2
fi

DATETIME=`date +"%Y_%m_%d_%H_%M_%S"`

# script_file is a script containing the commands
./ITGSend scripts/$1_ue -l logs/ditg_log_$DATETIME

echo 'Complete!'

./ITGDec logs/ditg_log_$DATETIME
