#!/bin/bash

DATE=`date +%d/%m/%Y`
HOST=`hostname`
echo "List of process '$HOST' actif more than 24 hours $DATE
***************************************************************
DESCRIPTION:

PID = Process ID
USER= User of the process"
echo  "ELAPSED = elapsed time since the process was started (wall clock time), format [[dd-]hh:]mm:ss."
echo  "STARTED = time the process was started."
echo  "COMMAND = Launched command."
echo  "***************************************************************"

ps -eo pid,user,etime,lstart,args --sort start_time  | awk ' $2 != "root" { split($3,etm,"-");if ( etm[1] > 1 && etm[1] !~ ":") print $0 }'


exit 0
