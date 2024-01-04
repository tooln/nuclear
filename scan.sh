#!/bin/bash

NEW='\033[1;38;5;154m'
PINK='\033[1;38;5;013m'
BLUE='\033[1;38;5;012m'
GREEN='\033[1;38;5;040m'
CG='\033[1;38;5;087m'
CPO='\033[1;38;5;205m'

echo -e ${GREEN}"\n"
figlet "N U C L E I +"
echo -e ${GREEN}"v1.0"
echo -e ${CPO}"\nTools: Subdomain Takeover Scanning + Nuclei Templates Scanner\n\n"

echo -n -e ${CG} "\n[+] Enter your Domain: "
read domain

echo -e ${NEW}"\n\nSubdomain Takeover Scanner has started...                       Please wait a little bit...\n\n"
sleep 1
echo -e ${PINK}"\n"
/root/go/bin/subfinder -d $domain -o $domain.txt
echo -e ${GREEN}"\n"
/root/go/bin/subzy run --targets $domain.txt --hide_fails
echo -e ${CPO}"\n\n                  Scanning has finished.\n\n"
sleep 1

echo -e ${NEW}"\n\nHTTPProbe has started...                       Please wait a little bit...\n\n"
sleep 1
echo -e ${PINK}"\n"
cat $domain.txt | /root/go/bin/httpx > $domain.httpx.txt
sleep 1

echo -e ${NEW}"\n\nNuclei Scanning has started...                       Please wait a little bit...\n\n"
sleep 1
echo -e ${PINK}"\n"
/root/go/bin/nuclei -l $domain.httpx.txt -s low -retries 3
echo -e ${GREEN}"\n"
/root/go/bin/nuclei -l $domain.httpx.txt -s medium -retries 3
echo -e ${BLUE}"\n"
/root/go/bin/nuclei -l $domain.httpx.txt -s high -retries 3
echo -e ${CG}"\n"
/root/go/bin/nuclei -l $domain.httpx.txt -s critical -retries 3
echo -e ${CPO}"\n\n                  Scanning has finished.\n\n"
sleep 1
