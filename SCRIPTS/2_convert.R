# author : Pierre Pili
# email : pierre.pili@etu.minesparis.psl.eu
# description : convert indicators into unique units

### Libraries ###
library(tidyverse)


### Imports ###
df <- read.csv("INTERMEDIATE/raw_indicators.csv")

### Conversion ###
df <- df %>% mutate(
    HOURS_WORKED = (AHWPE * EMPLOYED_POP * 1E6) / POP,
    GDP = (1E6 * GDP) / POP,
    INVESTMENT = INVESTMENT / POP,
    CONSUMPTION = CONSUMPTION / POP) %>%
    select(DATE, GDP, CONSUMPTION, INVESTMENT, HOURS_WORKED)


### Export ###
write.csv(df, "INTERMEDIATE/indicators.csv", row.names = FALSE)