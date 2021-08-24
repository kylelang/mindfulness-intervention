### Title:   Compare April and June Data Files
### Author:  Kyle M. Lang
### Created: 2021-08-24
### Modifed: 2021-08-24

rm(list = ls(all = TRUE))

dataDir <- "../../../data/"
plotDir <- "../../figures/"
fn1     <- "recoded_mindfulness_data-20210401.csv"
fn2     <- "recoded_mindfulness_data-20210623.csv"

dat1 <- read.csv2(paste0(dataDir, fn1))
dat2 <- read.csv2(paste0(dataDir, fn2))

filter <- sapply(dat1, is.numeric)

pdf(file = paste0(plotDir, "comparison_histograms.pdf"), onefile = TRUE)

for(v in colnames(dat1)[filter]) {
    hist(dat1[[v]], col = "blue", main = v)
    print(hist(dat2[[v]], col = "red", add = TRUE))
}

dev.off()
