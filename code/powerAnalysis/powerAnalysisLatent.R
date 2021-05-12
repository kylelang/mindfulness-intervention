### Title:    Run Power Analysis for Common Factor Models
### Author:   Kyle M. Lang
### Created:  2021-05-11
### Modified: 2021-05-12

rm(list = ls(all = TRUE))

library(lavaan)
library(mvtnorm)
library(parallel)

source("subroutines.R")

nReps <- 1000

n    <- 55
nLat <- 3
nObs <- 5
es   <- 0.5
lam  <- 0.6

dat1 <- simLatentData(n, nLat, nObs, es, lam)

v1 <- colnames(dat1)[grep("^y1_", colnames(dat1))]
v2 <- colnames(dat1)[grep("^y2_", colnames(dat1))]
v3 <- colnames(dat1)[grep("^y3_", colnames(dat1))]

paste(v1, collapse = " + ")
paste(v2, collapse = " + ")
v3

## Full Model:
mod1 <- "
f1 =~ y1_1 + y1_2 + y1_3 + y1_4 + y1_5
f2 =~ y2_1 + y2_2 + y2_3 + y2_4 + y2_5
f3 =~ y3_1 + y3_2 + y3_3 + y3_4 + y3_5

d2 =~ 1.0 * f2
d3 =~ 1.0 * f3

f2 ~ 1.0 * f1
f3 ~ 1.0 * f2

f1 ~~ 1.0 * f1
f2 ~~ 1.0 * f2
f3 ~~ 1.0 * f3

d2 ~~ d2
d3 ~~ d3

f1 ~ 0 * 1.0
d2 ~ 1.0
d3 ~ 1.0

## Covary baseline levels with change factors:
f1 ~~ d2
f2 ~~ d3

## Don't estimate means of y after T1:
f2 + f3 ~ 0 * 1.0

## Don't estimate covariance between change factors:
#d2 ~~ 0 * d3
"

fit <- lavaan(model = mod1, data = dat1, auto.var = TRUE)

summary(fit)

## Restricted Model:
mod0 <- gsub("d2 ~ 1.0", "d2 ~ c('m1', 'm1') * 1.0", mod1, fixed = TRUE)

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
