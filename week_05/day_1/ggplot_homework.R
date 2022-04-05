library(ggplot2)
library(tidyverse)
library(CodeClanData)

ggplot(qb_revenue_breakdown) +
  aes(x = Year, y = Revenue, fill = Product) +
  geom_col() 



qb_monthly_sales %>%
  filter(Cashflow == "Kwikbit Unit 1 Sales") -> kwikbit_sales
ggplot(kwikbit_sales) +
  aes(x = Date, y = Amount) + geom_line() 


qb_monthly_sales %>%
  filter(Cashflow != "Kwikbit Unit 1 Sales") -> revenue_and_costs
ggplot(revenue_and_costs) +
  aes(x = Date, y = Amount, colour = Cashflow) + geom_line() 