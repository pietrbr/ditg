#!/bin/bash

DATETIME=`date +"%Y_%m_%d_%H_%M_%S"`

# script_file is a script containing the commands
./bin/ITGSend script_file -l log_$DATETIME

echo 'Complete!'

./bin/ITGDec log_$DATETIME
