library(dplyr)
data <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

recentdata <- data %>% filter(year == max(year))

summary_info <- list()

#total number of incarcerated persons in 2018
summary_info$incarcerated_2018 = round(sum(recentdata$total_jail_pop, na.rm = TRUE) + sum(recentdata$total_prison_pop, na.rm = TRUE))

#number of incarcerated persons by race
summary_info$white_incarceration = round(((sum(recentdata$white_jail_pop, na.rm = TRUE) + sum(recentdata$white_prison_pop, na.rm = TRUE)) / summary_info$incarcerated_2018) * 100, digits = 2)
summary_info$black_incarceration = round(((sum(recentdata$black_jail_pop, na.rm = TRUE) + sum(recentdata$white_prison_pop, na.rm = TRUE)) / summary_info$incarcerated_2018) * 100, digits = 2)
summary_info$latinx_incarceration = round(((sum(recentdata$latinx_jail_pop, na.rm = TRUE) + sum(recentdata$white_prison_pop, na.rm = TRUE)) / summary_info$incarcerated_2018) * 100, digits = 2)
summary_info$native_incarceration = round(((sum(recentdata$native_jail_pop, na.rm = TRUE) + sum(recentdata$white_prison_pop, na.rm = TRUE)) / summary_info$incarcerated_2018) * 100, digits = 2)
summary_info$aapi_incarceration = round(((sum(recentdata$aapi_jail_pop, na.rm = TRUE) + sum(recentdata$white_prison_pop, na.rm = TRUE)) / summary_info$incarcerated_2018) * 100, digits = 2)

#proportion of races in America
summary_info$white_proportion = round(sum(recentdata$white_pop_15to64, na.rm = TRUE) / sum(recentdata$total_pop_15to64) * 100, digits = 2)
summary_info$black_proportion = round(sum(recentdata$black_pop_15to64, na.rm = TRUE) / sum(recentdata$total_pop_15to64) * 100, digits = 2)
summary_info$latinx_proportion = round(sum(recentdata$latinx_pop_15to64, na.rm = TRUE) / sum(recentdata$total_pop_15to64) * 100, digits = 2)
summary_info$native_proportion = round(sum(recentdata$native_pop_15to64, na.rm = TRUE) / sum(recentdata$total_pop_15to64) * 100, digits = 2)
summary_info$aapi_proportion = round(sum(recentdata$aapi_pop_15to64, na.rm = TRUE) / sum(recentdata$total_pop_15to64) * 100, digits = 2)

format(summary_info, scientific = F)