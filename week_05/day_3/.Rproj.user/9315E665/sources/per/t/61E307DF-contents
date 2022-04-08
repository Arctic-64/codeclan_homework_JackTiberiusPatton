library(shiny)
library(tidyverse)
library(shinyWidgets)
library(shinythemes)
library(here)

students_data = read.table(file = here("students_tutorials.tsv"), header = TRUE)
css <- HTML(" body {
    background-color: #3FFFFE;
    color: #F0F786;
}")

ui <- fluidPage(
  tags$head(tags$style(css)),
  shinytheme(theme = "darkly"),
  titlePanel(tags$h1("student groups N shit")),
  
  sidebarLayout(
    titlePanel("tutor select"),
    
    mainPanel(
      radioButtons("binary1",
                   "binary position 1",
                   choices = c("0", "1")),
      radioButtons("binary2",
                   "binary position 2",
                   choices = c("0", "1")),
      radioButtons("binary3",
                   "binary position 3",
                   choices = c("0", "1"))
      
    )
  ),
  mainPanel(
    plotOutput("tutour_plot")
  )
)


server <- function(input, output) {
  
  output$tutour_plot <- renderPlot({
binary <- 1
if(input$binary1 == "1"){binary = binary + 1}
if(input$binary2 == "1"){binary = binary + 2}
if(input$binary3 == "1"){binary = binary + 4}
binary_group = paste0("Tut", as.character(binary))
students_data %>%
      filter(group == binary_group) %>%
      ggplot() +
      aes(x = students, y = essay1)+
geom_col(fill = "#FF1624")
  })
}

shinyApp(ui = ui, server = server)
