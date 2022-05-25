import pandas as pd
import numpy as np

drinks = pd.read_csv("D:/UNIVERSITY/CodeClan/de13_classnotes/week_12/day_2/4_homework/data/starbucks_drinkMenu_expanded.csv")

print(drinks.head(5))
print(drinks.tail(5))
print(drinks.shape)
print(drinks.columns)

print(drinks["Calories"].mean)
print(drinks["Calories"].min)
print(drinks["Calories"].max)

drinks_filtered = drinks.loc[:, ["Beverage", "Beverage_category", "Beverage_prep", "Calories"]].copy()

drinks_filtered.loc[:, "calorie_diff"] = 135 - drinks_filtered["Calories"]
print(drinks_filtered)

print(drinks_filtered.groupby("Beverage_category")["Calories"].mean())
print(drinks_filtered["Calories"].mean())


print(pd.unique(drinks["Beverage_category"]))


