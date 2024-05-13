#!/bin/bash

# Author: Anderson do Vale 
# Description: This script will help you to add link-remote as
# input without typing before "git remote add origin".
# Version: 1.0



echo "git remote add origin <link>"
read -p "Enter link: " link

git remote add origin $link



