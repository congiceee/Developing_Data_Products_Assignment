library(shiny)

shinyServer(function(input, output) {
  output$plot1<-renderPlot({
    set.seed(20170508)
    library(AppliedPredictiveModeling)
    library(dplyr)
    library(ggplot2)
    data(abalone)
    numb <-  dim(abalone)[1]
    Ndf <- sample_n(abalone, input$percentage * numb / 100)
  
    if (input$OLS2) {dataY <- Ndf$LongestShell}
    if (input$OD3) {dataY <- Ndf$Diameter}
    if (input$OH4) {dataY <- Ndf$Height}
    if (input$OW5) {dataY <- Ndf$WholeWeight}
    if (input$OS6) {dataY <- Ndf$ShuckedWeight}
    if (input$OVW7) {dataY <- Ndf$VisceraWeight}
    if (input$OSW8) {dataY <- Ndf$ShellWeight}
    if (input$OR9) {dataY <- Ndf$Rings}
  
    if (input$RLS2) {dataX <- Ndf$LongestShell}
    if (input$RD3) {dataX <- Ndf$Diameter}
    if (input$RH4) {dataX <- Ndf$Height}
    if (input$RW5) {dataX <- Ndf$WholeWeight}
    if (input$RS6) {dataX <- Ndf$ShuckedWeight}
    if (input$RVW7) {dataX <- Ndf$VisceraWeight}
    if (input$RSW8) {dataX <- Ndf$ShellWeight}
    if (input$RR9) {dataX <- Ndf$Rings}
  
    if (input$Typ) {
      dataZ <- Ndf$Type
      df <- data.frame(X = dataX, Y = dataY, Z = dataZ)
      p <- ggplot(df, aes(x = X,y = Y, colour = Z))
    }
    else {
      df <- data.frame(X = dataX, Y = dataY)
      p <- ggplot(df, aes(X, Y))
    }
    
    
    if (input$lmline) {
      p + geom_point(alpha = .5) + geom_smooth(method = 'lm')
    }
    else {
      p + geom_point(alpha = .5)
    }
    
  })
})