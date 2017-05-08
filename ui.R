library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Analysis of the 'abalone' data"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("percentage",
                  "Percentage of considered observations (randomly chosen):",
                   min = 0, max = 100, value = 25),
      h4('Please choose one outcome:'),
      checkboxInput("OLS2", "LongestShell"),
      checkboxInput("OD3", "Diameter"),
      checkboxInput("OH4", "Height"),
      checkboxInput("OW5", "WholeWeight"),
      checkboxInput("OS6", "ShuckedWeight"),
      checkboxInput("OVW7", "VisceraWeight"),
      checkboxInput("OSW8", "ShellWeight"),
      checkboxInput("OR9", "Rings"),
      
       
      h4('Please choose one regressor:'),
      checkboxInput("RLS2", "LongestShell"),
      checkboxInput("RD3", "Diameter"),
      checkboxInput("RH4", "Height"),
      checkboxInput("RW5", "WholeWeight"),
      checkboxInput("RS6", "ShuckedWeight"),
      checkboxInput("RVW7", "VisceraWeight"),
      checkboxInput("RSW8", "ShellWeight"),
      checkboxInput("RR9", "Rings"),
       
       
      h4('Please choose whether to regard type as the condition:'),
      checkboxInput("Typ", "Type"),
      
       
      h4('Do you want to include regression lines:'),
      checkboxInput("lmline", "Yes")
    ),
    
    mainPanel(
      h2('Note:'),
      h4('1. This is a simple application of "lm" model where only one regressor is considered at one time since we would like to illustrate the function of "lm" in a 2-dimensional graph.'),
      h4('2. First, you need to choose the desired outcome and regressor from the corresponding list to show a scatterplot below.'),
      h4('3. Further, you can add the variable "Type" to investigate the variation in different groups.'),
      h4('4. The regression line also presents potential features in data.'),
      h4('5. You can randomly choose a fraction of the dataset. Otherwise, just slide the bar to 100%.'),
      plotOutput('plot1')
     )
  )
))
