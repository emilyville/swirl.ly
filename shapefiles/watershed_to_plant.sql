ALTER TABLE sfp_watershed ADD COLUMN facility varchar(50);
update sfp_watershed set facility = 'Southeast Treatment Plant' where name1 = 'Channel Watershed';
update sfp_watershed set facility = 'Southeast Treatment Plant' where name1 = 'Islais Creek Watershed';
update sfp_watershed set facility = 'Southeast Treatment Plant' where name1 = 'North Shore Watershed';
update sfp_watershed set facility = 'Southeast Treatment Plant' where name1 = 'Yosemite Watershed';
update sfp_watershed set facility = 'Southeast Treatment Plant' where name1 = 'Sunnydale Watershed';
update sfp_watershed set facility = 'Southeast Treatment Plant' where name1 = 'Presidio Watershed';
update sfp_watershed set facility = 'Southeast Treatment Plant' where name1 = 'Black Point Watershed';

update sfp_watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Richmond District Watershed';
update sfp_watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Lake Merced Watershed';
update sfp_watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Sunset Watershed';
update sfp_watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Lands End Watershed';
update sfp_watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Coyote Gulch Watershed';
update sfp_watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Golden Gate Park Watershed';
update sfp_watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Ingleside Watershed';
