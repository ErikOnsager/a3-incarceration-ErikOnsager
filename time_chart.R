library(dplyr)
library(ggplot2)
library(tidyverse)

recent <- data %>% filter(year > 1984) %>% group_by(year) %>% summarize(White = sum(white_jail_pop, na.rm = TRUE), 
                                        Black = sum(black_jail_pop, na.rm = TRUE), Latinx = sum(latinx_jail_pop, na.rm = TRUE), 
                                        Aapi = sum(aapi_jail_pop, na.rm = TRUE), `Native American` = sum(native_jail_pop, na.rm = TRUE)) %>%
                                        pivot_longer(col = c("White", "Black", "Latinx", "Aapi", "Native American"), names_to = "Race", values_to = "Jail Population")
options(scipen = 999)
ggplot(data = recent) + geom_line(aes(x=year, y = `Jail Population`, group = Race, color = Race)) + labs(title = "United States Jail Populations over Time") +
  theme(plot.title = element_text(hjust = 0.5)) + xlab("Year")