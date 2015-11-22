shinyUI(pageWithSidebar(
  headerPanel("Meristogram"),
  sidebarPanel(
    fileInput('file1', 'Choose CSV File',
              accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
    
    conditionalPanel(
      condition = "output.numWorms!=''",
      tags$hr(),
      sliderInput("movAvgIntervalSlider", "Moving Average Interval:", min=0, max=30, value=0),
      checkboxInput('lerp', 'Linear Interpolation', TRUE)
    ),
    
    tags$hr(),
    helpText(   a("Help",     href="https://github.com/WaylandM/meristogram/blob/master/doc/gui.md", target="_blank"))
  ),
  
  mainPanel(
    plotOutput('meristoPlot'),
    strong(textOutput('numWorms')),
    br(),
    uiOutput('plotDone'),
    conditionalPanel(
      condition="output.numWorms!=''", 
      downloadButton('downloadData', 'Meristogram Data'),
      downloadButton('downloadPDF', 'PDF Meristogram Plot'), 
      downloadButton('downloadPNG', 'PNG Meristogram Plot')
      )
  )
))

