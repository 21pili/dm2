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
    geom_line(aes(x = YEAR, y = log(GDP))) +
    geom_abline(intercept = -25.149, slope = 0.017, color = "#000000", linetype = "dashed") + #nolint
    annotate("text", x = max(cycles$YEAR), y = 8.79,
             label = paste("Slope:", 0.017),
             hjust = 1, vjust = 1, size = 5) +
    theme(
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        plot.margin = margin(1, 1, 1, 1, "cm")
    ) +
    labs(title = "Gross Domestic Product per Capita",
       x = "Year",  # Titre de l'axe x
       y = "log GDP")  # Titre de l'axe y

ggsave("OUTPUT/MEDIA/loggdp_pc.png", plot = gdp, height = 3, width = 8, units = "in") #nolint

#INVESTMENT
inv <- cycles %>% ggplot() +
    geom_line(aes(x = YEAR, y = log(INVESTMENT))) +
    geom_abline(intercept = -26.632, slope = 0.017, color = "#000000", linetype = "dashed") + #nolint
    annotate("text", x = max(cycles$YEAR), y = 7.348,
             label = paste("Slope:", 0.017),
             hjust = 1, vjust = 1, size = 5) +
    theme(
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        plot.margin = margin(1, 1, 1, 1, "cm")
    ) +
    labs(title = "Fixed Capital Formation per Capita",
       x = "Year",  # Titre de l'axe x
       y = "log Formation")  # Titre de l'axe y

ggsave("OUTPUT/MEDIA/loginv_pc.png", plot = inv, height = 3, width = 8, units = "in") #nolint

#CONSUMPTION
cons <- cycles %>% ggplot() +
    geom_line(aes(x = YEAR, y = log(CONSUMPTION))) +
    geom_abline(intercept = -23.734, slope = 0.016, color = "#000000", linetype = "dashed") + #nolint
    annotate("text", x = max(cycles$YEAR), y = 8.239,
             label = paste("Slope:", 0.016),
             hjust = 1, vjust = 1, size = 5) +
    theme(
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        plot.margin = margin(1, 1, 1, 1, "cm")
    ) +
    labs(title = "Private Final Consumption per Capita",
       x = "Year",  # Titre de l'axe x
       y = "log Consumption")  # Titre de l'axe y

ggsave("OUTPUT/MEDIA/logcons_pc.png", plot = cons, height = 3, width = 8, units = "in") #nolint

#HOURS WORKED
hours <- cycles %>% ggplot() +
    geom_line(aes(x = YEAR, y = log(HOURS_WORKED))) +
    geom_abline(intercept = 16.457, slope = -0.005, color = "#000000", linetype = "dashed") + #nolint
    annotate("text", x = 1999, y = 6.51,
             label = paste("Slope:", -0.005),
             hjust = 1, vjust = 1, size = 5) +
    theme(
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        plot.margin = margin(1, 1, 1, 1, "cm")
    ) +
    labs(title = "Hours Worked Annually per Capita",
       x = "Year",  # Titre de l'axe x
       y = "log Hours")  # Titre de l'axe y

ggsave("OUTPUT/MEDIA/loghours_pc.png", plot = hours, height = 3, width = 8, units = "in") #nolint
