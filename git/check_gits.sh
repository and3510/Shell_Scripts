#!/bin/bash

echo "Encontre GIT!"
read -p "Digite o caminho: " caminho

find $caminho -name .git | wc -l 

echo "--------------------------"

find $caminho -name .git



