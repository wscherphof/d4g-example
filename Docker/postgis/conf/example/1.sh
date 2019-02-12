#!/bin/bash

schema=$(basename $(pwd))

pg.sh -c "
    create schema ${schema}
    ;
"

mkdir -p ./1/shp
unzip ./1/*-shp.zip -d ./1/shp
shp2pgsql -D -I ./1/shp/*.shp example.firestation > ./1/load.sql
pg.sh -f ./1/load.sql
rm -rf ./1/shp
