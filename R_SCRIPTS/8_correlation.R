# author : Isée Biglietti
# email : isee.biglietti@ens.psl.eu
# description : Correlation coefficient taking GDP as a benchmark

### Libraries ###
library(tidyverse)
library(ggplot2)

### Imports ###
cycles <- read.csv("OUTPUT/DATA/cycles.csv")

### Correlations ###
cor_cons <- cor(cycles$GDP, cycles$CONSUMPTION)
cor_hours <- cor(cycles$GDP, cycles$HOURS_WORKED)
cor_inv <- cor(cycles$GDP, cycles$INVESTMENT)

### Relative sd ###
SD_GDPcons <- 
SD_GDPhours <- 
SD_GDPinv <- 

### Save as a dataframe ###
df <- data.frame(Correlation = c(cor_cons, cor_hours, cor_inv), SD = c())
write.csv(df, "OUTPUT/TABLES/corr_SD.csv", row.names = FALSE)
rm()