library(shiny)
library(htmltools)
library(thematic)
library(bslib)

ui <- tags$body(
  tags$head(
    # Importing local css file
    # we want to use some fancy icons from
    # font-awesome(https://fontawesome.com/v4.7/)
    # so we download the minimized css file and 
    # put it into www directory 
    htmlDependency(
      name = "font-awesome",
      version = "4.7",
      src = "www/font-awesome-4.7.0/",
      stylesheet = c("css/font-awesome.min.css", 
                     "fonts/fontawesome-webfont.ttf")
    )
  ),
  div(id="particles-js",
  fluidPage(
    theme = bs_theme(bootswatch = "darkly"),
    titlePanel("Central limit theorem"),
    sidebarLayout(
      sidebarPanel(
        numericInput("m", "Number of samples:", 2, min = 1, max = 100),
        submitButton(text = "Apply Changes", icon = NULL, width = NULL),
        span("icon from Font Awesome: "),
        tags$i(class = "fa fa-file-pdf-o fa-2x", `aria-hidden`="true"),
        tags$i(class = "fa fa-refresh fa-spin fa-3x fa-fw"),
      ),
      mainPanel(
        plotOutput("hist"),
      )
    ),
  ),
  ),
  # Usually we import JS at the end of file so that it will be faster
  # to load HTML page first, and then the interactive JS files
  # What's more, in particles.js, due to its own design,
  # we must import the script at the end
  # using htmlDependency will result in placing the script in the head
  tags$script(src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.js"),
  tags$script(src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/demo/js/app.js")

)

server <- function(input, output, session) {
  output$hist <- renderPlot({
    means <- replicate(1e4, mean(runif(input$m)))
    hist(means, breaks = 20)
  }, res = 96)
}
thematic_shiny()
shinyApp(ui, server)
