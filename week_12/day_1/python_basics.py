shopping = ["spam", "ham", "eggs", "ham"]
print(shopping[1])
print(shopping[2])
print(shopping[-1])


stops = ["Croy", "Cumbernauld", "Falkirk High","Linlithgow", "Livingston", "Haymarket"]
stops.append("Edinburgh Waverley")
stops.insert(0, "Queen Street")
stops.index("Croy")
stops.insert(stops.index("Linlithgow"), "Polmont")
stops.remove("Haymarket")
print(stops)
stops.clear()
print(stops)


person = {"name": "Steph", "age": 31, "Instructor" : True}
print(person.items())
print(person["name"])
person["email"] = "steph@codeclan.com"
del person["Instructor"]
print(person)



numbers = [1, 6, 2, 2, 7, 1, 6, 13, 99, 7]
for num in numbers:
   if num % 2 == 0:
      print(num)
print(max(numbers) - min(numbers))

import itertools
import operator
if any(map(operator.eq, numbers, itertools.islice(numbers, 1, None))):
    print(True)

def python(fun, weird):
    if fun or weird:
        print("Woo Python!")
    else:
        print("Python is not for me!")

chickens = [
  { "name": "Margaret", "age": 2, "eggs": 0 },
  { "name": "Hetty", "age": 1, "eggs": 2 },
  { "name": "Henrietta", "age": 3, "eggs": 1 },
  { "name": "Audrey", "age": 2, "eggs": 0 },
  { "name": "Mabel", "age": 5, "eggs": 1 },
]


def egg_num(chickens):
    count = 0
    for i in chickens:
        count += i["eggs"]
        i["eggs"] = 0
    return(count)


print(egg_num(chickens))