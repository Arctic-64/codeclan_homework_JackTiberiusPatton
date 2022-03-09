rm(list=ls()) ##clean enviroment

library(dplyr)

### TASK 1 ###

setwd("D:/UNIVERSITY/CodeClan/de13_classnotes/week_01/day_2/5_homework_dplyr/data/")
drinks = read.csv(file = "drinks_content.csv")

summary(drinks)

### TASK 2 ###

drinks_filtered = na.omit(select(drinks, Beverage_category, Beverage, Beverage_prep, Calories))
drinks_filtered

### TASK 3 ###

drinks_filtered = mutate(drinks_filtered, calorie_diff = Calories - 135)

### TASK 4 ###

group_by(drinks_filtered, Beverage_category) %>%
  summarise(mean_cal = mean(Calories)) %>%
  arrange(mean_cal) -> ordered_list
head(ordered_list, 3)
tail(ordered_list, 3)

## conclusion, temperature appears to have no impact on the number of cal's in a drink, neither does cafeine content
## however, the seemingly older style of coffee appears to have a lower callorie count than newer variations.
## one could think that newer brands are adding more callories to make their drinks more sucessfull.
## ingrediants to make tastier drinks may have a higher callorie count, or cheaper more refined mass produced materials that are more callori dense and more available.
## insufficant evidence, more data and control variables required.
## avarage cal count is about half from minimum to maximum cal counts

### TASK 5 ###

group_by(drinks_filtered, Beverage_prep) %>%
  summarise(mean_cal = mean(Calories)) %>%
  arrange(mean_cal) -> ordered_list
head(ordered_list, 3)
tail(ordered_list, 3)

## strong statistical corrolation between prescence of milk in the drink and high callory count
## callory content from minimum to maximum is over a 40 fold increase
## conclusion, the prep method and presence of milk has a significant impact on the callori count of a drink
## at least acording to this data. larger sample size and control varialbes required.


### TASK 6 ###
drink_av_cal = mean(drinks_filtered$Calories)
filter(ordered_list, mean_cal > drink_av_cal)

### TASK 7 ###

head(arrange(drinks_filtered), 1)

## the lowest callory drink at 3 cal is a coffee in the catagory of brewwed coffee prepped in a short fasion