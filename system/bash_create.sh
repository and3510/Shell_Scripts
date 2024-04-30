#!/bin/bash

read -p "Register command: " register
read -p "Register acro:" acro

echo "alias "$acro"='"$register" '" >> ~/.bashrc

exec $shell 

