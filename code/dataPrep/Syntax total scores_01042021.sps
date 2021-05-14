* Encoding: UTF-8.

*12 weeks.

*EDS 12 weeks (higher scores indicate more depressive symptoms).
*Recode.
recode eds_1_12 eds_2_12 eds_4_12 (1=0) (2=1) (3=2) (4=3). 
recode eds_3_12 eds_5_12 eds_6_12 eds_7_12 eds_8_12 eds_9_12 eds_10_12 (4=0) (3=1) (2=2) (1=3).
*Total score.
compute EDS10_12= eds_1_12 + eds_2_12 + eds_3_12 + eds_4_12 + eds_5_12 + eds_6_12 + eds_7_12 + eds_8_12 + eds_9_12 + eds_10_12.
execute.
recode EDS10_12 (SYSMIS=999).
MISSING VALUES EDS10_12 (999).
fre EDS10_12.

*TPDS-NA 12 weeks (higher scores indicate more pregnancy-specific distress).
*Eerst hercoderen.
recode tpds_na_1_12 tpds_na_2_12 tpds_na_3_12 tpds_na_4_12 tpds_na_5_12 tpds_na_6_12 tpds_na_7_12 tpds_na_8_12 tpds_na_9_12 tpds_na_10_12 (4=0) (3=1) (2=2) (1=3).
*Totaalscore.
compute TPDS_NA_12=  tpds_na_1_12 + tpds_na_2_12 + tpds_na_3_12 + tpds_na_4_12 + tpds_na_5_12 + tpds_na_6_12 + tpds_na_7_12 + tpds_na_8_12 + tpds_na_9_12 + tpds_na_10_12.
execute.
recode TPDS_NA_12 (SYSMIS=999).
MISSING VALUES TPDS_NA_12 (999).
fre TPDS_NA_12.

*16 weeks.

*TFMQ-SF 16 weken (higher scores indicate more mindfulness).

*Recode 12 items.
recode TFMQitem2_16 TFMQitem4_16 TFMQitem5_16 TFMQitem7_16 TFMQitem8_16 TFMQitem9_16 
TFMQitem11_16 TFMQitem12_16 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score 12 items.
compute TFMQtot_16 = TFMQitem1_16 + TFMQitem2_16 + TFMQitem3_16 + TFMQitem4_16 + TFMQitem5_16 + TFMQitem6_16 + TFMQitem7_16 +
 TFMQitem8_16 + TFMQitem9_16 + TFMQitem10_16 + TFMQitem11_16 + TFMQitem12_16.
execute.
recode TFMQtot_16 (SYSMIS=999).
MISSING VALUES TFMQtot_16 (999).

*Total scores 3 subscales (12 items) (non reacting; non judging; acting with awareness).
compute TFMQNR_16 = TFMQitem1_16 + TFMQitem3_16 + TFMQitem6_16 + TFMQitem10_16.
execute.
recode TFMQNR_16 (SYSMIS=999).
MISSING VALUES TFMQNR_16 (999).
compute TFMQNJ_16 = TFMQitem2_16 + TFMQitem4_16 + TFMQitem7_16 +  TFMQitem9_16.
execute.
recode TFMQNJ_16 (SYSMIS=999).
MISSING VALUES TFMQNJ_16 (999).
compute TFMQaware_16 = TFMQitem5_16 + TFMQitem8_16 + TFMQitem11_16 + TFMQitem12_16.
EXECUTE.
recode TFMQaware_16 (SYSMIS=999).
MISSING VALUES TFMQaware_16 (999).

fre TFMQtot_16 TFMQNR_16 TFMQNJ_16 TFMQaware_16.

*Recode for 15 items.
recode Q13_3 Q15_5 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score 15 items.
compute TFMQ15tot_16 = TFMQitem1_16 + TFMQitem2_16 + TFMQitem3_16 + TFMQitem4_16 + TFMQitem5_16 + TFMQitem6_16 + TFMQitem7_16 +
 TFMQitem8_16 + TFMQitem9_16 + TFMQitem10_16 + TFMQitem11_16 + TFMQitem12_16 + Q13_3 + Q15_5 + Q15_6.
execute.
recode TFMQ15tot_16 (SYSMIS=999).
MISSING VALUES TFMQ15tot_16 (999).

