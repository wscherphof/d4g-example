#!/bin/bash

schema=$(basename $(pwd))

pg.sh -c "
    create schema ${schema}
    ;
"

pushd 1
mkdir -p shp
unzip *-shp.zip -d shp
pushd shp
shp2pgsql -D -I *.shp "${schema}.firestation" > load.sql
pg.sh -f load.sql
popd
rm -rf shp
popd
