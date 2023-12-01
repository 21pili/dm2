# author : Pierre Pili
# email : pierre.pili@etu.minesparis.psl.eu
# description : convert indicators into unique units

### Libraries ###
library(tidyverse)


### Imports ###
df <- read.csv("INTERMEDIATE/raw_indicators.csv")

### Conversion ###


### Export ###
write.csv(df, "INTERMEDIATE/indicators.csv")
