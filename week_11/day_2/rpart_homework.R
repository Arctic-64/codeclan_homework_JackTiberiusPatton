library(rpart)
library(rpart.plot)
library(tidyverse)
#library(yardstick)
#library(caret)

titanic_set <- read_csv("D:/UNIVERSITY/CodeClan/codeclan_homework_JackTiberiusPatton/week_11/day_2/titanic_decision_tree_data.csv")

shuffle_index <- sample(1:nrow(titanic_set))

# shuffle the data so class order isn't in order - need this for training/testing split later on 
titanic_set <- titanic_set[shuffle_index, ]

titanic_clean <- titanic_set %>%
  filter(survived %in% c(0,1)) %>%
  # Convert to factor level
  mutate(sex = as.factor(sex), 
         age_status = as.factor(if_else(age <= 16, "child", "adult")),
         class = factor(pclass, levels = c(3,2,1), labels = c("lower", "middle", "upper")), 
         survived_flag = factor(survived, levels = c(0,1), labels = c("no", "yes")), 
         port_embarkation = as.factor(embarked)) %>%
  select(sex, age_status, class, port_embarkation, sib_sp, parch, survived_flag) %>%
  na.omit()

## assess data


titanic_clean %>%
  select(survived_flag, class) %>%
  group_by(survived_flag, class) %>%
  summarise(total_count = n()) %>%
  ggplot() + 
  aes(x = survived_flag, y = total_count, fill = class) + 
  geom_bar(stat = "identity", position = position_dodge())

titanic_clean %>%
  select(survived_flag, sex) %>%
  group_by(survived_flag, sex) %>%
  summarise(total_count = n()) %>%
  ggplot() + 
  aes(x = survived_flag, y = total_count, fill = sex) + 
  geom_bar(stat = "identity", position = position_dodge())

titanic_clean %>%
  select(survived_flag, age_status) %>%
  group_by(survived_flag, age_status) %>%
  summarise(total_count = n()) %>%
  ggplot() + 
  aes(x = survived_flag, y = total_count, fill = age_status) + 
  geom_bar(stat = "identity", position = position_dodge())

index = sample(1:nrow(titanic_clean), size = nrow(titanic_clean)*0.25)
train = slice(titanic_clean, -index)
test = slice(titanic_clean, index)
fit = rpart(survived_flag ~ ., method = 'class', data = train)


### error in package managment, hard disk full, packages may be going to one drive or a temp folder, yardstick and carat not installing, ill fix soon.