### Title:    Run Power Analysis
### Author:   Kyle M. Lang
### Created:  2021-05-11
### Modified: 2021-05-14

rm(list = ls(all = TRUE))

set.seed(235711)

latent <- TRUE
nReps  <- 500
n      <- 75
es     <- 0.5
lam    <- 0.7

source("init.R")

## Fill in template parameters for population model:
popMod <- gsub("EFFECT_SIZE", es, popMod, fixed = TRUE)

if(latent)
    popMod <- gsub("LAMBDA", lam, popMod, fixed = TRUE)

## Check the population model specification:
cat(popMod)

## Run the simulation:
out <- mclapply(X        = 1 : nReps,
                FUN      = doRep,
                n        = n,
                popMod   = popMod,
                fullMod  = fullMod,
                resMod   = resMod,
                latent   = latent,
                mc.cores = 3)

out

## Compute power:
mean(unlist(out) < 0.05)

