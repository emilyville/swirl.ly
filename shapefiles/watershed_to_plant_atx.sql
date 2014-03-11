ALTER TABLE watershed ADD COLUMN facility varchar(50);

-- TODO: change watershed for Austin
-- TODO: name1 may need to be changed to DISPLAY_NA

-- North Austin – Walnut Creek Wastewater Treatment Plant --> Walnut Creek
	-- Huck's Slough has an ' in the db but not below
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Huck''s Slough'; 
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Taylor Slough N'; 
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Lady Bird Lake'; 
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Colorado River'; 
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Lake Travis'; 
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Hog Pen';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Elm'; 
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Wilbarger';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Buttermilk';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Waller';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Decker';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Taylor Slough S';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Lockwood';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Johnson';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Fort';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Tannehill';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Buttercup';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Lake Creek';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'S Brushy';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Brushy';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Little Walnut';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Shoal';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'W Bull';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Dry NE';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Harris Branch';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Bull';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Walnut';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Willow';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Gilleland';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Cottonwood';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Rattan';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Boggy';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Steiner';
update watershed set facility = 'Walnut Creek Wastewater Treatment Plant' where name1 = 'Bear W';

-- South Austin – South Austin Regional Wastewater Treatment Plant --> Onion Creek
	-- Harper's Branch has an ' in the db but not below'
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Harper''s Branch'; 
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Cuernavaca'; 
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'St. Stephens'; 
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Lake Austin'; 
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Harrison Hollow'; 
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Commons Ford';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Honey';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Connors';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Dry  N';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Elm Creek South';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Plum';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Cedar';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Rinard';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'S Fork Dry';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Maha';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Little Bear';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'N Fork Dry';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Marble';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Cottonmouth';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Bear';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Onion';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'South Boggy';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Slaughter';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Country Club E';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Carson';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Country Club W';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Blunn';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Williamson';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'E Bouldin';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'W Bouldin';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Eanes';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Little Bee';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Barton';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Bee Creek';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Bohls Hollow';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Little Barton';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Cedar Hollow';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Dry E';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Coldwater';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Harrison Hollow';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Turkey';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Panther Hollow';
update watershed set facility = 'South Austin Regional Wastewater Treatment Plant' where name1 = 'Running Deer';
