****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_Outcome  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_Outcome0 = 'Predicted: Outcome=0' ;
label P_Outcome1 = 'Predicted: Outcome=1' ;
label Q_Outcome0 = 'Unadjusted P: Outcome=0' ;
label Q_Outcome1 = 'Unadjusted P: Outcome=1' ;
label I_Outcome = 'Into: Outcome' ;
label U_Outcome = 'Unnormalized Into: Outcome' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(DailyStockOpen_PrevDayOpen ) AND
      1.00048419740134 <= DailyStockOpen_PrevDayOpen  THEN DO;
  _NODE_  =                   12;
  _LEAF_  =                    2;
  P_Outcome0  =                    1;
  P_Outcome1  =                    0;
  Q_Outcome0  =                    1;
  Q_Outcome1  =                    0;
  I_Outcome  = '0' ;
  U_Outcome  =                    0;
  END;
ELSE DO;
  _NODE_  =                   11;
  _LEAF_  =                    1;
  P_Outcome0  =                    0;
  P_Outcome1  =                    1;
  Q_Outcome0  =                    0;
  Q_Outcome1  =                    1;
  I_Outcome  = '1' ;
  U_Outcome  =                    1;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
