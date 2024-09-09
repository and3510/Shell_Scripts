#!/bin/bash

echo "Encontre GIT!"
read -p "Digite o caminho: " caminho

var=$(date +%d-%m-%Y)

registro=$(find $caminho -name .git | wc -l )

echo "O numero de gits nesse caminho $caminho na data $var foi $registro " >> /home/anderson/.config/Code/check_gits.log

find $caminho -name .git

clear
echo "O numero de gits nesse caminho $caminho na data $var foi $registro "



