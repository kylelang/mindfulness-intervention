### Title:    Subroutines for Power Analysis
### Author:   Kyle M. Lang
### Created:  2021-05-11
### Modified: 2021-05-14

doRep <- function(rp, n, popMod, fullMod, resMod, latent) {
    dat1 <- simulateData(model          = popMod,
                         model.type     = lavaan,
                         sample.nobs    = c(n, n),
                         meanstructure  = TRUE,
                         std.lv         = FALSE,
                         auto.fix.first = FALSE,
                         auto.var       = TRUE)
    
    if(latent)
        gConst <- c("loadings", "intercepts")
    else
        gConst <- "none"
    
    fullFit <- lavaan(model       = fullMod,
                      data        = dat1,
                      auto.var    = TRUE,
                      group       = "group",
                      group.equal = gConst)
    
    resFit <- lavaan(model       = resMod,
                     data        = dat1,
                     auto.var    = TRUE,
                     group       = "group",
                     group.equal = gConst)
    
    anova(fullFit, resFit)[2, "Pr(>Chisq)"]
}
