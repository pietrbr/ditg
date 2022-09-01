#!/bin/bash

DATETIME=`date +"%Y_%m_%d_%H_%M_%S"`

case $1 in


  uav)
    echo "Starting user equipment with background traffic and command_ack"
    ./ITGSend uav -l logs/ditg_log_$DATETIME\_uav
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_uav
    ;;

  bs)
    echo "Starting base station with background traffic and command_long"
    ./ITGSend bs -l logs/ditg_log_$DATETIME\_bs
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_bs
    ;;

  bs_1uav)
    echo "Starting base station with background traffic and command_long"
    ./ITGSend bs_1uav -l logs/ditg_log_$DATETIME\_bs_1uav
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_bs_1uav
    ;;

  bs_3uav)
    echo "Starting base station with background traffic and command_long"
    ./ITGSend bs_3uav -l logs/ditg_log_$DATETIME\_bs_3uav
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_bs_3uav
    ;;


  bs_uav_3ue10)
    echo "Starting base station with background traffic and command_long"
    ./ITGSend bs_uav_3ue10 -l logs/ditg_log_$DATETIME\_bs_uav_3ue10
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_bs_uav_3ue10
    ;;

  bs_3uav_3ue05)
    echo "Starting base station with background traffic and command_long"
    ./ITGSend bs_3uav_3ue05 -l logs/ditg_log_$DATETIME\_bs_3uav_3ue05
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_bs_3uav_3ue05
    ;;

  bs_3uav_3ue10)
    echo "Starting base station with background traffic and command_long"
    ./ITGSend bs_3uav_3ue10 -l logs/ditg_log_$DATETIME\_bs_3uav_3ue10
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_bs_3uav_3ue10
    ;;

  bs_3uav_3ue20)
    echo "Starting base station with background traffic and command_long"
    ./ITGSend bs_3uav_3ue20 -l logs/ditg_log_$DATETIME\_bs_3uav_3ue20
    echo "Complete!"
    ./ITGDec logs/ditg_log_$DATETIME\_bs_3uav_3ue20
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