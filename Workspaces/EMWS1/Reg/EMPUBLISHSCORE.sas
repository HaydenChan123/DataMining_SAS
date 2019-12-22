*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_Outcome $ 12;
label I_Outcome = 'Into: Outcome' ;
*** Target Values;
array REGDRF [2] $12 _temporary_ ('1' '0' );
label U_Outcome = 'Unnormalized Into: Outcome' ;
format U_Outcome BEST.;
*** Unnormalized target values;
ARRAY REGDRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check Change__ for missing values ;
if missing( Change__ ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check DailyHighestPrice_StockOpenPrice for missing values ;
if missing( DailyHighestPrice_StockOpenPrice ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check DailyStockOpen_PrevClosePrice for missing values ;
if missing( DailyStockOpen_PrevClosePrice ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check High for missing values ;
if missing( High ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check IMP_Price for missing values ;
if missing( IMP_Price ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.5384615385;
   _P1 = 0.4615384615;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Change__ ;
_TEMP = Change__ ;
_LP0 = _LP0 + (    4973.40690780634 * _TEMP);

***  Effect: DailyHighestPrice_StockOpenPrice ;
_TEMP = DailyHighestPrice_StockOpenPrice ;
_LP0 = _LP0 + (    8063.06411174407 * _TEMP);

***  Effect: DailyStockOpen_PrevClosePrice ;
_TEMP = DailyStockOpen_PrevClosePrice ;
_LP0 = _LP0 + (   -1384.96677266243 * _TEMP);

***  Effect: High ;
_TEMP = High ;
_LP0 = _LP0 + (    6.30605748611961 * _TEMP);

***  Effect: IMP_Price ;
_TEMP = IMP_Price ;
_LP0 = _LP0 + (    1.46002939456384 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -7243.96594230482 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REGDR1:


*** Posterior Probabilities and Predicted Level;
label P_Outcome1 = 'Predicted: Outcome=1' ;
label P_Outcome0 = 'Predicted: Outcome=0' ;
P_Outcome1 = _P0;
_MAXP = _P0;
_IY = 1;
P_Outcome0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_Outcome = REGDRF[_IY];
U_Outcome = REGDRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
