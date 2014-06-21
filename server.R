## Developing Data Products
## Shiny Application - Body Mass Index(BMI) calculator
## User Interface

## This application calculates the BMI, which is a measure of relative weight based on an individual's mass and height.
## It takes the following inputs:
## 1. The value of the height
## 2. The value of the weight

library(shiny)

bmi <- function(weight, height) {
  w <- weight
  h <- height * height
  w / h
}

result <- function(weight, height) {
  w <- weight
  h <- height * height
  r<-w / h
  if (r<18.5){"Under weight"}
  else if(r>=18.5 && r<=24.9){"Normal"}
  else if(r>=25 && r<=29.9){"Overweight"}
  else if (r>=30){"Obesity"}
}

shinyServer(
  function(input, output) {
    output$bmi <- renderPrint({bmi(input$weight, input$height)})
    output$cat <- renderPrint({result(input$weight, input$height)})
    output$main_plot <- renderPlot({
      barplot(c(input$weight,bmi(input$weight, input$height)),
              xlab = "Weight",
              main = "BMI measure by weight",col=c("darkblue","red"),
              legend = rownames(input$weight))})
  }
)

#Execute application

runApp()