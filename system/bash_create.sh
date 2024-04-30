#!/bin/bash

# Author: Anderson do Vale 
# Description: This script will register alias command in <~/.bashrc>.
# Version: 1.0

read -p "Register command: " register
read -p "Register acro:" acro

echo "alias "$acro"='"$register"'" >> ~/.bashrc

exec $shell 

