# FAMA FRENCH
library(quantmod)
library(PerformanceAnalytics)
library(magrittr)
library(zoo)

library(tidyverse)
library(broom)
library(tidyquant)
library(timetk)

ff <- reactive({

  symbols <- input$Ticker
  print(symbols)
  symbols <- 'AAPL'
  getSymbols(symbols, src='yahoo')
  prices = do.call(cbind, lapply(symbols, function(x) Cl(get(x)))) %>% setNames('Asset')
  rets = Return.calculate(prices) %>% na.omit()
  
  
  ffdata <- read.zoo("ff.csv", header = TRUE, sep = ',',  encoding="UTF-8")
  ff <- as.xts(ffdata)
  
  merged <- merge(rets, ff) %>% na.omit() 
  
  result = lm((Asset-RF) ~ Mkt.RF + SMB + HML, data = merged)  
  rr = broom::tidy(result)

  plot(result, which = 1)
  return(list(
    ff_table = rr
  ))
})

output$ff_table = renderTable(
  ff()$ff_table, digits =8
)

