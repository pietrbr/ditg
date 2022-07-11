#!/bin/bash

DATETIME=`date +"%Y_%m_%d_%H_%M_%S"`

echo 'Complete!'

tshark -i lxdbr0 -a duration:10 -w daje --color -P -w log_$DATETIME
