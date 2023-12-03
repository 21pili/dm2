# author : Pierre Pili
# email : pierre.pili@etu.minesparis.psl.eu
# description : Plots

### Libraries ###
library(tidyverse)
library(ggplot2)

### Imports ###
cycles <- read.csv("OUTPUT/DATA/cycles.csv") %>% mutate(
    DATE = as.Date(paste(YEAR, "-01-01", sep = ""), format = "%Y-%m-%d"))

### Plots ###
#GDP
gdp <- cycles %>% ggplot() +
    geom_line(aes(x = YEAR, y = GDP)) +
    theme(
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        plot.margin = margin(1, 1, 1, 1, "cm")
    ) +
    labs(title = "Gross Domestic Product per Capita",
       x = "Year",  # Titre de l'axe x
       y = "2010 Euros")  # Titre de l'axe y

ggsave("OUTPUT/MEDIA/gdp_pc.png", plot = gdp, height = 3, width = 8, units = "in") #nolint

#INVESTMENT
inv <- cycles %>% ggplot() +
    geom_line(aes(x = YEAR, y = INVESTMENT)) +
    theme(
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        plot.margin = margin(1, 1, 1, 1, "cm")
    ) +
    labs(title = "Fixed Capital Formation per Capita",
       x = "Year",  # Titre de l'axe x
       y = "2010 Euros")  # Titre de l'axe y

ggsave("OUTPUT/MEDIA/inv_pc.png", plot = inv, height = 3, width = 8, units = "in") #nolint

#CONSUMPTION
cons <- cycles %>% ggplot() +
    geom_line(aes(x = YEAR, y = CONSUMPTION)) +
    theme(
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        plot.margin = margin(1, 1, 1, 1, "cm")
    ) +
    labs(title = "Private Final Consumption per Capita",
       x = "Year",  # Titre de l'axe x
       y = "2010 Euros")  # Titre de l'axe y

ggsave("OUTPUT/MEDIA/cons_pc.png", plot = cons, height = 3, width = 8, units = "in") #nolint

#HOURS WORKED
hours <- cycles %>% ggplot() +
    geom_line(aes(x = YEAR, y = HOURS_WORKED)) +
    theme(
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        plot.margin = margin(1, 1, 1, 1, "cm")
    ) +
    labs(title = "Hours Worked Annually per Capita",
       x = "Year",  # Titre de l'axe x
       y = "Hours")  # Titre de l'axe y

ggsave("OUTPUT/MEDIA/hours_pc.png", plot = hours, height = 3, width = 8, units = "in") #nolint