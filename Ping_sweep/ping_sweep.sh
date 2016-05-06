#/bin/bash

#This will ping the network 192.168.1.0/24 from the IP: 192.168.1.1 to 192.168.1.254 and output the list UP addresses.
for i in `seq 1 254` ;do  if ( ping "192.168.1.$i" -c 1 -i 0.2 ) &> /dev/null ;then echo " IP:  192.168.1.$i UP";fi; done


#If you are using another subnet you have to change:
# "192.168.1.$i" to your subnet ( example: 10.1.1.$i)
# define your IP addresses range : ( example: `seq 20 40` for addresses in the range 10.1.1.20 to 10.1.1.40 )