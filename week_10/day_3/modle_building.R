library(tidyverse)
library(ggplot2)
library(fastDummies)
library(GGally)

kc <- read_csv("D:/UNIVERSITY/CodeClan/codeclan_homework_JackTiberiusPatton/week_10/day_3/kc_house_data.csv")

summary(kc)

kc <-  kc %>%
  select(-c("id", "date", "sqft_living15", "sqft_lot15", "zipcode"))

ggcorr(kc)

ggpairs(kc)

modle_1 <- lm(price ~ sqft_above, data = kc)
summary(modle_1)

kc %>% mutate(waterfront = as.logical(waterfront)) -> kc

modle_2 <- lm(price ~ waterfront, data = kc)
summary(modle_2)