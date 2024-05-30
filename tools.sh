#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Array of colors
colors=($RED $GREEN $YELLOW $BLUE $MAGENTA $CYAN)

# Input lines
lines=(
    "dnstwist -- phishing domain scanner"
    "holehe -- Holehe OSINT - Email to Registered Accounts"
    "crtsh -- Check certificates of a domain"
    "whatsmyname -- Check a username on different social media"
    "ffuf -- FUZZ websites"
    "nmap -- network scanner"
    "subfinder -- enumerate subdomains"
    "httpx -- nextgen http client"
    "notify -- streamline and publish output of tools to multiple locations"
)

# Usage instructions
usages=(
    "USE: dnstwist [Insert Domain]"
    "USE: holehe user@domain.tld"
    "USE: crtsh [Insert Domain]"
    "USE: social [Insert Username]"
    "USE: ffuf [Insert URL]"
    "USE: nmap [Insert IP/Domain]"
    "USE: subfinder -d [Insert Domain]"
    "USE: httpx [Insert URL] -sc -title -fr"
    "USE: notify -bulk"
)

# Print header
echo "================================="
echo "=! Tools available on this box !="
echo "================================="

# Print lines with colored first names
for i in "${!lines[@]}"; do
    line="${lines[$i]}"
    usage="${usages[$i]}"
    color="${colors[$((i % ${#colors[@]}))]}"
    first_name=$(echo "$line" | cut -d' ' -f1)
    rest=$(echo "$line" | cut -d' ' -f2-)
    echo -e "${color}${first_name}${NC} --${rest}"
    echo -e "$usage"
    echo # Add a blank line
done