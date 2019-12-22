label M_Price = "Imputation Indicator for Price";
if missing(Price) then M_Price = 1;
else M_Price= 0;
