library(shiny)
library(htmltools)

# h2f = function(...) {
#   shiny::h2(..., )
# }

ui <- htmlTemplate(
  "www/index.html",
  my_pie_chart = plotOutput("pie", height = "20rem"),
)

server <- function(input, output, session) {
  output$pie <- renderPlot({
    pie(c(0.4,0.3,0.3), labels = c("Direct", "Social", "Referral"),
        main="A Pie Chart Inserted by Shiny")
  })
}

shinyApp(ui, server)
