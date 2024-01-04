#!/bin/bash

sleep 1
apt update
sleep 1
apt full-upgrade -y
sleep 1
apt autoremove golang-go
sleep 1
rm -rf /usr/local/go
sleep 1
tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz
sleep 1
cd $HOME
sleep 1
echo "export PATH=$PATH:/usr/local/go/bin" | cat >> .profile
sleep 1
source .profile
sleep 1
apt update
sleep 1
apt full-upgrade -y
sleep 1
apt install figlet
sleep 1
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sleep 1
go install -v github.com/LukaSikic/subzy@latest
sleep 1
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sleep 1
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sleep 1
cd .. && cd go && cd bin
sleep 1
./nuclei -up
sleep 1
./nuclei -ut
sleep 1
figlet "Installation Complete..."
