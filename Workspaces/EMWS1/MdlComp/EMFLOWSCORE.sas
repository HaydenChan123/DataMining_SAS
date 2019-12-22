drop _temp_;
if (P_Outcome1 ge 0.99999999999012) then do;
_temp_ = dmran(1234);
b_Outcome = floor(1 + 2*_temp_);
end;
else
if (P_Outcome1 ge 0.99999998678477) then do;
_temp_ = dmran(1234);
b_Outcome = floor(3 + 3*_temp_);
end;
else
if (P_Outcome1 ge 0.99930281304441) then do;
_temp_ = dmran(1234);
b_Outcome = floor(6 + 2*_temp_);
end;
else
if (P_Outcome1 ge 0.99890307603142) then do;
b_Outcome = 8;
end;
else
if (P_Outcome1 ge 0.49987190314548) then do;
_temp_ = dmran(1234);
b_Outcome = floor(9 + 2*_temp_);
end;
else
if (P_Outcome1 ge 0.0028301710704) then do;
b_Outcome = 11;
end;
else
if (P_Outcome1 ge 0.00062273594548) then do;
_temp_ = dmran(1234);
b_Outcome = floor(12 + 2*_temp_);
end;
else
if (P_Outcome1 ge 0.00022696785383) then do;
b_Outcome = 14;
end;
else
if (P_Outcome1 ge 5.9318735386313E-7) then do;
_temp_ = dmran(1234);
b_Outcome = floor(15 + 2*_temp_);
end;
else
if (P_Outcome1 ge 1.2656136623856E-9) then do;
b_Outcome = 17;
end;
else
if (P_Outcome1 ge 3.9438246362919E-10) then do;
_temp_ = dmran(1234);
b_Outcome = floor(18 + 2*_temp_);
end;
else
do;
b_Outcome = 20;
end;
