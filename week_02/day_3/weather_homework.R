weather = list(thursday = list(chance_of_rain = "20%", wind_speed = "21mph", temperature = "12°C"),
               friday = list(chance_of_rain = "10%", wind_speed = "10mph", temperature = "14°C"),
               saterday = list(chance_of_rain = "10%", wind_speed = "8mph", temperature = "17°C"))

weather$thursday$chance_of_rain
weather$thursday$wind_speed
weather$thursday$temperature

temp_2_weeks = c(12, 14, 17, 15, 10, 11, 17, 15, 14, 14, 13, 10, 10, 10)

weather_matrix = matrix(temp_2_weeks, nrow = 2, ncol = 7, byrow = TRUE)

weather_matrix[2, 3] ## week 2 day 3

weather_matrix[2,] ## week 2

weather_matrix[,c(1, 3, 5)] ## days 1 3 5 both weeks



Question_5 = function(input){
  if (is.character(input)){
    return(paste("the answer is:", input))
  }
  if (is.numeric(input)){
    if (input > 10){
      return(input/10)
    }else{
     return(input) 
    }
  }else{
    return("INVALID INPUT")
  }
}

Question_5("x")
Question_5("Hello_world")
Question_5(5)
Question_5(420)
Question_5(FALSE)



Question_6 = function(vec1, vec2){
  if (identical(vec1, vec2)){
    return("EXACTLY THE SAME")
  }
  if (identical(sort(vec1), sort(vec2))){
    return("THE SAME")
  }else{
    return("DIFFERENT")
  }
}

Question_6(1:3, 1:3)
Question_6(1:3, 3:1)
Question_6(1:3, 2:4)


Q7_matrix = matrix(nrow = 12, ncol = 12)
Q7_matrix
for (row_index in 1:nrow(Q7_matrix)) {
for (col_index in 1:ncol(Q7_matrix)) {
    Q7_matrix[row_index, col_index] <- row_index * col_index
  }  
}

Q7_matrix


Question_8 = function(vec){
  for (index in vec){
    cat("|")
    for (i in 1:index){
      cat("*")
    }
    cat("\n")
  }
}

Question_8(c(5, 9, 2, 5, 2, 2, 8, 4, 1, 6, 9))