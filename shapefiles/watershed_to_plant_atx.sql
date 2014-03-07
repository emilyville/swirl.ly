ALTER TABLE sfp_watershed ADD COLUMN facility varchar(50);

-- TODO: change sfp_watershed for Austin
-- TODO: name1 may need to be changed to DISPLAY_NA

-- North Austin – Walnut Creek Wastewater Treatment Plant --> Walnut Creek
	-- Huck's Slough has an ' in the db but not below
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Hucks Slough'; 
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Taylor Slough N'; 
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Lady Bird Lake'; 
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Colorado River'; 
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Lake Travis'; 
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Hog Pen';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Elm'; 
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Wilbarger';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Buttermilk';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Waller';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Decker';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Taylor Slough S';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Lockwood';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Johnson';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Fort';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Tannehill';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Buttercup';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Lake Creek';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'S Brushy';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Brushy';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Little Walnut';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Shoal';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'W Bull';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Dry NE';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Harris Branch';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Bull';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Walnut';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Willow';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Gilleland';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Cottonwood';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Rattan';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Boggy';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Steiner';
update sfp_watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Bear W';

-- South Austin – South Austin Regional Wastewater Treatment Plant --> Onion Creek
	-- Harper's Branch has an ' in the db but not below'
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Harpers Branch'; 
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Cuernavaca'; 
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'St. Stephens'; 
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Lake Austin'; 
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Harrison Hollow'; 
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Commons Ford';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Honey';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Connors';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Dry N';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Elm Creek South';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Plum';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Cedar';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Rinard';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'S Fork Dry';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Maha';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Little Bear';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'N Fork Dry';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Marble';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Cottonmouth';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Bear';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Onion';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'South Boggy';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Slaughter';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Country Club E';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Carson';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Country Club W';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Blunn';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Williamson';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'E Bouldin';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'W Bouldin';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Eanes';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Little Bee';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Barton';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Bee Creek';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Bohls Hollow';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Little Barton';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Cedar Hollow';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Dry E';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Coldwater';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Harrison Hollow';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Turkey';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Panther Hollow';
update sfp_watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Running Deer';
