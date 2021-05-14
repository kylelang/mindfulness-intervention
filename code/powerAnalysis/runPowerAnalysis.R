### Title:    Run Power Analysis
### Author:   Kyle M. Lang
### Created:  2021-05-11
### Modified: 2021-05-14

rm(list = ls(all = TRUE))

set.seed(235711)

latent <- FALSE
nReps  <- 500
n      <- 55
es     <- 0.5

source("init.R")

## Define the correct effect size for the data generating model:
popMod <- gsub("EFFECT_SIZE", es, popMod, fixed = TRUE)

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

