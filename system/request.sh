#!/bin/bash


STATUS=$(curl --write-out %{http_code} --silent --output /dev/null https://www.pi.gov.br/)

if [ "$STATUS" -eq 200 ]; then
  echo "A URL está acessível!"
else
  echo "A URL não está acessível. Código de status: $STATUS"
fi

