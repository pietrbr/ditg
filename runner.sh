#!/bin/bash

DATETIME=`date +"%Y_%m_%d_%H_%M_%S"`

# script_file is a script containing the commands
./ITGSend script_file -l logs/ditg_log_$DATETIME

echo 'Complete!'

./ITGDec logs/ditg_log_$DATETIME
