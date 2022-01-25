#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(UsingR)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    data("diamond")
    data_set = diamond
    
    fit_reg = lm(price ~ carat, data = data_set)

    modelpred = reactive({
        
        caratInput = input$SliderVal
        predict(fit_reg, newdata = data.frame(carat =  caratInput))
    })
        
    output$plot1 <- renderPlot({
        
        caratInput = input$SliderVal

        # 
        plot(data_set, pch = 16, col="blue", 
             ylab = "Price in Singapore dollars", 
             xlab = "Size of Diamond in Carat") + 
            abline(fit_reg, lwd =2, col="red")
        points(caratInput, modelpred(), col="green", pch=19, cex=2)
        

        # draw the histogram with the specified number of bins
        

    })
    
    output$pred1 = renderText({
        modelpred()
    })

})
