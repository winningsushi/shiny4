mainPanel(
  tabsetPanel(
    tabPanel("RawData", br(),
             textOutput("period"),
             dataTableOutput("table")
             ),
    tabPanel("누적 수익률",br(),
             plotOutput("perfPlot")
             ),
    tabPanel("공분산",br(),
             dataTableOutput("covs")
    ),
    tabPanel("종목별 위험 수익",br(),
             plotOutput("yearly_stat")
    ),
    tabPanel("효율적 프론티어", br(),
             tableOutput("target_minvol"),
             tableOutput("target_maxsharpe"),
             plotOutput("p3"),
             plotOutput("p2")
    ),
    tabPanel("포트폴리오 백테스트", br(),
             textInput("weight", "비중", placeholder ="0.5,0.5"),
             textOutput("annual_return"),
             plotOutput("backtestPlot")
             
             )
    

  )
)
