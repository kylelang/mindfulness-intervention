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

