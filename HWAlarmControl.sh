#!/bin/bash 
# ================================================================
# HWAlarmControl.sh -- Used to Control the Honeywell Alarm Panel from Asterisk (using Google Speech API)
#
# Arguments:
# -DISARM
# -ARMAWAY
# -ARMSTAY
# -STATUS
#
# Zone bypass can probably come later on or need a separate file
# ================================================================

STATE=${1:1}


function dopanel
{
   CALLFILENAME="$STATE.call"

   # echo "CALLFILE: $CALLFILENAME"

   echo $STATE >> /home/common/HWAlarmControl.log
   echo $STATE > /home/common/HWAlarmstate.log
   # echo "Now copying file to outgoing"
   cp /home/common/bin/$STATE.call /var/spool/asterisk/outgoing
}


if [ $# -eq 0 ] || [ -z "$1" ]
  then
    echo "$0: No arguments supplied"
    exit -1
fi

dopanel $STATE

case "$1" in
  "-DISARM" | "-ARMAWAY" | "-ARMSTAY")
    echo "${STATE}ed"
    ;;
esac

exit 0
