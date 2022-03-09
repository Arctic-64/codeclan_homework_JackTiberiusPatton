#rm(list=ls()) ##clean enviroment
setwd("D:/UNIVERSITY/CodeClan/de13_classnotes/week_01/day_3/6_homework_cleaning_data/data/")
movies = read.csv("movies.csv")
library(tidyverse)

summary(movies)
head(movies)

### TASK 2 ###

movies_selected = select(movies, title, runtime, budget)

movies_selected


### TASK 3 ###

nrow(filter(movies_selected, title == is.na(title)))
nrow(filter(movies_selected, runtime == is.na(runtime)))
nrow(filter(movies_selected, budget == is.na(budget)))

### TASK 4 ###

movies_na = mutate(movies_selected, runtime = na_if(runtime, 0))
movies_na
nrow(filter(movies_na, runtime == is.na(runtime)))

### TASK 5 ###

movies_imputed = mutate(movies_na, runtime = coalesce(runtime, median(runtime, na.rm = TRUE)))
movies_imputed
nrow(filter(movies_imputed, runtime == is.na(runtime)))


### TASK 6 ###

slice_min(movies_imputed, runtime, n = 10)
slice_max(movies_imputed, runtime, n = 10)


### TASK 7 ###

movies_imputed = mutate(movies_imputed, budget = if_else(budget < 100, median(budget), budget))
movies_imputed
nrow(filter(movies_imputed, budget == is.na(budget)))

### EXTENSION 1 ###

case_when(
movies_imputed$budget <= 12000000 ~ "Small budget",
movies_imputed$budget <= 40000000 ~ "Medium budget",
movies_imputed$budget > 40000000 ~ "Big budget"
) -> movies_imputed$movie_budgets

movies_imputed


### EXTENSION 2 ###

across()


