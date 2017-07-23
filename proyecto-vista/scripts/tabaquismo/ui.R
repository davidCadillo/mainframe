library(dygraphs)

shinyUI(fluidPage(
  
  titlePanel("Tabaquismo en la Libertad"),
  
  sidebarLayout(
    sidebarPanel(
    ),
    mainPanel(
      dygraphOutput("dygraph")
    )
  )
))
