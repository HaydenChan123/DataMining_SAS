*------------------------------------------------------------*;
* Reg: Create decision matrix;
*------------------------------------------------------------*;
data WORK.Outcome;
  length   Outcome                          $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
  format   COUNT 10.
           ;
Outcome="1"; COUNT=7; DATAPRIOR=0.52173913043478; TRAINPRIOR=0.53846153846153; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
Outcome="0"; COUNT=6; DATAPRIOR=0.47826086956521; TRAINPRIOR=0.46153846153846; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify Outcome(type=PROFIT label=Outcome);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS1.Impt_TRAIN(keep=
Change__ DailyHighestPrice_StockOpenPrice DailyLowestPrice_StockOpenPrice
DailyStockOpen_PrevClosePrice DailyStockOpen_PrevDayOpen High IMP_Price Low
Open Outcome );
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Outcome(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Change__ DailyHighestPrice_StockOpenPrice DailyLowestPrice_StockOpenPrice
   DailyStockOpen_PrevClosePrice DailyStockOpen_PrevDayOpen High IMP_Price Low
   Open
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
Outcome
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS1.Impt_VALIDATE
outest = EMWS1.Reg_EMESTIMATE
outterms = EMWS1.Reg_OUTTERMS
outmap= EMWS1.Reg_MAPDS namelen=200
;
class
Outcome
;
model Outcome =
Change__
DailyHighestPrice_StockOpenPrice
DailyLowestPrice_StockOpenPrice
DailyStockOpen_PrevClosePrice
DailyStockOpen_PrevDayOpen
High
IMP_Price
Low
Open
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
;
;
score data=EMWS1.Impt_TEST
out=_null_
outfit=EMWS1.Reg_FITTEST
role = TEST
;
code file="C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\Forge 15 i7\Documents\DataMining\DM\Workspaces\EMWS1\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
