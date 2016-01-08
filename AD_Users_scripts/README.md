## Steps to launch the scripts:

1. update the file list_accounts with the pair (login, password)
Example:
sftp_toto,GKDONDF334
sftp_bonbon,2VNKSLDKDF
sftp_duck,BNDKQDLKDF
...

2. Change the files sftp_execpt and bulk_sftp_tester to execution mode:
sudo chmod +x sftp_execpt bulk_sftp_tester

3. Execute the file bulk_sftp_tester:
./bulk_sftp_tester
