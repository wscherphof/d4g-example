#!/bin/bash

pg.sh -c "
    create table d4g.municipality (
        municipality text,
        inhabitants int
    );
    copy d4g.municipality
        from '$(pwd)/2/municipality.csv'
        with (format csv)
    ;
"
