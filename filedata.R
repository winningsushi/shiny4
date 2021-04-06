filedata <- reactive({
  infile <- input$dataset
  if (is.null(infile)) {
    # User has not uploaded a file yet
    return(NULL)
  }
  rets <- read.zoo(infile$datapath, header = TRUE, sep = ',',fileEncoding="UTF-8-BOM")
  rets <- na.omit(as.xts(rets))
  start_day <- index(rets)[1]
  end_day <- index(rets)[length(index(rets))]
  period <- paste0(start_day,"::", end_day)
  #날짜 옵션을 선택할 경우 
  if (input$dateoption == "custom"){
  period2 <- paste0(input$startdate,"::", input$enddate)
  rets<- rets[period2]
  }
  
  return(rets)
})

period <- reactive({
  rets <- filedata()
  start_day <- index(rets)[1]
  end_day <- index(rets)[length(index(rets))]
  period <- paste0("분석기간: ",start_day," ~ ", end_day)
  nullcheck <- is.null(rets)
  print(nullcheck)
  
  if (nullcheck != T){
    return(period)
  }
})
output$period <- renderText(period())
