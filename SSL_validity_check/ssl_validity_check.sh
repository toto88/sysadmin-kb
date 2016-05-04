#!/bin/sh

#certfile is your certificate file example: cert-1313153074-222673.cer_initial
certfile=cert-1313153074-222673.cer_initial
outputdate=`openssl x509 -in $certfile -noout -enddate`
echo "output $outputdate"

enddate=$( echo $outputdate | cut -d'=' -f2 | awk '{print $1, $2, $3, $4}' )
#echo $enddate

bdate=`date -ud "+30 day" | awk '{print $2, $3, $4, $6}'`
#echo $bdate

tbdate=`date --date="$bdate" +%s`
tenddate=`date --date="$enddate" +%s`

days=` echo $(( ($(date --date="$enddate" +%s) - $(date --date="$bdate" +%s)) / 86400))`

if [ $tenddate -lt $tbdate ];then
        echo "Your SSL Cert will expire in  $days."
else
        echo "Eveything is OK"
fi