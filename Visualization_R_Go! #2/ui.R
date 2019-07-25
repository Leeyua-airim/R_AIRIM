fluidPage(theme = shinytheme("superhero"),
  titlePanel(em("시각화 R GO! 하자!"),windowTitle = "AIRIM_R_GO!"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "in_selection", label = "Choose a book:", choices = books),
      actionButton(inputId = "in_update",label =  "Change",icon(name="fab fa-apple")),
      hr(),
      sliderInput(inputId = "in_freq",
                  label = "Minimum Frequency:",
                  min = 1,  max = 50, value = 15, animate = TRUE),
      sliderInput(inputId = "in_max",
                  label = "Maximum Number of Words:",
                  min = 1,  max = 300,  value = 100,animate = TRUE)
    ),
    
    mainPanel(
      plotOutput(outputId = "out_plot"),
      hr(),
      verbatimTextOutput(outputId = "out_table")
    )
  )
)
