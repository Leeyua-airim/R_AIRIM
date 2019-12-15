library(shiny)
library(rsconnect)

fluidPage(
  titlePanel("Reactivity"),
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "caption",
                label = "Caption:",
                value = "Data Summary"),
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),
      numericInput(inputId = "obs",
                   label = "Number of observations to view:",
                   value = 10),
      br(),
      hr(),
      img(src = "shiny.png",height = 60, width = 50,
          span(em("  R shiny", style = "color : blue")), " 시작하기."),
      p("Take a fresh, interactive approach to telling", strong("your data story")," with",a("Shiny.",href = "http://shiny.rstudio.com")),
      p("Let users interact with your data and your analysis. And do it all with ",a("R.",href = "https://www.rstudio.com")),
      code('install.packages("shiny")'),
      hr(),
      p(tags$em("Shiny R Go! 하자!"), "시작하기", span("▶" ,style = "color : red")),
      a(img(src = "airim_img.png",height = 100,width = 180),href = "https://www.youtube.com/watch?v=A3oRzltM1G8&t=3s")
      
      
    ),
    mainPanel(
      h3(textOutput("caption")),
      hr(),
      verbatimTextOutput("summary"),
      tableOutput("view")
      
    )
  )
)
