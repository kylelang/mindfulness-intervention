### Title:    Initialize Environment for Power Analysis
### Author:   Kyle M. Lang
### Created:  2021-05-14
### Modified: 2021-05-14

library(lavaan)
library(parallel)

source("subroutines.R")

if(latent) {
    
    ## Population Model:
    popMod <- "
f1 =~ LAMBDA * y1_1 + LAMBDA * y1_2 + LAMBDA * y1_3
f2 =~ LAMBDA * y2_1 + LAMBDA * y2_2 + LAMBDA * y2_3
f3 =~ LAMBDA * y3_1 + LAMBDA * y3_2 + LAMBDA * y3_3

d2 =~ 1.0 * f2
d3 =~ 1.0 * f3

f2 ~ 1.0 * f1
f3 ~ 1.0 * f2

f1 ~~ 1.0 * f1
d2 ~~ 1.0 * d2
d3 ~~ 1.0 * d3

d2 + d3 ~ c(EFFECT_SIZE, 0.0) * 1

## All item means are zero: 
y1_1 + y1_2 + y1_3 ~ 0.0 * 1
y2_1 + y2_2 + y2_3 ~ 0.0 * 1
y3_1 + y3_2 + y3_3 ~ 0.0 * 1

## Regress change factors onto baseline levels:
d2 ~ -0.15 * f1
d3 ~ -0.15 * f2

## Latent means are all zero:
f1 + f2 + f3 ~ 0.0 * 1

## Latent variances are zero after T1:
f2 ~~ 0.0 * f2
f3 ~~ 0.0 * f3

## Covariance between change factors:
d2 ~~ 0.5 * d3
"

    ## Full Model:
    fullMod <- "
f1 =~ 1 * y1_1 + c('l12', 'l22') * y1_2 + c('l13', 'l23') * y1_3
f2 =~ 1 * y2_1 + c('l12', 'l22') * y2_2 + c('l13', 'l23') * y2_3 
f3 =~ 1 * y3_1 + c('l12', 'l22') * y3_2 + c('l13', 'l23') * y3_3

## Define latent change variables:
d2 =~ 1 * f2
d3 =~ 1 * f3

## Autoregressive effects:
f2 ~ 1 * f1
f3 ~ 1 * f2

f1 ~~ f1
d2 ~~ d2
d3 ~~ d3

f1 ~ 1
d2 ~ 1
d3 ~ 1

y1_1 ~ 0 * 1
y2_1 ~ 0 * 1
y3_1 ~ 0 * 1

y1_2 ~ c('m12', 'm22') * 1
y1_3 ~ c('m13', 'm23') * 1

y2_2 ~ c('m12', 'm22') * 1
y2_3 ~ c('m13', 'm23') * 1

y3_2 ~ c('m12', 'm22') * 1
y3_3 ~ c('m13', 'm23') * 1

## Regress change factors onto baseline levels:
d2 ~ f1
d3 ~ f2

## Don't estimate latent means of y after T1:
f2 + f3 ~ 0 * 1

## Don't estimate latent variances after T1:
f2 ~~ 0 * f2
f3 ~~ 0 * f3

## Don't estimate covariance between change factors:
d2 ~~ d3
"
    
} else {
    
    ## Population Model:
    popMod <- "
d2 =~ 1.0 * y2
d3 =~ 1.0 * y3

y2 ~ 1.0 * y1
y3 ~ 1.0 * y2

y1 ~~ 1.0 * y1
d2 ~~ 1.0 * d2
d3 ~~ 1.0 * d3

d2 + d3 ~ c(EFFECT_SIZE, 0.0) * 1

## Regress change factors onto baseline variables:
d2 ~ -0.15 * y1
d3 ~ -0.15 * y2

## All item means are zero:
y1 + y2 + y3 ~ 0.0 * 1

## Item variances are zero after T1:
y2 ~~ 0 * y2
y3 ~~ 0 * y3

## Covariance between change factors:
d2 ~~ 0.5 * d3
"

    ## Full Model:
    fullMod <- "
d2 =~ 1.0 * y2
d3 =~ 1.0 * y3

y2 ~ 1.0 * y1
y3 ~ 1.0 * y2

y1 ~~ y1
d2 ~~ d2
d3 ~~ d3

y1 ~ 1
d2 ~ 1
d3 ~ 1

## Regress change factors onto baseline levels:
d2 ~ y1
d3 ~ y2

## Don't estimate item means after T1:
y2 + y3 ~ 0 * 1

## Don't estimate item variances after T1:
y2 ~~ 0 * y2
y3 ~~ 0 * y3

## Estimate covariance between change factors:
d2 ~~ d3
"

}

## Restricted Model:
resMod <- gsub("d2 ~ 1", "d2 ~ c('m1', 'm1') * 1", fullMod, fixed = TRUE)
