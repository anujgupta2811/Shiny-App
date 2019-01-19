library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$OzonePlot <- renderPlot({
    a <- seq(min(input$Temp), max(input$Temp), by = 1)
    y <- airquality[airquality$Temp %in% a & !(is.na(airquality$Ozone)), ]
    y$Month <- as.factor(month.abb[y$Month])
    g <- ggplot(data = y, aes(Temp, Ozone))
    g <- g + geom_point(aes(col = Month),size=3)
    g <- g + geom_smooth(method="lm", col="firebrick", size=2) 
    g <- g + labs(x="Temperature (in degress F)", y="Ozone")
    g
  })
  
  output$SolarPlot <- renderPlot({
    a <- seq(min(input$Temp), max(input$Temp), by = 1)
    y <- airquality[airquality$Temp %in% a & !(is.na(airquality$Solar.R)), ]
    y$Month <- as.factor(month.abb[y$Month])
    g <- ggplot(data = y, aes(Temp, Solar.R))
    g <- g + geom_point(aes(col = Month),size=3)
    g <- g + geom_smooth(method="lm", col="firebrick", size=2) 
    g <- g + labs(x="Temperature (in degress F)", y="Solar Radiation")
    g
  })
  
})
