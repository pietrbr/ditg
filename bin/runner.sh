#!/bin/bash

# echo -n "Enter the name of a country: "
# read COUNTRY
# echo -n "The official language of $COUNTRY is "

DATETIME=`date +"%Y_%m_%d_%H_%M_%S"`

case $1 in

  bs)
    echo "Starting base station with background traffic and command_long"
    ./ITGSend bs__bg_cl -l logs/ditg_log_$DATETIME\_bs
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_bs
    ;;

  ue)
    echo "Starting user equipment with background traffic and command_ack"
    ./ITGSend ue__bg_ca -l logs/ditg_log_$DATETIME\_ue
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_ue
    ;;

  *)
    echo -n "argument not recognised"
    ;;
esac
