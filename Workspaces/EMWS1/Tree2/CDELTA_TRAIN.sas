if upcase(NAME) = "DAILYHIGHESTPRICE_STOCKOPENPRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DAILYLOWESTPRICE_STOCKOPENPRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DAILYSTOCKOPEN_PREVCLOSEPRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "HIGH" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "IMP_PRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LOW" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "OPEN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_OUTCOME0" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_OUTCOME1" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
