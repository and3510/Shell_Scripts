#!/bin/bash

echo "git push <link> main -f"
read -p "Enter link: " link

git push $link main -f
