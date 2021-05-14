### Title:    Run Power Analysis for Observed Variable Models
### Author:   Kyle M. Lang
### Created:  2021-05-11
### Modified: 2021-05-14

latent <- FALSE
nReps  <- 500
n      <- 55
es     <- 0.5

source("init.R")

popMod <- gsub("EFFECT_SIZE", es, popMod, fixed = TRUE)

## Run the simulation:
out <- mclapply(X        = 1 : nReps,
                FUN      = doRep,
                n        = n,
                popMod   = popMod,
                fullMod  = fullMod,
                resMod   = resMod,
                latent   = FALSE,
                mc.cores = 4)

out

## Compute power:
mean(unlist(out) < 0.05)

