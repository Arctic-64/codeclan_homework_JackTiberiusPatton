library(tidyverse)
library(ggplot2)
library(janitor)
library(modelr)
library(broom)

projects <- read.csv("D:/UNIVERSITY/CodeClan/codeclan_homework_JackTiberiusPatton/week_10/project_management.csv")

projects %>%
  ggplot(aes(y = estimated_length, x = actual_length)) +
  geom_point()

cor(projects$estimated_length, projects$actual_length)
#0.804 corilaation coeficianct

model <- lm(formula = estimated_length ~ actual_length, data = projects)
fitted(model)
model
summary(model)


glance_output <- clean_names(glance(model))
glance_output

## prettty high R squared, showing that the model is not that dependant


##RUSHED