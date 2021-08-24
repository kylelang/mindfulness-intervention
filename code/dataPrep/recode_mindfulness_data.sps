* Encoding: UTF-8.

*** Title: Recode Mindfulness Intervention Data.
*** Author: Kyle M. Lang (adapted from syntax by Lianne Hulsbosch).
*** Created: 2021-05-14. 
*** Modified: 2021-05-14.

*Load the data.
GET
  FILE='E:\research\active\liannePhd\data\Mindfulness 12-36 weeks complete_raw data_characteristics_23062021.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

***12 weeks*******************************************************************.

*EDS 12 weeks (higher scores indicate more depressive symptoms).
recode 
eds_1_12 
eds_2_12 
eds_4_12 
(1=0) 
(2=1) 
(3=2) 
(4=3).
 
recode 
eds_3_12 
eds_5_12 
eds_6_12 
eds_7_12 
eds_8_12 
eds_9_12 
eds_10_12 
(4=0) 
(3=1) 
(2=2) 
(1=3).

*TPDS-NA 12 weeks (higher scores indicate more pregnancy-specific distress).
recode 
tpds_na_1_12 
tpds_na_2_12 
tpds_na_3_12 
tpds_na_4_12 
tpds_na_5_12 
tpds_na_6_12 
tpds_na_7_12 
tpds_na_8_12 
tpds_na_9_12 
tpds_na_10_12 
(4=0) 
(3=1) 
(2=2) 
(1=3).

***16 weeks*******************************************************************.

*TFMQ-SF 16 weken (higher scores indicate more mindfulness).

*12 items.
recode 
TFMQitem2_16 
TFMQitem4_16 
TFMQitem5_16 
TFMQitem7_16 
TFMQitem8_16 
TFMQitem9_16 
TFMQitem11_16 
TFMQitem12_16 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*15 items.
recode 
Q13_3 
Q15_5 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*RRQ 16 weeks (higher scores indicate more rumination).
recode 
RRQitem6_16 
RRQitem9_16 
RRQitem10_16 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*SCS-SF 16 weeks (higher scores indicate more self-compassion).
recode 
SCSitem1_16 
SCSitem4_16 
SCSitem8_16 
SCSitem9_16 
SCSitem11_16 
SCSitem12_16 
(1=7) 
(2=6) 
(3=5) 
(5=3) 
(6=2) 
(7=1).

***20 weeks*******************************************************************.

*EDS 20 weeks.
recode 
eds_1_20 
eds_2_20 
eds_4_20 
(1=0) 
(2=1) 
(3=2) 
(4=3).
 
recode 
eds_3_20 
eds_5_20 
eds_6_20 
eds_7_20 
eds_8_20 
eds_9_20 
eds_10_20 
(4=0) 
(3=1) 
(2=2) 
(1=3).

*TPDS-NA 20 weeks.
recode 
tpds_na_1_20 
tpds_na_2_20 
tpds_na_3_20 
tpds_na_4_20 
tpds_na_5_20 
tpds_na_6_20 
tpds_na_7_20 
tpds_na_8_20 
tpds_na_9_20 
tpds_na_10_20 
(4=0) 
(3=1) 
(2=2) 
(1=3).

*TFMQ-SF 20 weeks.
recode 
TFMQitem2_20 
TFMQitem4_20 
TFMQitem5_20 
TFMQitem7_20 
TFMQitem8_20 
TFMQitem9_20 
TFMQitem11_20 
TFMQitem12_20 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*TFMQ-SF extra items.
recode 
Q50_3 
Q52_5 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*RRQ 20 weeks.
recode 
RRQitem6_20 
RRQitem9_20 
RRQitem10_20 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*SCS-SF 20 weeks.
recode 
SCSitem1_20 
SCSitem4_20 
SCSitem8_20 
SCSitem9_20 
SCSitem11_20 
SCSitem12_20 
(1=7) 
(2=6) 
(3=5) 
(5=3) 
(6=2) 
(7=1).

***28 weeks*******************************************************************.

*EDS 28 weeks.
recode 
eds_1_28 
eds_2_28 
eds_4_28 
(1=0) 
(2=1) 
(3=2) 
(4=3). 

recode 
eds_3_28 
eds_5_28 
eds_6_28 
eds_7_28 
eds_8_28 
eds_9_28 
eds_10_28 
(4=0) 
(3=1) 
(2=2) 
(1=3).

*TPDS-NA 28 weeks.
recode 
tpds_na_1_28 
tpds_na_2_28 
tpds_na_3_28 
tpds_na_4_28 
tpds_na_5_28 
tpds_na_6_28 
tpds_na_7_28 
tpds_na_8_28 
tpds_na_9_28 
tpds_na_10_28 
(4=0) 
(3=1) 
(2=2) 
(1=3).

*TFMQ-SF 28 weeks.
recode 
TFMQitem2_28 
TFMQitem4_28 
TFMQitem5_28 
TFMQitem7_28 
TFMQitem8_28 
TFMQitem9_28 
TFMQitem11_28 
TFMQitem12_28 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*TFMQ-SF extra items.
recode 
Q115_3 
Q117_5 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*RRQ 28 weeks.
recode 
RRQitem6_28 
RRQitem9_28 
RRQitem10_28 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*SCS-SF 28 weeks.
recode 
SCSitem1_28 
SCSitem4_28 
SCSitem8_28 
SCSitem9_28 
SCSitem11_28 
SCSitem12_28 
(1=7) 
(2=6) 
(3=5) 
(5=3) 
(6=2) 
(7=1).

***36 weeks*******************************************************************.

*EDS 36 weeks.
recode 
eds_1_36 
eds_2_36 
eds_4_36 
(1=0) 
(2=1) 
(3=2) 
(4=3). 

recode 
eds_3_36 
eds_5_36 
eds_6_36 
eds_7_36 
eds_8_36 
eds_9_36 
eds_10_36 
(4=0) 
(3=1) 
(2=2) 
(1=3).

*TPDS-NA 36 weeks.
recode 
tpds_na_1_36 
tpds_na_2_36 
tpds_na_3_36 
tpds_na_4_36 
tpds_na_5_36 
tpds_na_6_36 
tpds_na_7_36 
tpds_na_8_36 
tpds_na_9_36 
tpds_na_10_36 
(4=0) 
(3=1) 
(2=2) 
(1=3).

*TFMQ-SF 36 weeks.
recode 
TFMQitem2_36 
TFMQitem4_36 
TFMQitem5_36 
TFMQitem7_36 
TFMQitem8_36 
TFMQitem9_36 
TFMQitem11_36 
TFMQitem12_36 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*TFMQ-SF extra items.
recode 
Q32_3 
Q34_5 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*RRQ 36 weeks.
recode 
RRQitem6_36 
RRQitem9_36 
RRQitem10_36 
(1=5) 
(2=4) 
(4=2) 
(5=1).

*SCS-SF 36 weeks.
recode 
SCSitem1_36 
SCSitem4_36 
SCSitem8_36 
SCSitem9_36 
SCSitem11_36 
SCSitem12_36 
(1=7) 
(2=6) 
(3=5) 
(5=3) 
(6=2) 
(7=1).

execute.

*Export the recoded data file as CSV.
SAVE TRANSLATE OUTFILE='E:\research\active\liannePhd\data\recoded_mindfulness_data.csv'
  /TYPE=CSV
  /ENCODING='UTF8'
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES.
