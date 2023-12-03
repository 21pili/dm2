# author : Pierre Pili
# email : pierre.pili@etu.minesparis.psl.eu
# description : convert indicators into per capita units

### Libraries ###
library(tidyverse)


### Imports ###
df <- read.csv("INTERMEDIATE/raw_indicators.csv")

### Conversion ###
df <- df %>% mutate(
    YEAR = as.integer(substr(DATE, 1, 4)),
    HOURS_WORKED = (AHWPE * EMPLOYED_POP * 1E6) / POP,
    GDP = (1E6 * GDP) / POP,
    INVESTMENT = INVESTMENT / POP,
    CONSUMPTION = CONSUMPTION / POP) %>%
    select(YEAR, GDP, CONSUMPTION, INVESTMENT, HOURS_WORKED)


### Export ###
write.csv(df, "INTERMEDIATE/pc_indicators.csv", row.names = FALSE)
rm()