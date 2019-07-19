library(shiny)

ui <- fluidPage(
        titlePanel("제목_Reactivity"),
        sidebarLayout(
         sidebarPanel(
           textInput(inputId = "in_caption",
                     label = "Caption:",
                     value = "Data Summary"),
           selectInput(inputId = "in_dataset",
                     label = "Choose a dataset:",
                     choices = c("v_rock", "v_pressure", "v_cars")),
           numericInput(inputId = "in_obs",
                     label = "Number of observations to view:",
                     value = 10),
      br(),
      hr(),
      img(src = "shiny.png",height = 60, width = 50,
      span(em("  R Shiny", style = "color : blue"))," and",strong(" HTML tags")),
      p("Take a fresh, interactive approach to telling", strong("your data story")," with",a("Shiny.",href = "http://shiny.rstudio.com")),
      p("Let users interact with your data and your analysis. And do it all with ",a("R.",href = "https://www.rstudio.com")),
      code('install.packages("shiny")'),
      hr(),
      tags$p(tags$em("Shiny R Go! 하자!"), "시작하기", span("클릭▽" ,style = "color : red")),
      a(img(src = "airim_img.png",height = 100,width = 180),href = "https://www.youtube.com/watch?v=A3oRzltM1G8&t=3s")

    
                    ),
         mainPanel(
           h3(textOutput(outputId = "out_caption")),
           hr(),
           verbatimTextOutput(outputId = "out_summary"),
           tableOutput(outputId = "out_view")
          
    )
  )
)

server <- function(input, output) {
  datasetInput <- reactive({
    switch(input$in_dataset,
           "v_rock" = rock,
           "v_pressure" = pressure,
           "v_cars" = cars)
  })
  output$out_caption <- renderText({
    input$in_caption
  })
  output$out_summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  output$out_view <- renderTable({
    head(x = datasetInput(), n = input$in_obs)
  })
  
}
shinyApp(ui, server)