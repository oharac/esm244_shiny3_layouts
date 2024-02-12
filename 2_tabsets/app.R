library(shiny)
library(tidyverse)

ui <- fluidPage(
  titlePanel('App title'), ### titlePanel is optional, but looks nice on top

  tabsetPanel( ### start with tabsetPanel, then swap out for navlistPanel
  # navlistPanel(

    tabPanel(
      title = 'Tab 1',
      fileInput(inputId = 'file',
                label = 'Choose a file',
                buttonLabel = 'upload...'),
      p('Here is some paragraph text')
    ), ### end tab 1

    tabPanel(
      title = 'Tab 2',
      sidebarLayout(
        sidebarPanel(
          h3('Here is a sidebar')
        ),
        mainPanel(
          h2('Here is a main panel')
        )
      ) ### end sidebarLayout
    ), ### end tab2

    tabPanel(
      title = 'Tab 3',
      tabsetPanel(
        tabPanel(
          title = 'Tab 3a',
          h2('This tab is nested within another tab!')
        ),
        tabPanel(
          title = 'Tab 3b',
          h3('This is another tab')
        )
      )
    ) ### end tab 3.

  ) ### end of tabsetPanel
)


server <- function(input, output) {
  ### put some server functions in here
}


### combine into an app:
shinyApp(ui = ui, server = server)
