#!/bin/bash

#this will launch 100 ssh sessions to the server hostname1 with the user1 and launch the command uname on each connection.
for i in {1..100}; do (ssh user1@hostname1 uname &) 2>&1; done | grep ssh_exchange| wc -l
