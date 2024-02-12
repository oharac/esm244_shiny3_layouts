### Attach necessary packages
library(shiny)
library(tidyverse)

### Create the user interface object
ui <- fluidPage(
  titlePanel('App title'),
  fluidRow(
    column(width = 6,
      h3('Column 1 header'),
      radioButtons(
        inputId = 'cyl_button',
        label = 'Number of cylinders',
        choices = c(4, 6, 8)
      )
    ), ### end column
    column(width = 6,
      h3('Column 2 header'),
      plotOutput('mpg_plot')
    )
  ), ### end fluidRow 1

  hr(),  ### horizontal rule so the row breaks are easier to see
  p('Here is some text between rows 1 and 2 if you like'),
  hr(),

  fluidRow(
    column(
      width = 2,
      h2('This is a header for row 2, column 1')
    ),
    column(
      width = 7,
      h4('This is a header for row 2, column 2'),
      hr()
    ),
    column(
      width = 3,
      h3('This is a header for row 2, column 3')
    )
  )
)


### Create the server function
server <- function(input, output) {
  output$mpg_plot <- renderPlot({
    ggplot(mtcars %>% filter(cyl == input$cyl_button),
           aes(x = wt, y = mpg)) +
      geom_point()
  })
}


### Combine them into an app
shinyApp(ui = ui, server = server)