*Total scores 3 subscales (15 items) (non reacting; non judging; acting with awareness).
compute TFMQ15NR_16 = TFMQitem1_16 + TFMQitem3_16 + TFMQitem6_16 + TFMQitem10_16 + Q15_6.
execute.
recode TFMQ15NR_16 (SYSMIS=999).
MISSING VALUES TFMQ15NR_16 (999).
compute TFMQ15NJ_16 = TFMQitem2_16 + TFMQitem4_16 + TFMQitem7_16 +  TFMQitem9_16 + Q15_5.
execute.
recode TFMQ15NJ_16 (SYSMIS=999).
MISSING VALUES TFMQ15NJ_16 (999).
compute TFMQ15aware_16 = TFMQitem5_16 + TFMQitem8_16 + TFMQitem11_16 + TFMQitem12_16 + Q13_3.
EXECUTE.
recode TFMQ15aware_16 (SYSMIS=999).
MISSING VALUES TFMQ15aware_16 (999).

fre TFMQ15tot_16 TFMQ15NR_16 TFMQ15NJ_16 TFMQ15aware_16.

*RRQ 16 weeks (higher scores indicate more rumination).

*Recode.
recode RRQitem6_16 RRQitem9_16 RRQitem10_16 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score.
compute RRQ_16 = RRQitem1_16 + RRQitem2_16 + RRQitem3_16 + RRQitem4_16 + RRQitem5_16 + RRQitem6_16 + RRQitem7_16 +
 RRQitem8_16 + RRQitem9_16 + RRQitem10_16 + RRQitem11_16 + RRQitem12_16.
execute.
recode RRQ_16 (SYSMIS=999).
MISSING VALUES RRQ_16 (999).
fre RRQ_16.

*SCS-SF 16 weeks (higher scores indicate more self-compassion).

*Recode.
recode SCSitem1_16 SCSitem4_16 SCSitem8_16 SCSitem9_16 SCSitem11_16 SCSitem12_16 (1=7) (2=6) (3=5) (5=3) (6=2) (7=1).
execute. 

*Total score.
compute SCS_16 = SCSitem1_16 + SCSitem2_16 + SCSitem3_16 + SCSitem4_16 + SCSitem5_16 + SCSitem6_16 + SCSitem7_16 +
 SCSitem8_16 + SCSitem9_16 + SCSitem10_16 + SCSitem11_16 + SCSitem12_16.
execute.
recode SCS_16 (SYSMIS=999).
MISSING VALUES SCS_16 (999).
fre SCS_16.

*20 weeks.

*EDS 20 weeks.
*Recode.
recode eds_1_20 eds_2_20 eds_4_20 (1=0) (2=1) (3=2) (4=3). 
recode eds_3_20 eds_5_20 eds_6_20 eds_7_20 eds_8_20 eds_9_20 eds_10_20 (4=0) (3=1) (2=2) (1=3).
*Total score.
compute EDS10_20= eds_1_20 + eds_2_20 + eds_3_20 + eds_4_20 + eds_5_20 + eds_6_20 + eds_7_20 + eds_8_20 + eds_9_20 + eds_10_20.
execute.
recode EDS10_20 (SYSMIS=999).
MISSING VALUES EDS10_20 (999).
fre EDS10_20.

*TPDS-NA 20 weeks.
*Recode.
recode tpds_na_1_20 tpds_na_2_20 tpds_na_3_20 tpds_na_4_20 tpds_na_5_20 tpds_na_6_20 tpds_na_7_20 tpds_na_8_20 tpds_na_9_20 tpds_na_10_20 (4=0) (3=1) (2=2) (1=3).
*Total score.
compute TPDS_NA_20=  tpds_na_1_20 + tpds_na_2_20 + tpds_na_3_20 + tpds_na_4_20 + tpds_na_5_20 + tpds_na_6_20 + tpds_na_7_20 + tpds_na_8_20 + tpds_na_9_20 + tpds_na_10_20.
execute.
recode TPDS_NA_20 (SYSMIS=999).
MISSING VALUES TPDS_NA_20 (999).
fre TPDS_NA_20.

*TFMQ-SF 20 weeks.

