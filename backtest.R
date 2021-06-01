library(quantmod)
library(PerformanceAnalytics)
library(magrittr)

backtest <- reactive({

rets <- filedata()
weight <- input$weight
weight <-unlist(strsplit(weight, split=","))
W<- as.numeric(weight)


portfolio = Return.portfolio(R = rets,
                             weights = W ,
                             rebalance_on = 'years',
                             verbose = TRUE)
chart <- charts.PerformanceSummary(portfolio$returns, main = 'Backtest result')
return<- Return.annualized(portfolio$returns)
std1 <- StdDev.annualized(portfolio$returns)


return(list(
            chart = chart,
            annual_return = return[1],
            annual_std = std1[1]
            # w = w
      ))
})

output$backtestPlot <- renderPlot({
  backtest()$chart
})

output$annual_return <- renderText({
  backtest()$annual_return
})
output$annual_std <- renderText({
  backtest()$annual_std
})

