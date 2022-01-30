This example use HTML templates to render Shiny UI. The template is modified from [https://github.com/amrrs/rshiny_html_template](https://github.com/amrrs/rshiny_html_template). As you can see in the HTML file, you can directly use R function in the placeholder.

The search bar is written in HTML, but you can access it in Shiny by its "name" attribute, for example a input tag like
```HTML
<input type="text" class="form-control" placeholder="Search"  name="search">
```
Its value can be extracted in server function simply by
```R
server <- function(input, output, session) {
  ...
  output$searchInput <- renderText(input$search)
}
```
**If you try input some text in the search box, it will display here.**