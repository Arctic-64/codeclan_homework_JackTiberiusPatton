library(tidyverse)
library(ggplot2)
library(fastDummies)
library(GGally)


housing <- read.csv("D:/UNIVERSITY/CodeClan/codeclan_homework_JackTiberiusPatton/week_10/day_2/housing_prices.csv")



ggpairs(housing[,c("total_rooms", "total_bedrooms")])


housing %>%
  select(-total_bedrooms) -> housing




ggpairs(housing, title="cor plot")



housing %>%
  ggplot(
    aes(x = total_rooms, y = median_house_value)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


model <- lm(median_house_value ~ median_income, data = house_tidy)

par(mfrow = c(2,2))
plot(model)