library(shiny)
library(htmltools)
library(bslib)

# bs_theme_preview()
theme = bs_theme(version = 4, font_scale = 1.2, spacer = "2rem", 
                 bootswatch = "materia")

ui <- bootstrapPage(
  theme = theme,
  tags$head(
    htmlDependency(
      name="my stylesheet",
      version = "1.0",
      src = "www/",
      stylesheet = "style.css"
    )
  ),
  htmlTemplate(
    "www/index.html",
    inputwidget = tagList(
      sliderInput(inputId = "bins", label = "Number of bins:", min = 1, max = 50, value = 30),
      submitButton(text = "Apply Changes", icon = NULL, width = NULL)
    ),
    plot1 = plotOutput(outputId = "distPlot"),
  )
)

server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)