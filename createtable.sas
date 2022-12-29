libname test 'C:\645\macros';


data test.housing; 
informat Area_type $20.
		City $20.
		Furnishing_status $20.
		Point_of_Contact $20.;
infile 'C:\645\macros\House_Rent_Dataset_clean.csv' dsd; 
input Posted_On	Bedroom	Rent	Size	Floor	Total_floor	Area_type $	Area_locality $	
			City $ Furnishing_Status $ Tenant_Preferred	$ Bathroom	Point_of_Contact $; 
label Bedroom = 'Number of Bedrooms'
		Rent = 'Rent (CAD)'
		Size = 'Size (sq ft)'
		Floor = 'Floor Number'
		Total_Floor = 'Total Floors in Building'
		Area_type = 'Area Type'
		Area_locality = 'Area Locality'
		City = 'City'
		Furnishing_Status = 'Furnishing Status'
		Tenant_Preferred = 'Type of Tenant Preferred'
		Bathroom = 'Number of Bathrooms'
		Point_of_Contact = 'Point of Contact';
 run;
