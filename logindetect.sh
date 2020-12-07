#!/bin/bash
# Searches auth.log for sudo sessions, ssh logins between 12AM and 6AM, and admin logins
awk '/sud?o?:session/ {print NR," ",$0}' /var/log/auth.log >> /var/log/sec.log
echo -e "\n"
awk '/sshd/ {if($3 < "06"){print NR," ",$0}}' /var/log/auth.log >> /var/log/sec.log
echo -e "\n"
awk '/srosario.$/ {print NR," ",$0}' /var/log/auth.log >> /var/log/sec.log
echo -e "\n"
