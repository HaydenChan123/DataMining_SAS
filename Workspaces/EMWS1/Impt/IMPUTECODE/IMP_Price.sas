format IMP_Price BEST.;
label IMP_Price = 'Imputed: Price';
IMP_Price = Price;
if missing(Price) then IMP_Price = 71.240416667;
