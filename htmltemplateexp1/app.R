library(shiny)
library(htmltools)

ui <- htmlTemplate("www/template1.html")

server <- function(input, output, session) {
  data1 <- data.frame(iris)
  
  output$title <- renderText('Shiny Custom HTML Template')
  
  output$summary <- renderPrint(summary(data1))
  
  output$plot1 <- renderPlot(plot(data1[,c(2,3)]))
  
  output$plot2 <- renderPlot(plot(data1[,c(3,4)]))
  
  output$searchInput <- renderText(input$search)
}

shinyApp(ui, server)