/* 
1. biblioteki
- SASHELP
- WORK

W Eksploratorze (2 ga ikonka w menu po lewej) 
Dodaj katalog ze swoim loginem z adresu email.

Będzie to katalog z Twoimi danymi i kodami do zajęc

 */

Libname dane '/home/10sasdemo01/sasuser.viya/SZ00001/';

data test;

data work.test2;

data dane.test;


/* Można też sprawdzic info - wyjasnienie tego pozniej  */
%LET LOC = %SYSFUNC(PATHNAME(WORK)); 
%PUT &LOC.; 

%LET LOC2 = %SYSFUNC(PATHNAME(DANE)); 
%PUT &LOC2.; 

/* info do loga */
LIBNAME WORK LIST;
LIBNAME DANE LIST;

/* */



PROC CONTENTS DATA=test;
RUN;

PROC OPTIONS;
RUN;


/* laboratorium 2 */


data t;
x=7; 
run; 

data dane.t1;
x = 5;
run;


data dane.t2;
x = 5;
y = 5.32;
z = 'napis';
run;

data dane.t3;
x =0;
y=1/x;
run;

/* braki danych 

.  - tr numeryczny 
' ' - tr tekstowy
.A - tr specjalny
*/

data dane.t4;
x = 2;
x = 54;
run;

data dane.t5;
x = 2;
output;
x = 54;
run; 

data dane.t6;
x = 2;
output;
x = 54;
output;
run; 

/* co bedzie wynikiem ? */
data a;
x=5;
y=7;
output;
x=6;
y=8;
output;
run;


data dane.t7;
do i=1 to 10;
x = 1;
output;
end;
run;

data dane.t8;
do i=1 to 10;
x = i;
output;
end;
run;

data dane.t9;
do i=1 to 10;
x = floor(100*ranuni(0));
* output;
end;
run;

/* data stepy z jednym przebiegiem */

data dane.t10; * uswtawiamy miejsce docelowe;
set sashelp.cars; * petla glowna;
run;




