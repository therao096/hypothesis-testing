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
###### as variances are not equal 2 sample t test for unequal variances
t.test(Unit.A, Unit.B,alternative = "two.sided" , conf.level=0.95, correct= TRUE)
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
attach(buyerratio)
c1 <- buyerratio$East
c2 <- buyerratio$West
c3 <- buyerratio$North
c4 <- buyerratio$South
p1 <- data.frame(c1,c2,c3,c4)
View(p1)
chisq.test(p1)
#######################################################################
costform <- read.csv("Costomer+OrderForm.csv")
View(costform)
attach(costform)
Phillippines<-as.numeric(Phillippines)
Indonesia<-as.numeric(Indonesia)
India<-as.numeric(India)
Malta<-as.numeric(Malta)
costform <- data.frame(Phillippines,Indonesia,India,Malta)
View(costform)
attach(costform)
stackeddata <- stack(costform)
View(stackeddata)
table(stackeddata)
chisq.test(table(stackeddata))
###############################################################################3
fantaloons <- read.csv("Faltoons.csv")
View(fantaloons)
attach(fantaloons)
c1 <- as.numeric(fantaloons$Weekdays)
c2 <- as.numeric(fantaloons$Weekend)
fantaloons <- data.frame(c1,c2)
View(fantaloons)
stacked <- stack(fantaloons)
View(stacked)
table(stacked)
prop.test(x=c(113,167),n=c(400,400),conf.level = 0.95,correct = FALSE,alternative = "two.sided")
#### as p value is less than 0.05
prop.test(x=c(113,167),n=c(400,400),conf.level = 0.95,correct = FALSE,alternative = "greater")

 