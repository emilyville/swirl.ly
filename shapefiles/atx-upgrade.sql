select AddGeometryColumn('watershed', 'geom_4269', 4269, 'MULTIPOLYGON', 2);
-- covert water treatment polygons to points
create table wastewater_plants as sf_wastewater_plant;
grant select on wastewater_plants to swirly;
select AddGeometryColumn('wastewater_plants', 'point_4269', 4269, 'Point', 2);

-- add autin treatment plants
insert into wastewater_plants (name1, point_4269) values ('Walnut Creek Wastewater Treatment Plant', ST_GeomFromText('Point(-97.65253 30.28252)', 4269));
insert into wastewater_plants (name1, point_4269) values ('South Austin Regional Wastewater Treatment Plant', ST_GeomFromText('Point(-97.60464 30.20800)', 4269));

-- add existing columns as points
update wastewater_plants set point_4269 = ST_CENTROID(wastewater_plants.geom_4269) where point_4269 IS NULL;

--rename name column
alter table watershed rename display_na to name1;

--copy data from sfp_watershed table
insert into watershed (name1, geom_4269) select name1, geom_4269 from sfp_watershed;

--add map key column
alter table wastewater_plants add column map_key varchar(50);
update wastewater_plants set map_key = 'emilyville.gb0chmmk' where name1 IN ('Southeast Treatment Plant', 'North Point Wet Weather Treatment Facility', 'Oceanside Treatment Plant');
update wastewater_plants set map_key = 'emilyville.hf313o03' where map_key IS NULL;

alter table wastewater_plants add column map_zoom integer;
update wastewater_plants set map_zoom = 12 where map_key = 'emilyville.gb0chmmk';
update wastewater_plants set map_zoom = 11 where map_key = 'emilyville.hf313o03';