*Recode.
recode TFMQitem2_20 TFMQitem4_20 TFMQitem5_20 TFMQitem7_20 TFMQitem8_20 TFMQitem9_20 
TFMQitem11_20 TFMQitem12_20 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score 12 items.
compute TFMQtot_20 = TFMQitem1_20 + TFMQitem2_20 + TFMQitem3_20 + TFMQitem4_20 + TFMQitem5_20 + TFMQitem6_20 + TFMQitem7_20 +
 TFMQitem8_20 + TFMQitem9_20 + TFMQitem10_20 + TFMQitem11_20 + TFMQitem12_20.
execute.
recode TFMQtot_20 (SYSMIS=999).
MISSING VALUES TFMQtot_20 (999).

*Total scores 3 subscales (12 items) (non reacting; non judging; acting with awareness).
compute TFMQNR_20 = TFMQitem1_20 + TFMQitem3_20 + TFMQitem6_20 + TFMQitem10_20.
execute.
recode TFMQNR_20 (SYSMIS=999).
MISSING VALUES TFMQNR_20 (999).
compute TFMQNJ_20 = TFMQitem2_20 + TFMQitem4_20 + TFMQitem7_20 +  TFMQitem9_20.
execute.
recode TFMQNJ_20 (SYSMIS=999).
MISSING VALUES TFMQNJ_20 (999).
compute TFMQaware_20 = TFMQitem5_20 + TFMQitem8_20 + TFMQitem11_20 + TFMQitem12_20.
EXECUTE.
recode TFMQaware_20 (SYSMIS=999).
MISSING VALUES TFMQaware_20 (999).

fre TFMQtot_20 TFMQNR_20 TFMQNJ_20 TFMQaware_20.

*Recode for 15 items.
recode Q50_3 Q52_5 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score 15 items.
compute TFMQ15tot_20 = TFMQitem1_20 + TFMQitem2_20 + TFMQitem3_20 + TFMQitem4_20 + TFMQitem5_20 + TFMQitem6_20 + TFMQitem7_20 +
 TFMQitem8_20 + TFMQitem9_20 + TFMQitem10_20 + TFMQitem11_20 + TFMQitem12_20 + Q50_3 + Q52_5 + Q52_6.
execute.
recode TFMQ15tot_20 (SYSMIS=999).
MISSING VALUES TFMQ15tot_20 (999).

*Total scores 3 subscales (15 items) (non reacting; non judging; acting with awareness).
compute TFMQ15NR_20 = TFMQitem1_20 + TFMQitem3_20 + TFMQitem6_20 + TFMQitem10_20 + Q52_6.
execute.
recode TFMQ15NR_20 (SYSMIS=999).
MISSING VALUES TFMQ15NR_20 (999).
compute TFMQ15NJ_20 = TFMQitem2_20 + TFMQitem4_20 + TFMQitem7_20 +  TFMQitem9_20 + Q52_5.
execute.
recode TFMQ15NJ_20 (SYSMIS=999).
MISSING VALUES TFMQ15NJ_20 (999).
compute TFMQ15aware_20 = TFMQitem5_20 + TFMQitem8_20 + TFMQitem11_20 + TFMQitem12_20 + Q50_3.
EXECUTE.
recode TFMQ15aware_20 (SYSMIS=999).
MISSING VALUES TFMQ15aware_20 (999).

fre TFMQ15tot_20 TFMQ15NR_20 TFMQ15NJ_20 TFMQ15aware_20.

*RRQ 20 weeks.

*Recode.
recode RRQitem6_20 RRQitem9_20 RRQitem10_20 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score.
compute RRQ_20 = RRQitem1_20 + RRQitem2_20 + RRQitem3_20 + RRQitem4_20 + RRQitem5_20 + RRQitem6_20 + RRQitem7_20 +
 RRQitem8_20 + RRQitem9_20 + RRQitem10_20 + RRQitem11_20 + RRQitem12_20.
execute.
recode RRQ_20 (SYSMIS=999).
MISSING VALUES RRQ_20 (999).
fre RRQ_20.

*SCS-SF 20 weeks.

*Recode.
recode SCSitem1_20 SCSitem4_20 SCSitem8_20 SCSitem9_20 SCSitem11_20 SCSitem12_20 (1=7) (2=6) (3=5) (5=3) (6=2) (7=1).
execute. 

*Total score.
compute SCS_20 = SCSitem1_20 + SCSitem2_20 + SCSitem3_20 + SCSitem4_20 + SCSitem5_20 + SCSitem6_20 + SCSitem7_20 +
 SCSitem8_20 + SCSitem9_20 + SCSitem10_20 + SCSitem11_20 + SCSitem12_20.
