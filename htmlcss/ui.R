library(shiny)
library(htmltools)


ui <- fluidPage(
  # define window title
  tags$head(
    tags$title("hello"),
    tags$style("
      /* followings means put a small background image in the bottom left */
      body {
        background-image: url(https://brand.wisc.edu/content/uploads/2016/11/uw-crest-color-300x180.png);
        background-color: rgba(255,255,255,0.5);
        background-repeat: no-repeat;
        background-position: center left;
      }
      /* The following changes the font size of input label */
      .shiny-input-container label {font-size: 3rem;}
    ")
  ),
  
  # Inline CSS
  # CSS uses '-' (minus) as a separator character in property names,
  # but this is an inconvenient character to use in an R function 
  # argument name. Instead, you can use '.' (period) and/or '_' 
  # (underscore) as separator characters.
  h2("Central limit theorem", style = 
    css(text.align="center", color="red")
  ),
  div(class="row", id="alert-holder"),
  sidebarLayout(
    sidebarPanel(
      # Now just as an example, we write tags of silderInput manually
      # and make some slight format changes
      sliderInput(inputId = "bins", label = "Number of bins:", min = 1, max = 50, value = 30),
      submitButton(text = "Apply Changes", icon = NULL, width = NULL)
    ),
    
    mainPanel(
      plotOutput(outputId = "distPlot"),
      # Native HTML - including a video from Youtube
      # Due to limited bandwidth of your server/shinyapps.io
      # It is always better to put videos and other large
      # resource files in somewhere else and use external link
      # so that user browser will download from other servers
      # directly without consuming the bandwidth of 
      # your shiny app server
      HTML('<iframe
           src="https://www.youtube.com/embed/0W84gxCm83A"
           title="YouTube video player" frameborder="0"
           allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
           allowfullscreen height="400" 
           style="width: 50%; aspect-ratio: 16/9; margin:3rem;"></iframe>')
    )
  )
)

