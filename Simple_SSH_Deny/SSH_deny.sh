#!/bin/bash

logfile="/var/log/secure*"
denyfile="/etc/hosts.deny"
file="/tmp/ipfilter"


> $file

#Failed Password for normal user
grep "Failed password for invalid" $logfile| grep -v root | awk '{print $13}' | sort | uniq -c | sort -nr >> $file

#Failed password for root user
grep "Failed password for root" $logfile| awk '{print $11}' | sort | uniq -c | sort -nr >> $file

#Failed password for normaluser 2
grep "Failed password for" $logfile| grep -v 'root\|invalid' | awk '{print $11}' | sort | uniq -c | sort -nr >> $file

sort -nr -k 1  $file -o $file

while read line
do

        occ=$(echo $line | awk '{print $1}')
        IP=$(echo $line | awk '{print $2}')
        if [ -n $occ ] && [ $occ -ge 10 ] && ! ( grep -q "$IP" $denyfile )
                then
                echo "ALL: $IP" >> /etc/hosts.deny
                echo "occ=$occ IP=$IP"
        fi

done < $file