execute.
recode SCS_20 (SYSMIS=999).
MISSING VALUES SCS_20 (999).
fre SCS_20.

*28 weeks.

*EDS 28 weeks.
*Recode.
recode eds_1_28 eds_2_28 eds_4_28 (1=0) (2=1) (3=2) (4=3). 
recode eds_3_28 eds_5_28 eds_6_28 eds_7_28 eds_8_28 eds_9_28 eds_10_28 (4=0) (3=1) (2=2) (1=3).
*Total score.
compute EDS10_28= eds_1_28 + eds_2_28 + eds_3_28 + eds_4_28 + eds_5_28 + eds_6_28 + eds_7_28 + eds_8_28 + eds_9_28 + eds_10_28.
execute.
recode EDS10_28 (SYSMIS=999).
MISSING VALUES EDS10_28 (999).
fre EDS10_28.

*TPDS-NA 28 weeks.
*Recode.
recode tpds_na_1_28 tpds_na_2_28 tpds_na_3_28 tpds_na_4_28 tpds_na_5_28 tpds_na_6_28 tpds_na_7_28 tpds_na_8_28 tpds_na_9_28 tpds_na_10_28 (4=0) (3=1) (2=2) (1=3).
*Total score.
compute TPDS_NA_28=  tpds_na_1_28 + tpds_na_2_28 + tpds_na_3_28 + tpds_na_4_28 + tpds_na_5_28 + tpds_na_6_28 + tpds_na_7_28 + tpds_na_8_28 + tpds_na_9_28 + tpds_na_10_28.
execute.
recode TPDS_NA_28 (SYSMIS=999).
MISSING VALUES TPDS_NA_28 (999).
fre TPDS_NA_28.

*TFMQ-SF 28 weeks.
*Recode.
recode TFMQitem2_28 TFMQitem4_28 TFMQitem5_28 TFMQitem7_28 TFMQitem8_28 TFMQitem9_28 
TFMQitem11_28 TFMQitem12_28 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score 12 items.
compute TFMQtot_28 = TFMQitem1_28 + TFMQitem2_28 + TFMQitem3_28 + TFMQitem4_28 + TFMQitem5_28 + TFMQitem6_28 + TFMQitem7_28 +
 TFMQitem8_28 + TFMQitem9_28 + TFMQitem10_28 + TFMQitem11_28 + TFMQitem12_28.
execute.
recode TFMQtot_28 (SYSMIS=999).
MISSING VALUES TFMQtot_28 (999).

*Total scores 3 subscales (12 items) (non reacting; non judging; acting with awareness).
compute TFMQNR_28 = TFMQitem1_28 + TFMQitem3_28 + TFMQitem6_28 + TFMQitem10_28.
execute.
recode TFMQNR_28 (SYSMIS=999).
MISSING VALUES TFMQNR_28 (999).
compute TFMQNJ_28 = TFMQitem2_28 + TFMQitem4_28 + TFMQitem7_28 +  TFMQitem9_28.
execute.
recode TFMQNJ_28 (SYSMIS=999).
MISSING VALUES TFMQNJ_28 (999).
compute TFMQaware_28 = TFMQitem5_28 + TFMQitem8_28 + TFMQitem11_28 + TFMQitem12_28.
EXECUTE.
recode TFMQaware_28 (SYSMIS=999).
MISSING VALUES TFMQaware_28 (999).

fre TFMQtot_28 TFMQNR_28 TFMQNJ_28 TFMQaware_28.

*Recode for 15 items.
recode Q115_3 Q117_5 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score 15 items.
compute TFMQ15tot_28 = TFMQitem1_28 + TFMQitem2_28 + TFMQitem3_28 + TFMQitem4_28 + TFMQitem5_28 + TFMQitem6_28 + TFMQitem7_28 +
 TFMQitem8_28 + TFMQitem9_28 + TFMQitem10_28 + TFMQitem11_28 + TFMQitem12_28 + Q115_3 + Q117_5 + Q117_6.
execute.
recode TFMQ15tot_28 (SYSMIS=999).
MISSING VALUES TFMQ15tot_28 (999).

