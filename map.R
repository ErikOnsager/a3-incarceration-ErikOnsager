library(ggplot2)
library(dplyr)
library(stringr)

recent <- data %>% filter(year == 2018) %>% group_by(county_name) %>% summarize(`Incarcerated Population` = sum(total_jail_pop, na.rm = TRUE) + 
                          sum(total_prison_pop, na.rm = TRUE)) %>% mutate(county_name=tolower(county_name)) %>% mutate(county_name = word(county_name,1,-2))

us_counties = map_data("county")
us_counties <- us_counties %>% left_join(recent, by=c("subregion"="county_name"))
us_counties[is.na(us_counties)] = 0

ggplot(data = us_counties, mapping = aes(x = long, y = lat, group = group, fill = `Incarcerated Population`)) + ggtitle("Incarceration in the United States") + 
              scale_fill_continuous(type = "viridis") + geom_polygon() + theme(axis.line=element_blank(),axis.text=element_blank(),
              axis.ticks=element_blank(), axis.title=element_blank(), panel.background=element_blank(), panel.border=element_blank(), 
              panel.grid=element_blank(), legend.position="bottom", legend.key.size = unit(1,'cm'), plot.title = element_text(hjust = 0.5))