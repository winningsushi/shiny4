filedata <- eventReactive(list(input$submit1,input$submit2), {
  print("시작")
  infile <- input$dataset
  if (is.null(infile)) {
    print("파일이 비어있다")
    if(input$stock == ""){
      print("티커가 비어있다")
      
    }
    else{
      print("티커있음 ")
      
      symbols = c(input$stock,
                  input$stock0,
                  input$stock1,
                  input$stock2,
                  input$stock3,
                  input$stock4,
                  input$stock5,
                  input$stock6,
                  input$stock7,
                  input$stock8)
      getSymbols(symbols, src='yahoo')
      prices = do.call(cbind, lapply(symbols, function(x) Cl(get(x)))) %>% setNames(symbols)
      rets = Return.calculate(prices) %>% na.omit()
  
      start_day <- index(rets)[1]
      end_day <- index(rets)[length(index(rets))]
      period <- paste0(start_day,"::", end_day)
      #날짜 옵션을 선택할 경우
      if (input$dateoption2 == "custom"){
        period2 <- paste0(input$startdate2,"::", input$enddate2)
        rets<- rets[period2]
      }
      return(rets)
    }
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

  nullcheck <- is.null(filedata())
  if (nullcheck != T){
    print("데이터 로드 완료")
    rets <- filedata()
  }
  start_day <- index(rets)[1]
  end_day <- index(rets)[length(index(rets))]
  period <- paste0("분석기간: ",start_day," ~ ", end_day)
  nullcheck <- is.null(rets)
  print(period)
  
  if (nullcheck != T){
    return(period)
  }
})
output$period <- renderText(period())