*Total scores 3 subscales (15 items) (non reacting; non judging; acting with awareness).
compute TFMQ15NR_28 = TFMQitem1_28 + TFMQitem3_28 + TFMQitem6_28 + TFMQitem10_28 + Q117_6.
execute.
recode TFMQ15NR_28 (SYSMIS=999).
MISSING VALUES TFMQ15NR_28 (999).
compute TFMQ15NJ_28 = TFMQitem2_28 + TFMQitem4_28 + TFMQitem7_28 +  TFMQitem9_28 + Q117_5.
execute.
recode TFMQ15NJ_28 (SYSMIS=999).
MISSING VALUES TFMQ15NJ_28 (999).
compute TFMQ15aware_28 = TFMQitem5_28 + TFMQitem8_28 + TFMQitem11_28 + TFMQitem12_28 + Q115_3.
EXECUTE.
recode TFMQ15aware_28 (SYSMIS=999).
MISSING VALUES TFMQ15aware_28 (999).

fre TFMQ15tot_28 TFMQ15NR_28 TFMQ15NJ_28 TFMQ15aware_28.


*RRQ 28 weeks.

*Recode.
recode RRQitem6_28 RRQitem9_28 RRQitem10_28 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score.
compute RRQ_28 = RRQitem1_28 + RRQitem2_28 + RRQitem3_28 + RRQitem4_28 + RRQitem5_28 + RRQitem6_28 + RRQitem7_28 +
 RRQitem8_28 + RRQitem9_28 + RRQitem10_28 + RRQitem11_28 + RRQitem12_28.
execute.
recode RRQ_28 (SYSMIS=999).
MISSING VALUES RRQ_28 (999).
fre RRQ_28.

*SCS-SF 28 weeks.

*Recode.
recode SCSitem1_28 SCSitem4_28 SCSitem8_28 SCSitem9_28 SCSitem11_28 SCSitem12_28 (1=7) (2=6) (3=5) (5=3) (6=2) (7=1).
execute. 

*Total score.
compute SCS_28 = SCSitem1_28 + SCSitem2_28 + SCSitem3_28 + SCSitem4_28 + SCSitem5_28 + SCSitem6_28 + SCSitem7_28 +
 SCSitem8_28 + SCSitem9_28 + SCSitem10_28 + SCSitem11_28 + SCSitem12_28.
execute.
recode SCS_28 (SYSMIS=999).
MISSING VALUES SCS_28 (999).
fre SCS_28.

*36 weeks.

*EDS 36 weeks.
*Recode.
recode eds_1_36 eds_2_36 eds_4_36 (1=0) (2=1) (3=2) (4=3). 
recode eds_3_36 eds_5_36 eds_6_36 eds_7_36 eds_8_36 eds_9_36 eds_10_36 (4=0) (3=1) (2=2) (1=3).
*Total score.
compute EDS10_36= eds_1_36 + eds_2_36 + eds_3_36 + eds_4_36 + eds_5_36 + eds_6_36 + eds_7_36 + eds_8_36 + eds_9_36 + eds_10_36.
execute.
recode EDS10_36 (SYSMIS=999).
MISSING VALUES EDS10_36 (999).
fre EDS10_36.

*TPDS-NA 36 weeks.
*Recode.
recode tpds_na_1_36 tpds_na_2_36 tpds_na_3_36 tpds_na_4_36 tpds_na_5_36 tpds_na_6_36 tpds_na_7_36 tpds_na_8_36 tpds_na_9_36 tpds_na_10_36 (4=0) (3=1) (2=2) (1=3).
*Total score.
compute TPDS_NA_36=  tpds_na_1_36 + tpds_na_2_36 + tpds_na_3_36 + tpds_na_4_36 + tpds_na_5_36 + tpds_na_6_36 + tpds_na_7_36 + tpds_na_8_36 + tpds_na_9_36 + tpds_na_10_36.
execute.
recode TPDS_NA_36 (SYSMIS=999).
MISSING VALUES TPDS_NA_36 (999).
fre TPDS_NA_36.

*TFMQ-SF 36 weeks.

*Recode.
recode TFMQitem2_36 TFMQitem4_36 TFMQitem5_36 TFMQitem7_36 TFMQitem8_36 TFMQitem9_36 
TFMQitem11_36 TFMQitem12_36 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score 12 items.
compute TFMQtot_36 = TFMQitem1_36 + TFMQitem2_36 + TFMQitem3_36 + TFMQitem4_36 + TFMQitem5_36 + TFMQitem6_36 + TFMQitem7_36 +
 TFMQitem8_36 + TFMQitem9_36 + TFMQitem10_36 + TFMQitem11_36 + TFMQitem12_36.
