### Title:    Subroutines for Power Analysis
### Author:   Kyle M. Lang
### Created:  2021-05-11
### Modified: 2021-05-12

## Create the factor loading matrix
lambda <- function(loadings) {
    nObs <- length(unlist(loadings))
    nLat <- length(loadings)
    
    tmp <- c()
    for(l in loadings[-nLat])
        tmp <- c(tmp, l, rep(0, nObs))
    
    matrix(c(tmp, loadings[[nLat]]), nrow = nObs)
}

## Simulate item-level data with no latent structure:
simItemData <- function(n, p, beta, r2) {
    t <- rep(1 : p, each = n)
    
    eta <- beta * t
    s2  <- (var(eta) / r2) - var(eta)
    
    yT  <- eta + rnorm(n * p, 0, sqrt(s2))
    yC  <- rnorm(n * p, 0, sqrt(s2)) 
    
    tmp           <- rbind(matrix(yC, nrow = n), matrix(yT, nrow = n))
    colnames(tmp) <- paste0("y", 1 : p)
    
    data.frame(g = rep(c("control", "treat"), each = n), tmp)
}

## Simulate item-level data based on standardized mean differences:
simMeanData <- function(n, p, es) {
    tmp <- list()
    for(i in 1 : p)
        tmp[[i]] <- rnorm(n, es * i, 1.0)
    
    tmp           <- rbind(do.call(cbind, tmp), matrix(rnorm(n * p), ncol = p))
    colnames(tmp) <- paste0("y", 1 : p)
    
    data.frame(g = rep(c("treat", "control"), each = n),
               tmp,
               stringsAsFactors = TRUE)
}

## Simulate item-level data with latent structure: 
simLatentData <- function(n, nLat, nObs, es, lam) {
    lv <- simMeanData(n, nLat, es)
    g  <- lv$g
    lv <- lv[-1]
    
    lambda <- lambda(list(rep(lam, nObs), rep(lam, nObs), rep(lam, nObs)))
    theta  <- diag(rep(1 - lam^2, nLat * nObs))
    
    dat1 <- as.matrix(lv) %*% t(lambda) +
        rmvnorm(nrow(lv), rep(0, nrow(lambda)), theta)

    colnames(dat1) <- paste(rep(colnames(lv), each = nObs), 1 : nObs, sep = "_")
    
    data.frame(g, dat1)
}

## Fit the full and restricted models to the simulated data and test for
## differences in the fits:
compareModels <- function(mod1, mod0, data, group) {
    fit1 <- sem(model = mod1, data = data, group = group)
    fit0 <- sem(model = mod0, data = data, group = group)
    
    anova(fit1, fit0)[2, "Pr(>Chisq)"]
}

cohenD <- function(y1, y2) (mean(y2) - mean(y1)) / sqrt((var(y2) + var(y1)) / 2)

## Run a single replication of the simulation:
doRep <- function(rp, n, p, es, mod1, mod0) {
    dat1 <- simMeanData(n, p, es)
    compareModels(mod1, mod0, dat1, "g")
}
