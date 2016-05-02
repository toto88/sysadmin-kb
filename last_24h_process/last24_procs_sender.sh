#!/bin/bash

hostname=`hostname`

if [ -f output_last24 ];
	then 
		rm -f output_last24
fi

./last24_procs.sh > output_last24

cat output_last24 |mail -s "Stats $hostname for processus +24h" tawfiq.zidi@gmail.com

if [  $? == 0 ];
	then
		rm -f output_last24
fi;

exit 0 
