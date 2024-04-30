#!/bin/bash

# Author: Anderson do Vale 
# Description: This script will help you to use <git push <link> main -f>,
# but just typing link-remote.
# Version: 1.0

echo "git push <link> main -f"
read -p "Enter link: " link

git push $link main -f
