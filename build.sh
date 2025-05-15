#!/bin/bash
versao=$(git rev-parse HEAD | cut -c1-7)
echo "Versão: $versao"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 194722426008.dkr.ecr.us-east-1.amazonaws.com
docker build -t bia-eb .
docker tag bia-eb:latest 194722426008.dkr.ecr.us-east-1.amazonaws.com/bia-eb:$versao
docker push 194722426008.dkr.ecr.us-east-1.amazonaws.com/bia-eb:$versao
rm .env
./gerar-compose.sh
rm bia-versao-$versao.zip
zip -r bia-versao-$versao.zip docker-compose.yml
git checkout docker-compose.yml