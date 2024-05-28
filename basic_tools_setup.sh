#!/bin/bash

# Update package list
sudo apt-get update

# Stop and disable the CUPS service
sudo snap stop cups
sudo snap disable cups

# Install unzip
sudo apt install unzip

# Install python3-pip
sudo apt-get install -y python3-pip

# Create a tools directory and navigate into it
mkdir -p ~/tools
cd ~/tools/

# Clone the crtsh-list repository
git clone https://github.com/ludvikkristoffersen/crtsh-list.git
cd crtsh-list/

# Install the necessary Python packages
sudo apt-get install -y python3-bs4 python3-colorama python3-requests

# Add the shebang line to the top of crtsh-list.py
sed -i '1i#!/usr/bin/env python3' crtsh-list.py

# Make the crtsh-list.py script executable
sudo chmod +x crtsh-list.py

# Move the crtsh-list.py script to /usr/local/bin for easy access
sudo mv crtsh-list.py /usr/local/bin/crtsh-list/

# Add the function for crtsh to ~/.bashrc
echo 'crtsh() { python3 /usr/local/bin/crtsh-list.py -d "$1"; }' >> ~/.bashrc

# Clone the WhatsMyName-Python repository
cd ~/tools/
git clone https://github.com/clausmalver/WhatsMyName-Python.git
cd WhatsMyName-Python/

# Install the necessary Python package
sudo apt-get install -y python3-tqdm

# Make the whatsmyname.py script executable
sudo chmod +x whatsmyname.py

# Move the whatsmyname.py script to /usr/local/bin for easy access
sudo mv ~/tools/WhatsMyName-Python/* /usr/local/bin/WhatsMyName-Python/

# Move the tools.sh script to /usr/local/bin for easy access
cd ~/tools/

# Make the tools.sh script executable
sudo chmod +x tools.sh

# Move the tools.sh script to /usr/local/bin for easy access
sudo mv ~/tools/tools.sh /usr/local/bin

# Clone the holehe repository
git clone https://github.com/megadose/holehe.git
cd holehe/

# Install holehe using setup.py
sudo python3 setup.py install

# Move the holehe script to /usr/local/bin for easy access
sudo mv ~/tools/holehe/* /usr/local/bin/holehe/

# Add the alias for tools to ~/.bashrc
echo 'alias tools="tools.sh"' >> ~/.bashrc

# Add the alias for social to ~/.bashrc
echo 'alias social="whatsmyname.py -u \$1"' >> ~/.bashrc

# Install dnstwist
sudo apt-get install -y dnstwist

# # Download and extract SecLists
# wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip
# sudo mkdir -p /usr/share/wordlists/SecLists/
# sudo unzip SecList.zip -d /usr/share/wordlists/
# sudo mv /usr/share/wordlists/SecLists-master/* /usr/share/wordlists/SecLists/
# sudo rm -rf /usr/share/wordlists/SecLists-master SecList.zip

# Install ffuf
sudo apt-get install -y ffuf

# Install nmap
sudo apt-get install -y nmap

# Install golang
sudo apt-get install -y golang

# Install subfinder
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install httpx
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# Update PATH in ~/.bashrc
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc

# Source the ~/.bashrc to make the aliases and PATH update available immediately
source ~/.bashrc

# Clean up by removing the cloned repositories
rm -rf ~/tools/crtsh-list/
rm -rf ~/tools/WhatsMyName-Python/

