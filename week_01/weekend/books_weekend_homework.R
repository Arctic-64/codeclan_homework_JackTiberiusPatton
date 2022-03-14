### I HAVE DONE EVERYTHING THAT I WAS TOLD WOULD RESULT IN SOMEONE BURNING MY LAPTOP
### THERE IS AN ENVIROMENT WIPE AND A DIRECTORY CHANGE IN THIS SCRIPT USING A FULL PATH

### DO *NOT* RUN THIS SCRIPT UNDER ANY CIRCUMSTANCES!!!

### YOU HAVE BEEN WARNED ###!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# NOTES
#24 languages, originally 27, 3 variations of english
## the indexes of the rows where a jump occurs 3349, 4702, 5876 & 8977
## in the top 100 books, 6 were published by the same company and 7 were written by the same author.
## in the bottom 100 books, there were 3 published by the same company and 3 by the same author.
## this shows a statistical trend toward positive attention possibley resulting from poorly recived books being discontinued.
## P.G. Wodehouse wrote the most books (40), massive considering the avarage number of books a single author has is 1.675403
## the most published books are vintage (310)
## the avarage rateing for all books is 3.934075, above 50% as the scail is from 0-5
## the median shows this is not a few indivisuals dragging the statistic up as the median is also 3.96 which is very close suggesting an even distribution of reviews.

#rm(list=ls()) ##clean enviroment (commented just to be on the safe side, your welcome)
setwd("D:/UNIVERSITY/CodeClan/de13_classnotes/week_01/day_5/2_weekend_homework/data/")
books <- read.csv("books.csv")

summary(books)

length(unique(na.omit(books$publisher)))      #2290 publishers
length(unique(na.omit(books$authors)))        #6639 authors
length(unique(na.omit(books$title)))          #10348 titles

nrow(books)  # total dataset is 11123 rows long therefor there are repeat values or NA's in the title data
sum(is.na(books$title))    # no NA's, therefor there is repeated data in the dataset that can squeww the data and tilt it one way.

books$language_code <- replace(books$language_code, grep("en-", books$language_code), "eng")

length(unique(na.omit(books$language_code)))  #24 languages, originally 27, 3 variations of english

sum(is.na(books$bookID))
sum(is.na(books$average_rating))
sum(is.na(books$ratings_count))
sum(is.na(books$text_reviews_count))
sum(is.na(books$num_pages))
sum(is.na(books$publication_date))
sum(is.na(books$authors))

# no apparent NA/s in data

#SOME ROWS ARE MISSING, first examples i found is rows 4704 & 4705
books = dplyr::arrange(books, books$rowid) ### arrange just to be sure the rows are in order before the loop.
count = 0
for(i in (1:(nrow(books)-1))){
  if (books$rowid[i] != books$rowid[i+1]-1){
    count = count + 1
  }
}
count #### this loop shows the row ID skips happen 4 times. however the total number of missing rows is over 4 so multiple rows must be missing with each skip. 

count = 0
for(i in (1:(nrow(books)-1))){
  if (books$rowid[i] != books$rowid[i+1]-1){
    count = count + 1
    jump_indexes[count] = i+1
  }
}
jump_indexes ## the indexes of the rows where a jump occurs 3349, 4702, 5876 & 8977


dplyr::arrange(books, desc(books$average_rating)) ### the best rated books have next to no reviews

top_books = head(dplyr::arrange(books, desc(books$average_rating)), 100)

max(table(top_books$authors))
max(table(top_books$publisher))

bottom_books = head(dplyr::arrange(books, (books$average_rating)), 100) ## while a lot of the bottom books have no reviews, a minority have a substansial number.
bottom_books
max(table(bottom_books$authors))
max(table(bottom_books$publisher))

mean(table(books$authors))
max(table(books$authors))
which.max(table(books$authors))
max(table(books$publisher))
which.max(table(books$publisher))

mean(books$average_rating)
median(books$average_rating)