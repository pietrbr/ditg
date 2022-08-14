#!/bin/bash

DATETIME=`date +"%Y_%m_%d_%H_%M_%S"`

case $1 in

  bs)
    echo "Starting base station with background traffic and command_long"
    ./ITGSend bs -l logs/ditg_log_$DATETIME\_bs
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_bs
    ;;

  uav)
    echo "Starting user equipment with background traffic and command_ack"
    ./ITGSend uav -l logs/ditg_log_$DATETIME\_uav
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_uav
    ;;

  ue_05)
    echo "Starting user equipment with background traffic and command_ack"
    ./ITGSend ue_05 -l logs/ditg_log_$DATETIME\_ue_05
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_ue_05
    ;;

  ue_10)
    echo "Starting user equipment with background traffic and command_ack"
    ./ITGSend ue_10 -l logs/ditg_log_$DATETIME\_ue_10
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_ue_10
    ;;

  ue_20)
    echo "Starting user equipment with background traffic and command_ack"
    ./ITGSend ue_20 -l logs/ditg_log_$DATETIME\_ue_20
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_ue_20
    ;;

  *)
    echo -n "argument not recognised"
    ;;
esac


# echo -n "Enter the name of a country: "
# read COUNTRY
# echo -n "The official language of $COUNTRY is "


# case "$1:$2:$3" in

# OK:*)
#     # Nothing needs done
#     echo -n "OK:1"
#     ;;

# CRITICAL:SOFT:[12])
#     soft_reset_pool.sh
#     ;;

# CRITICAL:HARD:[12])
#     hard_reset_pool.sh
#     ;;

# CRITICAL:HARD:[34])
#     hard_reset_service
#     ;;

# esac