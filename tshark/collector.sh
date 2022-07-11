#!/bin/bash

DATETIME=`date +"%Y_%m_%d_%H_%M_%S"`

tshark -i lxdbr0 -a duration:10 --color -P -w tshark_log_$DATETIME
