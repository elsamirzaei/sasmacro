*Term Project;

*Create the macro and create the macro variables;
%macro numexplore (lib=, /*location of library for dataset*/
					ds=, /*name of dataset, sas format*/
					x1=,  /*numerical independent variable 1-5*/
					x2=,
					x3=,
					x4=,
					x5=,
					c1=, /*categorical independent variables 1-6*/
					c2=,
					c3=,
					c4=,
					c5=,
					c6=,
					y=, /*numerical dependent variable*/);

*Initialize the library;
libname explore "&lib";

*Display summary statistics for numerical variables;

title "Summary Statistics for &x1 &x2 &x3 &x4 &x5 for &ds";
proc means data=explore.&ds n nmiss mean std min max Q1 median Q3 QRANGE maxdec = 2;
	var &x1 &x2 &x3 &x4 &x5 &y;
run;

*Increase graphics antialias so all visuals can properly display;
ods graphics/ antialias=on ANTIALIASMAX=10000;


*Run scatters of  of Y vs numerical variables to look for trends;
title "Scatter plot of &y vs &x1";
proc sgplot data=explore.&ds;
	scatter x=&x1 y=&y;
	label;
run;

title "Scatter plot of &y vs &x2";
proc sgplot data=explore.&ds;
	scatter x=&x2 y=&y;
	label;
run;

title "Scatter plot of &y vs &x3";
proc sgplot data=explore.&ds;
	scatter x=&x3 y=&y;
	label;
run;

title "Scatter plot of &y vs &x4";
proc sgplot data=explore.&ds;
	scatter x=&x4 y=&y;
	label;
run;

title "Scatter plot of &y vs &x5";
proc sgplot data=explore.&ds;
	scatter x=&x5 y=&y;
	label;
run;

*Run histograms of numerical variables to look for distributions;

title "Histogram of &x1";
proc sgplot data=explore.&ds;
	histogram &x1;
	density &x1;
	label;
run;

title "Histogram of &x2";
proc sgplot data=explore.&ds;
	histogram &x2;
	density &x2;
	label;
run;

title "Histogram of &x3";
proc sgplot data=explore.&ds;
	histogram &x3;
	density &x3;
	label;
run;

title "Histogram of &x4";
proc sgplot data=explore.&ds;
	histogram &x4;
	density &x4;
	label;
run;

title "Histogram of &x5";
proc sgplot data=explore.&ds;
	histogram &x5;
	density &x5;
	label;
run;

*Generate Correlation Matrix of all numerical variables;
title "Correlation Matrix";
proc corr data=explore.&ds noprob;
label;
run;

*Generate Barcharts of all categorical variables;
title "Barchart of &c1";
proc sgplot data=explore.&ds;
	vbar &c1;
	label;
run;


title "Barchart of &c2";
proc sgplot data=explore.&ds;
	vbar &c2;
	label;
run;

title "Barchart of &c3";S
proc sgplot data=explore.&ds;
	vbar &c3;
	label;
run;

title "Barchart of &c4";
proc sgplot data=explore.&ds;
	vbar &c4;
	label;
run;

title "Barchart of &c5";
proc sgplot data=explore.&ds;
	vbar &c5;
	label;
run;



*Close the macro;
%mend numexplore;

*Call the variables;
%numexplore(lib=C:\645\macros, ds=housing,x1=Bedroom, x2=Size, x3=Floor, x4=Total_floor, x5=Bathroom,c1=Area_type,
c2=City,c3=Furnishing_status,c4=Tenant_preferred,c5=Point_of_Contact,y=rent)
