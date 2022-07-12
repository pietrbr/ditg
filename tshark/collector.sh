#!/bin/bash
if [[ $# -eq 0 ]]; then
    DATETIME=`date +"%Y_%m_%d_%H_%M_%S"`
    FILENAME=tshark_log_$DATETIME
elif [[ $# -eq 1 ]]; then
    FILENAME=tshark_log_$1
fi

tshark -i lxdbr0 -a duration:10 --color -P -w $FILENAME
