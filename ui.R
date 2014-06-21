## Developing Data Products
## Shiny Application - Body Mass Index(BMI) calculator
## User Interface

## This application calculates the BMI, which is a measure of relative weight based on an individual's mass and height.
## It takes the following inputs:
## 1. The value of the height (in meters)
## 2. The value of the weight (in kilograms)

library(shiny)

  shinyUI(pageWithSidebar(
        headerPanel("Calculate your Body Mass Index"),
        sidebarPanel(
              p("Body mass index is a measure of body fat based on height and weight that applies to adult men and women.The BMI is used in a wide variety of contexts as a simple method to assess how much an individual's body weight departs from what is normal or desirable for a person of his or her height."),
              h4("Enter your weight and height using standard or metric measures."),
              h4("Select Compute BMI and your BMI will appear below"),
              numericInput("height", "Your height (meters)", 1.70, min = 0),
              numericInput("weight", label = "Your weight (kilograms)", 65, min =0),
              submitButton("Compute BMI")
              ),
    mainPanel(
              h3("Your BMI is"),
              verbatimTextOutput("bmi"),
              h5('BMI  Categories:'),
              h6('Underweight =  less than 18.5'),
              h6('Normal weight = from 18.5 to 24.9'),
              h6('Overweight = from 25 to 29.9'),
              h6('Obesity = BMI of 30 or greater'),
              h3('And your category is'),
              verbatimTextOutput("cat"),
              plotOutput("main_plot")
              )
    )
)
