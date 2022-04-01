#!/bin/bash

scrot -s -q 100 - | xclip -sel clip -target image/png
