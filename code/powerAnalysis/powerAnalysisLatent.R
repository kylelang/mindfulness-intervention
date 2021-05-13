### Title:    Run Power Analysis for Common Factor Models
### Author:   Kyle M. Lang
### Created:  2021-05-11
### Modified: 2021-05-12

rm(list = ls(all = TRUE))

library(lavaan)
library(mvtnorm)
library(parallel)

                                        #source("subroutines.R")

doRepLatent <- function(rp, n, popMod, fullMod, resMod) {
    dat1 <- simulateData(model          = popMod,
                         model.type     = lavaan,
                         sample.nobs    = c(n, n),
                         meanstructure  = TRUE,
                         std.lv         = FALSE,
                         auto.fix.first = FALSE,
                         auto.var       = TRUE)
    
    fullFit <- lavaan(model       = fullMod,
                      data        = dat1,
                      auto.var    = TRUE,
                      group       = "group",
                      group.equal = c("loadings", "intercepts")
                      )
    
    resFit <- lavaan(model       = resMod,
                     data        = dat1,
                     auto.var    = TRUE,
                     group       = "group",
                     group.equal = c("loadings", "intercepts")
                     )
    
    anova(fullFit, resFit)[2, "Pr(>Chisq)"]
}

## Population model:
popMod <- "
f1 =~ 0.7 * y1_1 + 0.7 * y1_2 + 0.7 * y1_3 + 0.7 * y1_4 + 0.7 * y1_5
f2 =~ 0.7 * y2_1 + 0.7 * y2_2 + 0.7 * y2_3 + 0.7 * y2_4 + 0.7 * y2_5
f3 =~ 0.7 * y3_1 + 0.7 * y3_2 + 0.7 * y3_3 + 0.7 * y3_4 + 0.7 * y3_5

d2 =~ 1.0 * f2
d3 =~ 1.0 * f3

f2 ~ 1.0 * f1
f3 ~ 1.0 * f2

f1 ~~ 1.0 * f1
d2 ~~ 1.0 * d2
d3 ~~ 1.0 * d3

f1 ~ 0.0 * 1
d2 + d3 ~ c(0.5, 0.0) * 1

y1_1 + y1_2 + y1_3 + y1_4 + y1_5 ~ 0.0 * 1
y2_1 + y2_2 + y2_3 + y2_4 + y2_5 ~ 0.0 * 1
y3_1 + y3_2 + y3_3 + y3_4 + y3_5 ~ 0.0 * 1

## Covary baseline levels with change factors:
d2 ~ -0.15 * f1
d3 ~ -0.15 * f2

## Don't estimate latent means of y after T1:
f2 + f3 ~ 0 * 1.0

## Don't estimate latent variances after T1:
f2 ~~ 0 * f2
f3 ~~ 0 * f3

## Don't estimate covariance between change factors:
d2 ~~ 0.5 * d3
"

## Configural Model:
mod1 <- "
f1 =~ 1 * y1_1 + y1_2 + y1_3 + y1_4 + y1_5
f2 =~ 1 * y2_1 + y2_2 + y2_3 + y2_4 + y2_5
f3 =~ 1 * y3_1 + y3_2 + y3_3 + y3_4 + y3_5

d2 =~ 1 * f2
d3 =~ 1 * f3

f2 ~ 1 * f1
f3 ~ 1 * f2

f1 ~~ f1
d2 ~~ d2
d3 ~~ d3

f1 ~ 1.0
d2 ~ 1.0
d3 ~ 1.0

y1_1 ~ 0 * 1
y2_1 ~ 0 * 1
y3_1 ~ 0 * 1

y1_2 + y1_3 + y1_4 + y1_5 ~ 1
y2_2 + y2_3 + y2_4 + y2_5 ~ 1
y3_2 + y3_3 + y3_4 + y3_5 ~ 1

## Covary baseline levels with change factors:
d2 ~ f1
d3 ~ f2

## Don't estimate latent means of y after T1:
f2 + f3 ~ 0 * 1.0

## Don't estimate latent variances after T1:
f2 ~~ 0 * f2
f3 ~~ 0 * f3

## Don't estimate covariance between change factors:
d2 ~~ d3
"

                                        #fit <- lavaan(model = mod1, data = dat1, auto.var = TRUE)
                                        #summary(fit)

## Invariant Model:
fullMod <- "
f1 =~
1 * y1_1 +
c('l12', 'l22') * y1_2 +
c('l13', 'l23') * y1_3 +
c('l14', 'l24') * y1_4 +
c('l15', 'l25') * y1_5

f2 =~
1 * y2_1 +
c('l12', 'l22') * y2_2 +
c('l13', 'l23') * y2_3 +
c('l14', 'l24') * y2_4 +
c('l15', 'l25') * y2_5

f3 =~
1 * y3_1 +
c('l12', 'l22') * y3_2 +
c('l13', 'l23') * y3_3 +
c('l14', 'l24') * y3_4 +
c('l15', 'l25') * y3_5

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
y1_4 ~ c('m14', 'm24') * 1
y1_5 ~ c('m15', 'm25') * 1

y2_2 ~ c('m12', 'm22') * 1
y2_3 ~ c('m13', 'm23') * 1
y2_4 ~ c('m14', 'm24') * 1
y2_5 ~ c('m15', 'm25') * 1

y3_2 ~ c('m12', 'm22') * 1
y3_3 ~ c('m13', 'm23') * 1
y3_4 ~ c('m14', 'm24') * 1
y3_5 ~ c('m15', 'm25') * 1

## Regress change factors onto baseline levels:
#f1 ~~ d2
#f2 ~~ d3

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

## Restricted Model:
resMod <- gsub("d2 ~ 1", "d2 ~ c('m1', 'm1') * 1", fullMod, fixed = TRUE)

nReps <- 500
n     <- 55

## Run the simulation:
out <- mclapply(X        = 1 : nReps,
                FUN      = doRepLatent,
                n        = n,
                popMod   = popMod,
                fullMod  = fullMod,
                resMod   = resMod,
                mc.cores = 4)

out

## Compute power:
mean(unlist(out) < 0.05)

