library(shiny)

# Define UI for application that draws a scatter plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Air Quality Data"),
  
  # Sidebar with a slider input for number of month
  sidebarLayout(position = "left",
    sidebarPanel(
       sliderInput("Temp",
                   "Slide Temperature: ",
                   min = 50,
                   max = 100,
                   value = c(60,80), width = "1400px"),
       selectInput(
         inputId = "Month",
         label = "Choose Month:",
         choices = c("May", "June", "July", "August", "September"),
         selected = "May",
         multiple = TRUE
       ),
       submitButton("Submit")
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Temperature vs Ozone Plot"),
      p("This is a plot between Temperature and Ozone in New York from May to September 1973. 
          The data for this plot has been taken from airquality dataset. 
          Slide the temperature slider to see the changes in the plot"
        ),
       plotOutput("OzonePlot"),
      h3("Temperature vs Solar Radiation Plot"),
      p("This is a plot between Temperature and Solar Radiation in New York from May to September 1973. 
         The data for this plot has been taken from airquality dataset
         Slide the temperature slider to see the changes in the plot"
      ),
      plotOutput("SolarPlot")
    )
  )
))
