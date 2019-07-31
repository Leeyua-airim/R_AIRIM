convertMenuItem <- function(mi, tabName) {
  mi$children[[1]]$attribs['data-toggle']="tab"
  mi$children[[1]]$attribs['data-value'] = tabName
  if(length(mi$attribs$class)>0 && mi$attribs$class=="treeview"){
    mi$attribs$class=NULL
  }
  mi
}


header <-dashboardHeader(titleWidth = 350, title = em("#인공지능 #시각화 R GO! 하자!"))

sidebar<-dashboardSidebar(
  sidebarMenu(id = "menu",
              wellPanel(style = "background-color: #170c45",  
                        menuItem("Data",tabName = "data_maun",icon = icon(name = "table")),
                        fileInput("img_file", "Choose Image file", accept = c('image/png', 'image/jpeg','image/jpg'))),
              convertMenuItem(
                menuItem("옵션",tabName = "var_maun",icon = icon(name = "columns"),
                         checkboxInput("input_check", "이 사진을 분석하고 싶다면 클릭해 주세요:)", FALSE)),"var_manu"),
              br(),
              br(),
              br(),
              br(),
              br(),
              br(),
              br(),
              br(),
              img(src = "그림2.png",height = 230,width = 230)
              
  ))




body<- dashboardBody(
  tabBox(width = 12,
         tabPanel("이미지",
                  imageOutput("uploaded_image", height = 300)),
         tabPanel("결과 확인",
                  DT::dataTableOutput("keras_table")),
         tabPanel("현재 사용중인 모델",
                  h3("Xception module"),
                  br(),
                  a(href = "https://datascienceschool.net/view-notebook/0faaf59e0fcd455f92c1b9a1107958c4/",
                    "▶ 자세한 내용 확인하기" ))
  ),
  
  box(width = 12,status = "primary",collapsible = TRUE,collapsed = FALSE,title = "광고가 표시되는 영역입니다.",
      a(href="https://www.youtube.com/에이림",tags$img(src = "title.jpg",height = 150,witdh = 430)))
  
)

dashboardPage(header,sidebar,body,skin = "purple")