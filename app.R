source('read_pak.R', local = TRUE)

library(shiny)
library(DT)
library(quadprog)
library(highcharter)
library(quantmod)
library(PerformanceAnalytics)
library(shinythemes)
library(knitr)
library(kableExtra)
library(magrittr)
library(shinyWidgets)
library(lubridate)
library(stringr)
library(ggplot2)
library(tidyr)
library(plotly)
library(DT)
library(tibble)
library(kableExtra)
library(shinyWidgets)
library(highcharter)


ui <- navbarPage(
    "Rportfolio Efficient Frontier",
    theme = shinythemes::shinytheme("cosmo"),
    sidebarLayout(
        source('sidebar.R',encoding="utf-8", local = TRUE)$value,
        source('mainPanel.R',encoding="utf-8", local = TRUE)$value
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    

    source('filedata.R',encoding="utf-8", local = TRUE)$value #리액티브 객체
    source('read_data.R',encoding="utf-8", local = TRUE)$value
    source('cum_return.R',encoding="utf-8", local = TRUE)$value
    source('frontier.R',encoding="utf-8", local = TRUE)$value #리액티브 객체
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
