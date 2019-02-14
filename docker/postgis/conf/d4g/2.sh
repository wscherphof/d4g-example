#!/bin/bash

pg.sh -c "
    create table d4g.tbl_municipality (
        municipality text,
        inhabitants int
    );
    copy d4g.tbl_municipality
        from '$(pwd)/2/municipality.csv'
        with (format csv)
    ;
"

pg.sh -c "
    drop view d4g.vw_firestation
    ;
    create view d4g.vw_firestation as
    with num as (
        select count(*) as num, gemeente
        from d4g.tbl_firestation
        group by gemeente
    ), ratio as (
        select inhabitants / num as ratio, municipality
        from num, d4g.tbl_municipality
        where gemeente = municipality
    )
    select gid as fid, geom, (ratio / 1000)::int as size
    from ratio, d4g.tbl_firestation
    where gemeente = municipality
    ;
"