execute.
recode TFMQtot_36 (SYSMIS=999).
MISSING VALUES TFMQtot_36 (999).

*Total scores 3 subscales (12 items) (non reacting; non judging; acting with awareness).
compute TFMQNR_36 = TFMQitem1_36 + TFMQitem3_36 + TFMQitem6_36 + TFMQitem10_36.
execute.
recode TFMQNR_36 (SYSMIS=999).
MISSING VALUES TFMQNR_36 (999).
compute TFMQNJ_36 = TFMQitem2_36 + TFMQitem4_36 + TFMQitem7_36 +  TFMQitem9_36.
execute.
recode TFMQNJ_36 (SYSMIS=999).
MISSING VALUES TFMQNJ_36 (999).
compute TFMQaware_36 = TFMQitem5_36 + TFMQitem8_36 + TFMQitem11_36 + TFMQitem12_36.
EXECUTE.
recode TFMQaware_36 (SYSMIS=999).
MISSING VALUES TFMQaware_36 (999).

fre TFMQtot_36 TFMQNR_36 TFMQNJ_36 TFMQaware_36.

*Recode for 15 items.
recode Q32_3 Q34_5 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score 15 items.
compute TFMQ15tot_36 = TFMQitem1_36 + TFMQitem2_36 + TFMQitem3_36 + TFMQitem4_36 + TFMQitem5_36 + TFMQitem6_36 + TFMQitem7_36 +
 TFMQitem8_36 + TFMQitem9_36 + TFMQitem10_36 + TFMQitem11_36 + TFMQitem12_36 + Q32_3 + Q34_5 + Q34_6.
execute.
recode TFMQ15tot_36 (SYSMIS=999).
MISSING VALUES TFMQ15tot_36 (999).

*Total scores 3 subscales (15 items) (non reacting; non judging; acting with awareness).
compute TFMQ15NR_36 = TFMQitem1_36 + TFMQitem3_36 + TFMQitem6_36 + TFMQitem10_36 + Q34_6.
execute.
recode TFMQ15NR_36 (SYSMIS=999).
MISSING VALUES TFMQ15NR_36 (999).
compute TFMQ15NJ_36 = TFMQitem2_36 + TFMQitem4_36 + TFMQitem7_36 +  TFMQitem9_36 + Q34_5.
execute.
recode TFMQ15NJ_36 (SYSMIS=999).
MISSING VALUES TFMQ15NJ_36 (999).
compute TFMQ15aware_36 = TFMQitem5_36 + TFMQitem8_36 + TFMQitem11_36 + TFMQitem12_36 + Q32_3.
EXECUTE.
recode TFMQ15aware_36 (SYSMIS=999).
MISSING VALUES TFMQ15aware_36 (999).

fre TFMQ15tot_36 TFMQ15NR_36 TFMQ15NJ_36 TFMQ15aware_36.

*RRQ 36 weeks.

*Recode.
recode RRQitem6_36 RRQitem9_36 RRQitem10_36 (1=5) (2=4) (4=2) (5=1).
execute. 

*Total score.
compute RRQ_36 = RRQitem1_36 + RRQitem2_36 + RRQitem3_36 + RRQitem4_36 + RRQitem5_36 + RRQitem6_36 + RRQitem7_36 +
 RRQitem8_36 + RRQitem9_36 + RRQitem10_36 + RRQitem11_36 + RRQitem12_36.
execute.
recode RRQ_36 (SYSMIS=999).
MISSING VALUES RRQ_36 (999).
fre RRQ_36.

*SCS-SF 36 weeks.

*Recode.
recode SCSitem1_36 SCSitem4_36 SCSitem8_36 SCSitem9_36 SCSitem11_36 SCSitem12_36 (1=7) (2=6) (3=5) (5=3) (6=2) (7=1).
execute. 

*Total score.
compute SCS_36 = SCSitem1_36 + SCSitem2_36 + SCSitem3_36 + SCSitem4_36 + SCSitem5_36 + SCSitem6_36 + SCSitem7_36 +
 SCSitem8_36 + SCSitem9_36 + SCSitem10_36 + SCSitem11_36 + SCSitem12_36.
execute.
recode SCS_36 (SYSMIS=999).
MISSING VALUES SCS_36 (999).
fre SCS_36.
