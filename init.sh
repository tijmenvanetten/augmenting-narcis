#!/bin/bash

mkdir data
mkdir original
mv harvest.2019-05-15.gz ./data/original
gzip -cd ./data/original/harvest.2019-05-15.gz ./data/original/harvest.2019-05-15 
# Upload NARCIS data to MongoDB
docker exec augmenting-narcis_web_1 '/narcis/bin/importmetadata.py'
# Then upload the same data to elastic
docker exec augmenting-narcis_web_1 '/narcis/bin/metadata2elastic.py'
