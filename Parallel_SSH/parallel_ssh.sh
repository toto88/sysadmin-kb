#!/bin/bash

#this will launch 100 ssh sessions to the server hostname1 with the user1 and launch the command uname on each connection.
for i in {1..100}; do (ssh user1@hostname1 uname &) 2>&1; done 


# and to count and many failed ssh connection add the following commands: grep ssh_exchange| wc -l
for i in {1..100}; do (ssh user1@hostname1 uname &) 2>&1; done | grep ssh_exchange| wc -l

# sometimes failed parrallels due to sshd_config configurations : try to upate the two parameters "maxsessions" and "maxstartups" (example like following)
#maxsessions 100
#maxstartups 100:30:100

#  restrart your sshd service and test your configuration: /usr/sbin/sshd -T | grep max
