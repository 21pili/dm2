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
    name = "GDP, Investment, Consumption",
    sec.axis = sec_axis(~ .,
                        name = "Hours Worked",
                        labels = scales::comma_format(scale = 0.1),
                        breaks = scales::breaks_pretty())
  ) +
  scale_linetype_manual(values = c("GDP" = "solid", "Investment" = "dotted", "Consumption" = "solid", "Hours Worked" = "dotted")) + #nolint
  scale_color_manual(values = c("GDP" = "#000000", "Investment" = "#000000", "Consumption" = "#7d7d7d", "Hours Worked" = "#7d7d7d")) + #nolint
  theme(
    axis.title.x = element_text(size = 10),
    axis.title.y = element_text(size = 10),
    axis.text.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    plot.margin = margin(1, 1, 1, 1, "cm"),
    legend.position = "right", legend.text = element_text(size = 8)
  ) +
  labs(
    title = "Cyclical Variables per Capita in 2010 Euros (left) and Hours (right)", #nolint
    x = "Year",
    y = "2010 Euros"
  ) +
  guides(linetype = guide_legend(override.aes = list(color = c("black", "#7d7d7d", "black", "#7d7d7d")))) #nolint


ggsave("OUTPUT/MEDIA/cycles.png", plot = cycle_plots, height = 5, width = 11, units = "in") #nolint
