shinyUI(pageWithSidebar(
  headerPanel('Multinomial Logistic Regression Probabilities'),
  sidebarPanel(
    sliderInput('b0_j1', 'Select intercept parameter for j=1', value = -1, min = -10, max = 10, step = 0.25),
    sliderInput('b1_j1', 'Select slope parameter for j=1', value = 1, min = -10, max = 10, step = 0.25),
    sliderInput('b0_j2', 'Select intercept parameter for j=2', value = 1, min = -10, max = 10, step = 0.25),
    sliderInput('b1_j2', 'Select slope parameter for j=2', value = 0.5, min = -10, max = 10, step = 0.25)  
  ),
  mainPanel(
    plotOutput('plot1', width = "600px", height = "600px"),
    plotOutput('plot2', width = "600px", height = "600px")
  )
))
