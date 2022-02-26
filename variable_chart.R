library(dplyr)
library(ggplot2)
library(tidyverse)

recent <- data %>% filter(year == 2018) %>% filter(total_jail_pop >= 1) %>% rename(White = white_jail_pop, Black = black_jail_pop, Latinx = latinx_jail_pop, Aapi = aapi_jail_pop, 'Native American' = native_jail_pop) %>% 
                                                   pivot_longer(col = c("White", "Black", "Latinx", "Native American", "Aapi"), names_to = "Race", values_to = "Jail Population")

options(scipen = 999)
ggplot(recent, aes(x = region, y = `Jail Population`, fill = Race)) + geom_bar(stat = 'identity') + labs(title = "United States Jail Populations by Region") +
  theme(plot.title = element_text(hjust = 0.5)) + xlab("Region")