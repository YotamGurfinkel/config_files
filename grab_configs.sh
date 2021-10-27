#!/usr/bin/env bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

home_len=${#HOME}

folders_to_copy=(
    "$HOME/.config/polybar/shapes"
    "$HOME/.config/polybar/pwidgets"
    "$HOME/.doom.d"
)

files_to_copy=(
    "$HOME/.config/i3/config"
    "$HOME/.config/polybar/launch.sh"
    "$HOME/.config/spotifyd/spotifyd.conf"
    "/etc/lightdm/lightdm.conf"
    "/usr/share/lightdmxrandr.sh"
    "/usr/share/X11/xorg.conf.d/10-ultrawide.conf"
)

echo -e "${BLUE}[-] Copying Folders...${NC}"

for f in ${folders_to_copy[@]}
do
    if [ "${f##/home/}" != "${f}" ]
    then
        cp -r $f $(dirname ${f:$home_len+1})
    else
        cp -r $f $(dirname ${f:1})
    fi
done

echo -e "${BLUE}[-] Copying Individual Files...${NC}"

for f in ${files_to_copy[@]}
do
    if [ "${f##/home/}" != "${f}" ]
    then
        cp $f ${f:$home_len+1}
    else
        cp $f ${f:1}
    fi
done

echo -e "${GREEN}[+] Finished Updating Files!${NC}"
