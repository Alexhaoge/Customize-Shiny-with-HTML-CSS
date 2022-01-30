library(shiny)

server <- function(input, output, session) {
  observeEvent(input$bins, {
    # Followings add a dismissable alert every time the "bins" changes
    removeUI("#alert-holder .alert", immediate = T)
    insertUI(
      "#alert-holder", where = "afterBegin",
      ui = div(
        tags$button(
          type="button", class="close", `data-dismiss`="alert",
          `aria-label`="Close", span(`aria-hidden`="true", HTML("&times;"))
        ),
        class="alert alert-info alert-dismissible m-2", role = "alert",
        paste0("Alert: Input \"bins\" changes to", input$bins)
        ),
      immediate = T
    )
    output$distPlot <- renderPlot({
      x    <- faithful$waiting
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      hist(x, breaks = bins, col = "#75AADB", border = "white",
           xlab = "Waiting time to next eruption (in mins)",
           main = "Histogram of waiting times")
    })
  })
  
}