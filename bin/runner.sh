#!/bin/bash

# echo -n "Enter the name of a country: "
# read COUNTRY
# echo -n "The official language of $COUNTRY is "

DATETIME=`date +"%Y_%m_%d_%H_%M_%S"`

case $1 in

  bs__bg_cl)
    echo "Starting base station with background traffic and command_long"
    ./ITGSend scripts/$1 -l logs/ditg_log_$DATETIME_bs
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME_bs
    ;;

  ue__bg_ca)
    echo "Starting user equipment with background traffic and command_ack"
    ./ITGSend scripts/$1 -l logs/ditg_log_$DATETIME_ue
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME_ue
    ;;

  *)
    echo -n "argument not recognised"
    ;;
esac
