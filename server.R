pts <- seq(from = -10, to = 10, length = 700)

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
  
})
