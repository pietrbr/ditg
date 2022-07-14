#!/bin/bash

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