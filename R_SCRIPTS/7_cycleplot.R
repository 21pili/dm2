# author : Pierre Pili
# email : pierre.pili@etu.minesparis.psl.eu
# description : Plots

### Libraries ###
library(tidyverse)
library(ggplot2)

### Imports ###
cycles <- read.csv("OUTPUT/DATA/cycles.csv")

### Plots ###
#GDP
cycle_plots <- ggplot(cycles) +
  geom_line(aes(x = YEAR, y = GDP_C, linetype = "GDP"), color = "#000000", size = 1) + #nolint
  geom_line(aes(x = YEAR, y = INVESTMENT_C, linetype = "Investment"), color = "#000000", size = 1) + #nolint
  geom_line(aes(x = YEAR, y = CONSUMPTION_C, linetype = "Consumption"), color = "#7d7d7d", size = 1) + #nolint
  geom_line(aes(x = YEAR, y = 10 * HOURS_WORKED_C, linetype = "Hours Worked"), color = "#7d7d7d", size = 1) + #nolint
  scale_y_continuous(
    name = "GDP, Investment, Consumption, Hours Worked",
  ) +
  scale_linetype_manual(values = c("GDP" = "solid", "Investment" = "dotted", "Consumption" = "solid", "Hours Worked" = "dotted")) + #nolint
  scale_color_manual(values = c("GDP" = "#000000", "Investment" = "#000000", "Consumption" = "#7d7d7d", "Hours Worked" = "#7d7d7d")) + #nolint
  theme(
    axis.title.x = element_text(size = 15),
    axis.title.y = element_text(size = 15),
    axis.text.x = element_text(size = 15),
    axis.text.y = element_text(size = 15),
    plot.margin = margin(1, 1, 1, 1, "cm"),
    legend.position = "bottom", legend.text = element_text(size = 15)
  ) +
  guides(linetype = guide_legend(override.aes = list(color = c("black", "#7d7d7d", "black", "#7d7d7d")))) #nolint


ggsave("OUTPUT/MEDIA/cycles.png", plot = cycle_plots, height = 10, width = 11, units = "in") #nolint
