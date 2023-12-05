# author : Pierre Pili
# email : pierre.pili@etu.minesparis.psl.eu
# description : Decompose on the trend and the cyclical components.

### Libraries ###
library(tidyverse)

### Imports ###
df <- read.csv("INTERMEDIATE/pc_indicators.csv")
hp_matrix <- as.matrix(read.csv("INTERMEDIATE/hp_matrix.csv", header = FALSE))

### Decomposition ###
decomposition <- df %>% mutate(
    GDP_T = hp_matrix %*% log(GDP),
    GDP_C = GDP_T - log(GDP),
    INVESTMENT_T = hp_matrix %*% log(INVESTMENT),
    INVESTMENT_C = INVESTMENT_T - log(INVESTMENT),
    CONSUMPTION_T = hp_matrix %*% log(CONSUMPTION),
    CONSUMPTION_C = CONSUMPTION_T - log(CONSUMPTION),
    HOURS_WORKED_T = hp_matrix %*% log(HOURS_WORKED),
    HOURS_WORKED_C = HOURS_WORKED_T - log(HOURS_WORKED)
)

### Export ###
write.csv(decomposition, file = "OUTPUT/DATA/cycles.csv", row.names = FALSE)
