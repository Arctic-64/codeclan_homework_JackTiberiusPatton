library(tidyverse)
setwd("D:/UNIVERSITY/CodeClan/de13_classnotes/week_02/day_1/5_homework/data/")
cardbase = read.csv(file = "CardBase.csv")
customerbase = read.csv(file = "CustomerBase.csv")
fraudbase = read.csv(file = "FraudBase.csv")
transactionbase = read.csv(file = "TransactionBase.csv")
exams = read.csv(file = "exam_scores.csv")
hats = read.csv(file = "hat_observations.csv")

transactionbase = rename(transactionbase, Card_Number = Credit_Card_ID)

colnames(cardbase)
colnames(customerbase)
colnames(fraudbase)
colnames(transactionbase)


custcards = full_join(cardbase, customerbase, by = "Cust_ID")


nrow(custcards)
nrow(customerbase)
nrow(cardbase)

transactionfraud = full_join(transactionbase, fraudbase, by = "Transaction_ID")
transactionfraud

nrow(transactionbase)
nrow(fraudbase)
nrow(transactionfraud)

coagulated = semi_join(custcards, transactionfraud, by = "Card_Number")
coagulated
nrow(coagulated)
nrow(transactionfraud)
nrow(custcards)



hats%>%
  separate(observation, into = c("hat_colour", "hat_type"), sep = ",") %>%
  unite("date", "day", "month", "year", sep = "/") -> hats
hats

berets = filter(hats, hat_type == "beret")

berets[which.max(berets$observation_count),]["date"]
# 18/6/2018