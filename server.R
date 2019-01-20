library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$OzonePlot <- renderPlot({
    a <- seq(min(input$Temp), max(input$Temp), by = 1)
    airquality$Month <- month.name[airquality$Month]
    y <- airquality[airquality$Temp %in% a & !(is.na(airquality$Ozone)) & airquality$Month %in% input$Month, ]
    g <- ggplot(data = y, aes(Temp, Ozone))
    g <- g + geom_point(aes(col = Month),size=3)
    g <- g + geom_smooth(method="lm", col="firebrick", size=2) 
    g <- g + labs(x="Temperature (in degress F)", y="Ozone")
    g
  })
  
  output$SolarPlot <- renderPlot({
    a <- seq(min(input$Temp), max(input$Temp), by = 1)
    airquality$Month <- month.name[airquality$Month]
    y <- airquality[airquality$Temp %in% a & !(is.na(airquality$Solar.R)) & airquality$Month %in% input$Month, ]
    g <- ggplot(data = y, aes(Temp, Solar.R))
    g <- g + geom_point(aes(col = Month),size=3)
    g <- g + geom_smooth(method="lm", col="firebrick", size=2) 
    g <- g + labs(x="Temperature (in degress F)", y="Solar Radiation")
    g
  })
  
})
