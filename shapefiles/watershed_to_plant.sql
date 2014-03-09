ALTER TABLE watershed ADD COLUMN facility varchar(50);
update watershed set facility = 'Southeast Treatment Plant' where name1 = 'Channel Watershed';
update watershed set facility = 'Southeast Treatment Plant' where name1 = 'Islais Creek Watershed';
update watershed set facility = 'Southeast Treatment Plant' where name1 = 'North Shore Watershed';
update watershed set facility = 'Southeast Treatment Plant' where name1 = 'Yosemite Watershed';
update watershed set facility = 'Southeast Treatment Plant' where name1 = 'Sunnydale Watershed';
update watershed set facility = 'Southeast Treatment Plant' where name1 = 'Presidio Watershed';
update watershed set facility = 'Southeast Treatment Plant' where name1 = 'Black Point Watershed';

update watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Richmond District Watershed';
update watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Lake Merced Watershed';
update watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Sunset Watershed';
update watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Lands End Watershed';
update watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Coyote Gulch Watershed';
update watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Golden Gate Park Watershed';
update watershed set facility = 'Oceanside Treatment Plant' where name1 = 'Ingleside Watershed';
