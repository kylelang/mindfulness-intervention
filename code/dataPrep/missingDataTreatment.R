### Title:    Missing Data Treatment for Mindfulness Intervention Study
### Author:   Kyle M. Lang
### Created:  2021-06-21
### Modified: 2021-06-21

rm(list = ls(all = TRUE))

library(mice)

dataDir <- "../../../data/"
plotDir <- "../../figures/"
fn1     <- "recoded_mindfulness_data.csv"

dat0 <- read.csv2(paste0(dataDir, fn1))

head(dat0)

## Convert intervention group flag to factor:
dat0$Interventiegroep <-
    factor(dat0$Interventiegroep, labels = c("control", "treatment"))

### WE ONLY HAVE MINDFULNESS DATA FOR THE INTERVENTION GROUP, SO WE NEED TO
### SPLIT THE SAMPLE.

## Data for only the intervention group:
intData <- dat0[dat0$Interventiegroep == "treatment", ]

## Combined data without mindfulness items:
comData <- dat0[grep("^TFMQ|^RRQ|^SCS", colnames(dat0), invert = TRUE)]

## Explore the scope of the missing data problem
pm <- colMeans(is.na(comData))
pm

md.pattern(comData)

cc <- md.pairs(comData)$rr / nrow(comData)
range(cc)
hist(cc)

lev <- sapply(comData, function(x) length(unique(na.omit(x))))
lev
sapply(dat0, function(x) unique(x))

ind <- grep("Name$|EndDate_\\d", colnames(comData), invert = TRUE)

for(i in ind) {
    print(hist(comData[[i]]))
    readline("Hit a key...")
}

## Columns to exlude from the imputation:
ex <- c(1 : ncol(comData))[-ind]

## Also exclude constants:
ex <- c(ex, which(lev == 1))

## Which column contains the intervention group flag?
tx <- grep("Interventiegroep", colnames(comData))

rMat <- cor(as.matrix(comData[-c(tx, ex)]), use = "pairwise", method = "spearman")
warnings()

## Why are we getting NA correlations with EDS_10_28?
tmp   <- rMat[ , "EDS_10_28"]
probs <- names(tmp)[is.na(tmp)]

for(x in probs) print(table(comData[c(x, "EDS_10_28")]))

table(comData$EDS_10_28)

### NOTE: EDS_10_28 is nearly constant. After accounting for the missing values,
###       EDS_10_28 is exactly constant relative to several other variables.

## Exclude EDS_10_28:
ex <- c(ex, grep("EDS_10_28", colnames(comData)))

## Select the predictors for the imputation model:
preds <- quickpred(data    = comData,
                   mincor  = 0.1,
                   exclude = ex,
                   include = "Interventiegroep",
                   method  = "spearman")

colSums(preds)

meth        <- rep("norm", ncol(comData))
names(meth) <- colnames(comData)

meth[ex]                 <- ""
meth["Interventiegroep"] <- ""
meth[pm == 0]            <- ""

## Impute missing values:
miceOut <- mice(data   = comData,
                m      = 20,
                method = meth,
                pred   = preds,
                maxit  = 10,
                seed   = 235711,
                ridge  = 1.0e-1)

pdf(paste(plotDir, "mice_traceplots.pdf"), onefile = TRUE)
plot(miceOut)
dev.off()

rowSums(preds)

?quickpred


colMeans(is.na(intData))
colMeans(is.na(comData))

md.pattern(intData)
md.pattern(comData)

intCov <- md.pairs(intData)$rr / nrow(intData)
range(intCov)
hist(intCov)

comCov <- md.pairs(comData)$rr / nrow(comData)
range(comCov)
hist(comCov)
