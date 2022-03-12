#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}[-] Copying Files...${NC}"

cp -r .config $HOME/
cp -r .doom.d $HOME/
sudo cp -r etc/* /etc
sudo cp -r usr/* /usr

echo -e "${GREEN}[+] Finished Copying Files!${NC}"
