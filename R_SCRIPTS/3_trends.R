# author : Pierre Pili
# email : pierre.pili@etu.minesparis.psl.eu
# description : regress indicators on time

### Libraries ###
library(tidyverse)
library(stargazer)
### Imports ###
df <- read.csv("INTERMEDIATE/pc_indicators.csv")

### Trends ###
lm_gdp <- lm(log(GDP) ~ YEAR, data = df)
lm_inv <- lm(log(INVESTMENT) ~ YEAR, data = df)
lm_cons <- lm(log(CONSUMPTION) ~ YEAR, data = df)
lm_hours <- lm(log(HOURS_WORKED) ~ YEAR, data = df)

### Export ###
trend_gdp <- stargazer(lm_gdp,
    title = "Real Gross Domestic Product in 2010 Euros per Capita With Respect to Time",  #nolint
    align = TRUE,
    type = "latex",
    out = "OUTPUT/TABLES/gdp_trend.tex",
    summary = FALSE)
trend_inv <- stargazer(lm_inv,
    title = "Private Final Consumption Expenditure in Constant Prices per Capita With Respect to Time", #nolint
    align = TRUE,
    type = "latex",
    out = "OUTPUT/TABLES/inv_trend.tex",
    summary = FALSE) #nolint
trend_cons <- stargazer(lm_cons,
    title = "Gross Fixed Capital Formation in Constant Prices per Capita With Respect to Time", #nolint
    align = TRUE,
    type = "latex",
    out = "OUTPUT/TABLES/cons_trend.tex",
    summary = FALSE)
trend_hours <- stargazer(lm_hours,
    title = "Hours Worked Annualy per Capita With Respect to Time",
    align = TRUE,
    type = "latex",
    out = "OUTPUT/TABLES/hours_trend.tex",
    summary = FALSE)
rm()