server <- function(input, output, session) {
  in_file<-reactive({
    input$img_file
  })
  output$uploaded_image <- renderImage({
    
    src <- in_file()$datapath
    
    if (is.null(src)) {
      list(src = "www/black_cat.jpg",
           height = "300",
           alt = "현재파일은 이미지 파일이 아닙니다:)")
    } else {
      return(list(
        src = src,
        height = "300",
        alt = "이미지 파일이 아닙니다:)"
      ))
    }
  },deleteFile = FALSE) #◀이 코드도 꼭 적어주세요:)

  output$keras_table <- DT::renderDataTable({
    uploaded_img_path <- in_file()$datapath
    
    if (is.null(uploaded_img_path)) {
      if(input$input_check) {
        withProgress(message = '잠시만 기다려 주세요 :)',
                     classify_image("www/black_cat.jpg")
        )
      } else {
        NULL   
      }
    } else {
      withProgress(message = '잠시만 기다려 주세요 :)', 
                   img2tbl_df <- classify_image(uploaded_img_path)
      )
      DT::datatable(img2tbl_df)
    }
  })
}
  
 