#!/bin/bash

# Author: Anderson do Vale 
# Description: This script will update and upgrade at the same time.
# Version: 1.0

sudo apt update && sudo apt upgrade -y && sudo apt autoclean

clear

echo "Update Done!"
