*------------------------------------------------------------* ;
* Plot2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Change__(ASC) DailyHighestPrice_StockOpenP(ASC) DailyLowest_StockOpen(ASC)
   DailyStockOpen_PrevDayOpen(ASC) High(ASC) Low(ASC) Open(ASC) Outcome(DESC)
   Price(ASC) TDailyStockOpen_PrevClose(ASC)
%mend DMDBClass;
*------------------------------------------------------------*;
* Plot2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.FIMPORT3_train
dmdbcat=WORK.Plot2_DMDB
maxlevel = 23
nonorm
;
class %DMDBClass;
target
Outcome
;
run;
quit;
*------------------------------------------------------------*;
* Plot2: Creating variable by class target charts;
*------------------------------------------------------------*;
goptions ftext="SWISS";
goptions nodisplay device=PNG;
axis1 width=2 offset=(1,1) label=(rotate=90 angle=270) minor=none;
axis2 width=2 minor=none;
pattern1 value=solid;
proc gchart
data=EMWS1.FIMPORT3_train gout=WORK.Plot2GRAPH;
*;
title "Change__ by Outcome";
vbar Change__ /
name = "Change__       x Outcome        " description = "Change__ by Outcome"
FREQ
type=FREQ
subgroup=Outcome
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "DailyHighestPrice_StockOpenP by Outcome";
vbar DailyHighestPrice_StockOpenP /
name = "DailyHighestPrix Outcome        " description = "DailyHighestPrice_StockOpenP by Outcome"
FREQ
type=FREQ
subgroup=Outcome
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "DailyLowest_StockOpen by Outcome";
vbar DailyLowest_StockOpen /
name = "DailyLowest_Stox Outcome        " description = "DailyLowest_StockOpen by Outcome"
FREQ
type=FREQ
subgroup=Outcome
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "DailyStockOpen_PrevDayOpen by Outcome";
vbar DailyStockOpen_PrevDayOpen /
name = "DailyStockOpen_x Outcome        " description = "DailyStockOpen_PrevDayOpen by Outcome"
FREQ
type=FREQ
subgroup=Outcome
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "High by Outcome";
vbar High /
name = "High           x Outcome        " description = "High by Outcome"
FREQ
type=FREQ
subgroup=Outcome
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Low by Outcome";
vbar Low /
name = "Low            x Outcome        " description = "Low by Outcome"
FREQ
type=FREQ
subgroup=Outcome
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Open by Outcome";
vbar Open /
name = "Open           x Outcome        " description = "Open by Outcome"
FREQ
type=FREQ
subgroup=Outcome
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Price by Outcome";
vbar Price /
name = "Price          x Outcome        " description = "Price by Outcome"
FREQ
type=FREQ
subgroup=Outcome
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "TDailyStockOpen_PrevClose by Outcome";
vbar TDailyStockOpen_PrevClose /
name = "TDailyStockOpenx Outcome        " description = "TDailyStockOpen_PrevClose by Outcome"
FREQ
type=FREQ
subgroup=Outcome
noframe
missing
raxis=axis1 maxis=axis2;
run;
quit;
title;
goptions display;
*------------------------------------------------------------*;
* Plot2: Copying graphs to node folder;
*------------------------------------------------------------*;
filename gsasfile "C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Plot2\GRAPH\Change__ by Outcome.png";
goptions device= PNG display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay CHANGE__;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Plot2\GRAPH\DailyHighestPrice_StockOpenP by Outcome.png";
goptions device= PNG display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay DAILYHIG;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Plot2\GRAPH\DailyLowest_StockOpen by Outcome.png";
goptions device= PNG display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay DAILYLOW;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Plot2\GRAPH\DailyStockOpen_PrevDayOpen by Outcome.png";
goptions device= PNG display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay DAILYSTO;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Plot2\GRAPH\High by Outcome.png";
goptions device= PNG display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay HIGH;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Plot2\GRAPH\Low by Outcome.png";
goptions device= PNG display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay LOW;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Plot2\GRAPH\Open by Outcome.png";
goptions device= PNG display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay OPEN;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Plot2\GRAPH\Price by Outcome.png";
goptions device= PNG display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay PRICE;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Plot2\GRAPH\TDailyStockOpen_PrevClose by Outcome.png";
goptions device= PNG display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay TDAILYST;
quit;
goptions device=win;
filename gsasfile;
