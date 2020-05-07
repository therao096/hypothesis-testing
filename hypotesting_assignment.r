setwd("F:\\EXCEL R\\ASSIGNMENTS\\hypothesis testing")
library(readxl)
library(openxlsx)
library(WriteXLS)
cutlet <- read.csv("Cutlets.csv")
View(cutlet)
attach(cutlet)
shapiro.test(Unit.A)
shapiro.test(Unit.B)
var.test(Unit.A,Unit.B)
  ####

labtat <- read.csv("LabTAT.csv")
View(labtat)
attach(labtat)
shapiro.test(Laboratory.1)
shapiro.test(Laboratory.2)
shapiro.test(Laboratory.3)
shapiro.test(Laboratory.4)
## as all are above 0.05, it is normally distributed.
stackeddata <- stack(labtat)
View(stackeddata)
attach(stackeddata)
library(car)
leveneTest(values, ind, data = stackeddata)
anova_results <- aov(values~ind, data = stackeddata)
summary(anova_results)
#################################################################################################
buyerratio <- read.csv("BuyerRatio.csv")
View(buyerratio)





