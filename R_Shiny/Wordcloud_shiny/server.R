function(input, output, session) {
  terms <- reactive({
    
    input$in_update
    
    isolate({
      withProgress({
        setProgress(message = "잠시만 기다려 주세요 :)")
        getTermMatrix(input$in_selection)
      })
    })
  })
  wordcloud_rep <- repeatable(wordcloud)
  
  output$out_plot <- renderPlot({
    v <- terms()
    wordcloud_rep(words = names(v),freq = v, scale=c(4,0.5),
                  min.freq = input$in_freq, max.words=input$in_max,
                  colors=brewer.pal(8, "Dark2"))
  })
  
  output$out_table <-renderPrint({
    v<-terms()
    print(head(v,input$in_max))

  })
}