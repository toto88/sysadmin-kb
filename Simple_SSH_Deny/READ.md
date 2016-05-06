# Description:
This is a simple tool to Deny SSH attack , the principe consists of:
1. Sweep the ssh log ( /var/log/secure)
2. extract the IP addresses that have more than 10 times failed SSH authentification
3. Add the extracted IP addresses under /etc/hosts.deny


The tool steps is very simple and have any other features like ( fail2ban). 
You could install it under a system that have customer support without any hurdle, because unlike Fail2ban there is no need to install 3rd repository.