## Info:

This Scripts is to sum up the list of process whose running for more than 24 hours.

We can found those two Files below:

* Script last24_procs: is to make some filtering on PS command to output the process running UP to 24 hours.
* Script last24_procs_sender: for sending the result of the scripts by mail ( we can specify this script in a crontab for a recurrent task)

## Setup:

* run "chmod +x" on both scripts.
* add the script last24_procs_sender into the crontab to send the results by mail.
