# author : Isée Biglietti
# email : isee.biglietti@ens.psl.eu
# description : Correlation coefficient taking GDP as a benchmark

### Libraries ###
library(tidyverse)
library(ggplot2)

### Imports ###
cycles <- read.csv("OUTPUT/DATA/cycles.csv")

### Correlations ###
cor_cons <- cor(cycles$GDP_C, cycles$CONSUMPTION_C)
cor_hours <- cor(cycles$GDP_C, cycles$HOURS_WORKED_C)
cor_inv <- cor(cycles$GDP_C, cycles$INVESTMENT_C)
cor_GDP <- cor(cycles$GDP_C, cycles$GDP_C)

### Relative sd ###
RSD_GDP <- sd(cycles$GDP_C)/sd(cycles$GDP_C)
RSD_cons <- sd(cycles$CONSUMPTION_C)/sd(cycles$GDP_C)
RSD_hours <- sd(cycles$HOURS_WORKED_C)/sd(cycles$GDP_C)
RSD_inv <- sd(cycles$INVESTMENT_C)/sd(cycles$GDP_C)

### Save as a dataframe ###
df <- data.frame(GDP = c(cor_GDP, RSD_GDP),
                CONSUMPTION = c(cor_cons, RSD_cons),
                HOURS_WORKED = c(cor_hours, RSD_hours), 
                INVESTMENT = c(cor_inv, RSD_inv))
rownames(df) = c("Correlations with GDP", "Relative SD to GDP's SD")
write.csv(df, "OUTPUT/TABLES/corr_RSD.csv", row.names = FALSE)
rm()

### Answers ###
# in the lecture we had: Cons, inv and hours worked are strongly procyclial. 
# same thing here (cons and inv even more procyclical). 
# volatility: we had σC < σY, σI > σY. 
# here σY > σI > σC > σH, ce qui fait sens car on ne fait pas face au même pays et que donc son comportement politique (investissement, travail et consommation) peut largement etre différent, c'est soutenable comme hypothèse. 