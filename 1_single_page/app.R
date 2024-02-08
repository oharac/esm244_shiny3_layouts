library(shiny)
library(tidyverse)

ui <- fluidPage(
  titlePanel('App title'),
  # sidebarLayout(
  #   sidebarPanel(
  #     h3('Sidebar header'),
  #     radioButtons(
  #       inputId = 'cyl_button',
  #       label = 'Number of cylinders',
  #       choices = c(4, 6, 8))
  #   ),
  #   mainPanel(
  #     h3('Main panel header'),
  #     plotOutput('mpg_plot')
  #   )
  # )
  fluidRow(         # <2>
    column(         # <3>
      width = 6,
      h3('Header for first row, first column'),
      selectInput(inputId = 'test', label = 'choose',
                  choices = c(month.name))
    ),
    column(         # <4>
      width = 6,
      h2('Header for first row, second column'),
      radioButtons(inputId = 'test2', label = 'click',
                   choices = 1:5)
    )
  ), ### end fluidRow 1

  hr(), ### horizontal rule so the row breaks are easier to see
  p('Here is some text between row 1 and 2 if you like'),
  hr(),

  fluidRow(
    column(
      width = 8,
      h2('Here is a header for row 2, column 1'),
      hr()
    ),
    column(
      width = 4,
      h4('here is a header for row 2, column 2'),
      textInput(inputId = 'text', label = 'type', width = '100%')
    )
  ) ### end fluidRow 2
)

server <- function(input, output) {
  output$mpg_plot <- renderPlot({
    ggplot(mtcars %>% filter(cyl == input$cyl_button),
           aes(x = wt, y = mpg)) +
      geom_point()
  })
}

### Combine them into an app:

shinyApp(ui = ui, server = server)
