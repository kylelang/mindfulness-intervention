### Title:    Run Power Analysis for the Observed Variable Model
### Author:   Kyle M. Lang
### Created:  2021-05-11
### Modified: 2021-05-12

rm(list = ls(all = TRUE))

library(lavaan)
library(parallel)

source("subroutines.R")

nReps <- 1000

n  <- 55
p  <- 3
es <- 0.5

## Full Model:
mod1 <- "
d2 =~ 1 * y2
d3 =~ 1 * y3

y2 ~ 1 * y1
y3 ~ 1 * y2

y1 ~~ y1
y2 ~~ 1 * y2
y3 ~~ 1 * y3

d2 ~~ d2
d3 ~~ d3

y1 ~ 1
d2 ~ 1
d3 ~ 1

## Covary baseline levels with change factors:
y1 ~~ d2
y2 ~~ d3

## Don't estimate means of y after T1:
y2 + y3 ~ 0 * 1

## Don't estimate covariance between change factors:
d2 ~~ 0 * d3
"

                                        #dat1 <- simMeanData(n, p, es)
                                        #fit  <- sem(model = mod1, data = dat1)
                                        #summary(fit)

## Restricted Model:
mod0 <- gsub("d2 ~ 1", "d2 ~ c('m1', 'm1') * 1", mod1, fixed = TRUE)

## Run the simulation:
out <- mclapply(X        = 1 : nReps,
                FUN      = doRep,
                n        = n,
                p        = p,
                es       = es,
                mod0     = mod0,
                mod1     = mod1,
                mc.cores = 4)

## Compute power:
mean(unlist(out) < 0.05)
