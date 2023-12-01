# author : Pierre Pili
# email : pierre.pili@etu.minesparis.psl.eu
# description : convert indicators into per capita units

### Libraries ###
library(tidyverse)
library(stargazer)
### Imports ###
df <- read.csv("INTERMEDIATE/pc_indicators.csv")

## Trends ##
#GDP
lm_gdp <- lm(log(GDP) ~ YEAR, data = df)
#INVESTMENT
lm_inv <- lm(log(INVESTMENT) ~ YEAR, data = df)
#CONSUMPTION
lm_cons <- lm(log(CONSUMPTION) ~ YEAR, data = df)
#HOURS
lm_hours <- lm(log(HOURS_WORKED) ~ YEAR, data = df)

### Export ###
stargazer(lm_gdp, title = "Real Gross Domestic Product in 2010 Euros per Capita With Respect to Time", align = TRUE, type = "latex", out = "TABLES/gdp_trend.tex", summary = FALSE) #nolint
stargazer(lm_inv, title = "Private Final Consumption Expenditure in Constant Prices per Capita With Respect to Time", align = TRUE, type = "latex", out = "TABLES/inv_trend.tex", summary = FALSE) #nolint
stargazer(lm_cons, title = "Gross Fixed Capital Formation in Constant Prices per Capita With Respect to Time", align = TRUE, type = "latex", out = "TABLES/cons_trend.tex", summary = FALSE) #nolint
stargazer(lm_hours, title = "Hours Worked Annualy per Capita With Respect to Time", align = TRUE, type = "latex", out = "TABLES/hours_trend.tex", summary = FALSE) #nolint