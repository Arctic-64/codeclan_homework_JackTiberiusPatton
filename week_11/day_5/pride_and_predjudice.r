library(tidyverse)
library(tidytext)
library(ggwordcloud)
library(hcandersenr)
library(harrypotter)
library(janeaustenr)
library(text2vec)

glimpse(janeaustenr::prideprejudice)


book_word_count <- 
  austen_books() %>%
  filter(book == "Pride & Prejudice") %>%
  unnest_tokens(word, text) %>%
  count(word, book, sort = TRUE)

book_word_count %>%
  anti_join(stop_words) %>%
  inner_join(get_sentiments("bing")) -> book_word_count

book_word_count