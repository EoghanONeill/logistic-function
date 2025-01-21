pts <- seq(from = -5, to = 5, length = 700)

shinyServer(function(input, output, session) {

  output$plot1 <- renderPlot({
    
    ## Evaluate probabilities and plot
    b0_j1 <- input$b0_j1
    b1_j1 <- input$b1_j1
    b0_j2 <- input$b0_j2
    b1_j2 <- input$b1_j2
    # b0_j3 <- 1
    # b1_j3 <- 1
    vals1 <- exp(b0_j1 + b1_j1 * pts) / (1 + exp(b0_j1 + b1_j1 * pts) + exp(b0_j2 + b1_j2 * pts))
    vals2 <- exp(b0_j2 + b1_j2 * pts) / (1 + exp(b0_j1 + b1_j1 * pts) + exp(b0_j2 + b1_j2 * pts))
    vals3 <- 1 / (1 + exp(b0_j1 + b1_j1 * pts) + exp(b0_j2 + b1_j2 * pts))
    
    plot(pts, vals1, xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, col = "darkgoldenrod3", type = "l",
         xlab = "X", ylab = "Prob(Y = j|X = x)")
    lines(pts, vals2, #xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, 
         col = "red", type = "l"#,
         # xlab = "X", ylab = "Prob(Y = 2|X = x)"
         )
    lines(pts, vals3, #xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, 
         col = "blue", type = "l"#,
         # xlab = "X", ylab = "Prob(Y = 3|X = x)"
         )
    
    
  })
  
  output$plot2 <- renderPlot({
    
    ## Evaluate probabilities and plot
    b0_j1 <- input$b0_j1
    b1_j1 <- input$b1_j1
    b0_j2 <- input$b0_j2
    b1_j2 <- input$b1_j2
    # b0_j3 <- 0
    # b1_j3 <- 0
    vals1 <- exp(b0_j1 + b1_j1 * pts) / (1 + exp(b0_j1 + b1_j1 * pts) + exp(b0_j2 + b1_j2 * pts))
    vals2 <- exp(b0_j2 + b1_j2 * pts) / (1 + exp(b0_j1 + b1_j1 * pts) + exp(b0_j2 + b1_j2 * pts))
    vals3 <- 1 / (1 + exp(b0_j1 + b1_j1 * pts) + exp(b0_j2 + b1_j2 * pts))
    
    PE1 <- vals1*(b1_j1 - b1_j1*vals1 - b0_j2*vals2)
    PE2 <- vals2*(b1_j2 - b1_j1*vals1 - b0_j2*vals2)
    PE3 <- vals3*(0 - b1_j1*vals1 - b0_j2*vals2)
    
    plot(pts, PE1, xlim = c(-5, 5), ylim = c(-max(abs(c(b0_j1, b0_j2,1)))/2, max(abs(c(b0_j1, b0_j2,1)))/2), lwd = 2, col = "darkgoldenrod3", type = "l",
         xlab = "X", ylab = "Partial effects of x on choice probabilities")
    lines(pts, PE2, #xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, 
          col = "red", type = "l"#,
          # xlab = "X", ylab = "Prob(Y = 2|X = x)"
    )
    lines(pts, PE3, #xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, 
          col = "blue", type = "l"#,
          # xlab = "X", ylab = "Prob(Y = 3|X = x)"
    )
    
    
  })
  
})
