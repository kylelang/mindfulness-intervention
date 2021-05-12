### Title:    Scratch Space for Power Analysis
### Author:   Kyle M. Lang
### Created:  2021-05-11
### Modified: 2021-05-12

rm(list = ls(all = TRUE))

library(lavaan)
library(mvtnorm)

source("subroutines.R")

n    <- 100000
dat1 <- simMeanData(n, 3, 0.5)

## Visualize the individual trends:
plot(x    = as.numeric(dat1[1, -1]),
     type = "l",
     ylim = range(dat1[dat1$g == "treat", -1])
     )
for(i in 2 : n) lines(as.numeric(dat1[i, -1]))

plot(x    = as.numeric(dat1[n + 1, -1]),
     type = "l",
     ylim = range(dat1[dat1$g == "control", -1])
     )
for(i in (n + 2) : (2 * n)) lines(as.numeric(dat1[i, -1]))                                   

dat1 <- dat1[dat1$g == "treat", ]

cohenD(dat1$y1, dat1$y2)
cohenD(dat1$y2, dat1$y3)
cohenD(dat1$y1, dat1$y3)

## Full Model:
mod1 <- "
d2 =~ 1.0 * y2
d3 =~ 1.0 * y3

y2 ~ 1.0 * y1
y3 ~ 1.0 * y2

y1 ~~ y1
d2 ~~ d2
d3 ~~ d3

y1 ~ 1.0
d2 ~ 1.0
d3 ~ 1.0

## Covary baseline levels with change factors:
y1 ~~ d2
y2 ~~ d3

## Don't estimate means of y after T1:
y2 + y3 ~ 0 * 1.0

## Don't estimate covaraince between change factors:
d2 ~~ 0 * d3
"

## Restricted Model:
mod0 <- gsub("d2 ~ 1.0", "d2 ~ c('m1', 'm1') * 1.0", mod1, fixed = TRUE)

nReps <- 1000

n  <- 55
p  <- 3
es <- 0.8

out <- rep(NA, nReps)
for(rp in 1 : nReps) {
    dat1    <- simMeanData(n, p, es)
    out[rp] <- compareModels(mod1, mod0, dat1, "g")
}

mean(out < 0.05)

0.5 ^ 2

n <- 50


n    <- 1000
nLat <- 3
nObs <- 5
es   <- 0.5
lam  <- 0.6


dat1 <- simLatentData(n, nLat, nObs, es, lam)

head(dat1)

dim(dat1)
