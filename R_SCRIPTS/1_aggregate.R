# author : Pierre Pili
# email : pierre.pili@etu.minesparis.psl.eu
# description : load and aggregate key macro indicators

### Libraries ###
library(tidyverse)

### Imports ###
population <- read.csv("RAW/POPTOTFRA647NWDB.csv", col.names = c("DATE", "POP"))  #Millions of People # nolint
ahwpe <- read.csv("RAW/AVHWPEFRA065NRUG.csv", col.names = c("DATE", "AHWPE")) #Hours #nolint
investment <- read.csv("RAW/NAEXKP04FRQ189S.csv", col.names = c("DATE", "INVESTMENT")) #Real Currency #nolint
employed_pop <- read.csv("RAW/FRAEMPT.csv", col.names = c("DATE", "EMPLOYED_POP")) #Millions of People #nolint
consumption <- read.csv("RAW/NAEXKP02FRQ189S.csv", col.names = c("DATE", "CONSUMPTION")) #Real Currency #nolint
gdp <- read.csv("RAW/CLVMNACSCAB1GQFR.csv", col.names = c("DATE", "GDP")) #Real Currency #nolint

### Harmonized dates ###
population <- population %>% filter(
    DATE < "2005-01-01" &
    DATE > "1979-12-01" &
    grepl("*01-01", DATE))

ahwpe <- ahwpe %>% filter(
    DATE < "2005-01-01" &
    DATE > "1979-12-01" &
    grepl("*01-01", DATE))

investment <- investment %>% filter(
    DATE < "2005-01-01" &
    DATE > "1979-12-01" &
    grepl("*01-01", DATE))

consumption <- consumption %>% filter(
    DATE < "2005-01-01" &
    DATE > "1979-12-01" &
    grepl("*01-01", DATE))

gdp <- gdp %>% filter(
    DATE < "2005-01-01" &
    DATE > "1979-12-01" &
    grepl("*01-01", DATE))

employed_pop <- employed_pop %>% filter(
    DATE < "2005-01-01" &
    DATE > "1979-12-01" &
    grepl("*01-01", DATE))

df <- population %>%
    left_join(ahwpe) %>%
    left_join(investment) %>%
    left_join(consumption) %>%
    left_join(employed_pop) %>%
    left_join(gdp)

### Export ###
write.csv(df, "INTERMEDIATE/raw_indicators.csv", row.names = FALSE)
rm()