* Written by R;
*  write.foreign(df, "c:/SASDATA/Chicago_Crimes_2012_to_2017_2.txt",  ;

DATA  rdata

(drop = 
 IUCR
 FBI_Code
 Updated_On
);
LENGTH
 Case_Number $ 9
 Block $ 35
 IUCR $ 4
 Primary_Type $ 33
 Description $ 59
 Location_Description $ 47
 FBI_Code $ 3
 Updated_On $ 22
 Location $ 29
 YearMon $ 7
;

INFORMAT
 Date
 YYMMDD10.
;

INFILE  "\\Client\C$\SASDATA\Chicago_Crimes_2012_to_2017_2.txt" 
     DSD 
     LRECL= 327 ;
INPUT
 V1
 ID
 Case_Number
 Date
 Block
 IUCR
 Primary_Type
 Description
 Location_Description
 Arrest
 Domestic
 Beat
 District
 Ward
 Community_Area
 FBI_Code
 X_Coordinate
 Y_Coordinate
 Year
 Updated_On
 Latitude
 Longitude
 Location
 Month
 YearMon $ 
;
LABEL  Case_Number = "Case Number" ;
LABEL  Primary_Type = "Primary Type" ;
LABEL  Location_Description = "Location Description" ;
LABEL  Community_Area = "Community Area" ;
LABEL  FBI_Code = "FBI Code" ;
LABEL  X_Coordinate = "X Coordinate" ;
LABEL  Y_Coordinate = "Y Coordinate" ;
LABEL  Updated_On = "Updated On" ;
FORMAT Date yymmdd10.;
RUN;

Data rdata; set rdata;
if year = 2017 then delete; run;

/*
     POPULATION METRICS

*/

/* ON AVERAGE, WHAT THE MOST CRIME? */
/* random sample*/
proc sql; create table ctype as select year,
case        when year = 2012 then 1
			when year = 2013 then 2
			when year = 2014 then 3
			when year = 2015 then 4
			when year = 2016 then 5
end  as stratums
,month, Primary_Type as Crime, Count(*) as CrimeN from rdata
group by year, month, Primary_Type;


proc means data = ctype  mean clm sum std N;
class crime;
VAR CrimeN;
run;
* AVERAGE NUMBER OF CRIMES PER MONTH;
			* THIS CREATES AN EXCEL WORKBOOK WITH POP RESULTS;
ods excel file="\\Client\C$\SASDATA\POPMeansOutput.xlsx"; 
proc sort; data = ctype; by crime;
	proc means data = ctype  mean clm sum std N;
	VAR CrimeN; 
	by crime;
	run;
ods excel close;




/*
     SIMPLE RANDOM SAMPLE

*/

proc surveyselect data = ctype out = srssample sampsize = 651
seed = 91114 stats; title "Simple random sample"; run; 
PROC SORT DATA = SRSSAMPLE; BY YEAR MONTH Crime;
proc print  data = srssample (obs = 5);
run;
proc surveymeans data = srssample total = 1725   mean  clm sum CLSUM var;
var Crime CrimeN; 
weight SamplingWeight; 
ods output Statistics=MyStat;
title "Simple random sample"; run;

* REMEMBER CRIMEN IS MEAN CRIME IS PROPORTIONS;
ods excel file="\\Client\C$\SASDATA\srsOutput.xlsx"; 
proc print data = MYstat; run;
ods excel close;


/*
     STRATIFIED RANDOM SAMPLE

*/

*Strat by year;
proc freq data = ctype ; table year/NOCUM ; run;



proc surveyselect data=ctype method = srs out = str1sample
sampsize = ( 232,234,247,257,250) seed = 91114;
strata  stratums ;title "Proportional allocation";
run;

PROC SORT DATA = SRSSAMPLE; BY YEAR,CRIME ;
proc means data = srssample;
var CrimeN; BY Crime Year; run;


proc sql; create table strats as
select case when year = 2012 then 1
			when year = 2013 then 2
			when year = 2014 then 3
			when year = 2015 then 4
			when year = 2016 then 5
end  as stratums
,count(*) as _Total_
from ctype
group by year;

ods excel file="\\Client\C$\SASDATA\StratMeans.xlsx"; 
proc surveymeans data = str1sample sum clsum total = strats mean clm sum CLSUM std;
var CrimeN Crime;
weight SamplingWeight;
strata stratums /list;
title "Proportional allocation"; run;


ODS excel close;




* START 5 SAMPLE RUN OF EACH MODEL 
* START 5 SAMPLE RUN OF EACH MODEL 
* START 5 SAMPLE RUN OF EACH MODEL ;



proc surveyselect data = ctype out = srssample sampsize = 1222
 stats; title "Simple random sample"; run; 
PROC SORT DATA = SRSSAMPLE; BY YEAR MONTH Crime;
proc print  data = srssample (obs = 5);
run;
proc surveymeans data = srssample total = 1725   mean  clm sum CLSUM var;
var Crime CrimeN; 
weight SamplingWeight; 
ods output Statistics=MyStat;
title "Simple random sample"; run;

/* NOTE RUN THIS FIVE TIMES:   
FIRST RUN: THE "set" statement for the first run should be "set MYSTAT"
THEN CHANGE IT BACK TO "MY5SRS MYSTAT" FOR RUNS 2-5;
*/

DATA MY5srs; set MY5srs myStat; RUN;

ods excel file="\\Client\C$\SASDATA\SRS5Output.xlsx"; 
proc print data = mY5SRS; run;
ODS excel close;


*Strat by year;

proc surveyselect data=ctype method = srs out = str1sample
sampsize = ( 232,234,247,257,250);
strata  stratums ;title "Proportional allocation";
run;

proc sql; create table strats as
select case when year = 2012 then 1
			when year = 2013 then 2
			when year = 2014 then 3
			when year = 2015 then 4
			when year = 2016 then 5
end  as stratums
,count(*) as _Total_
from ctype
group by year;

proc surveymeans data = str1sample sum clsum total = strats mean clm sum CLSUM std;
var CrimeN; 
weight SamplingWeight;
strata stratums /list;
ods output Statistics=MyStat;
title "Proportional allocation"; run;

/* NOTE RUN THIS FIVE TIMES:   
FIRST RUN: THE "set" statement for the first run should be "set MYSTAT"
THEN CHANGE IT BACK TO "MY5STR MYSTAT" FOR RUNS 2-5;
*/
DATA MY5STR; set MY5STR MYSTAT; RUN;





ods excel file="\\Client\C$\SASDATA\Str5Output.xlsx"; 
proc print data = mY5Str; run;
ODS excel close;




