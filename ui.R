#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Course 9 Final Project (S Roy)"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("SliderVal",
                        "What is the Carat of the Diamond:",
                        min = 0.10,
                        max = 0.40,
                        value = 0.25),
            submitButton("Calculate Now")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h2("Description"),
            h3("A data frame with 48 observations on the following 2 variables.
               carat - A measurement of a diamond's size,
               price - Price in Singapore dollars"),
            h3("The User of the app need to provide the carat through the slide,
               Then user need to press the - Calculate Now Button to run the calculation. 
               The plot will show the point in Green dot and the value will be seen at bottom"),
            plotOutput("plot1"),
            h2("Predicted Price of the Diamond" ),
            textOutput("pred1")
        )
    )
))
