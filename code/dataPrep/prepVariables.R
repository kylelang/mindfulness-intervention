### Title:    Prepare Variables for Mindfulness Intervention Study
### Author:   Kyle M. Lang
### Created:  2021-06-21
### Modified: 2021-09-01

rm(list = ls(all = TRUE))

library(dplyr)

dataDir <- "../../../data/"
fn      <- "recoded_mindfulness_data-20210623.csv"

dat0 <- read.csv2(paste0(dataDir, fn))

## Convert categorical variables to factors:
dat0$Interventiegroep <- factor(x      = dat0$Interventiegroep,
                                labels = c("control", "treatment")
                                )

dat0$marital_status_12 <- factor(x      = dat0$marital_status_12,
                                 levels = 1:5,
                                 labels = c("Getrouwd / samenwonend",
                                            "Relatie, maar niet samenwonend",
                                            "Gescheiden / uit elkaar",
                                            "Alleenstaand",
                                            "Anders")
                                 )

dat0$education_12 <- factor(x      = dat0$education_12,
                            levels = 1:6,
                            labels = c("Basisonderwijs",
                                       "VMBO / MAVO",
                                       "HAVO / VWO",
                                       "MBO",
                                       "HBO / WO",
                                       "Anders")
                            )

dat0$nationality_12 <- factor(x      = dat0$nationality_12,
                              levels = 1:2,
                              labels = c("Nederlandse", "Anders")
                              )

dat0$prev_miscarr_abort_12 <- factor(x      = dat0$prev_miscarr_abort_12,
                                     levels = 1:2,
                                     labels = c("Nee", "Ja")
                                     )

dat0$prev_childbirth_12 <- factor(x      = dat0$prev_childbirth_12,
                                  levels = 1:2,
                                  labels = c("Nee", "Ja")
                                  )

dat0$planned_pregnancy_12 <- factor(x      = dat0$planned_pregnancy_12,
                                    levels = 1:2,
                                    labels = c("Ja", "Nee")
                                    )

dat0$paid_work_12 <-
    factor(x      = dat0$paid_work_12,
           levels = 1:3,
           labels = c("Ja",
                      "Nee",
                      "Ja, maar momenteel werk ik langer dan 3 maanden niet")
           )

dat0$alcohol_12 <-
    factor(x      = dat0$alcohol_12,
           levels = 1:4,
           labels = c("Nee",
                      "Zo nu en dan, maar niet meer dan 1 glas per week",
                      "Ja, 2-4 glazen per week",
                      "Ja, meer")
           )

dat0$smoking_12 <- factor(x      = dat0$smoking_12,
                          levels = 1:2,
                          labels = c("Nee", "Ja")
                          )

## Convert gestatinal age from character to numeric:
dat0$Gestational_age_8wpp <- as.numeric(dat0$Gestational_age_8wpp)

tmp           <- dat0[grep("Gestational", colnames(dat0))]
colnames(tmp) <- c("raw", "week")

with(tmp, sum(is.na(raw) & !is.na(week)))
with(tmp, sum(is.na(week) & !is.na(raw)))

### Gestational_age_weeks_8wpp is a truncated version of Gestational_age_8wpp
### The former has less missing data than the latter, though.
### We can only use one, so we're better off going with the "weeks" version.

## Drop extraneous variables:
grep("name|date|age_weeks", colnames(dat0), ignore.case = TRUE, value = TRUE)

### WE ONLY HAVE MINDFULNESS DATA FOR THE INTERVENTION GROUP, SO WE NEED TO
### SPLIT THE SAMPLE.

## Data for only the intervention group:
datList$int <- dat0[dat0$Interventiegroep == "treatment", ]

## Combined data without mindfulness items:
datList$com <- dat0[grep("^TFMQ|^RRQ|^SCS", colnames(dat0), invert = TRUE)]

saveRDS(datList, paste0(dataDir, "datList.rds"))
