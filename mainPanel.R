mainPanel(
  tabsetPanel(
    tabPanel("대체투자 자산정보", br(),
             includeHTML('investuniver.html')
             # includeMarkdown('investuniver.rmd')
    ),
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
    tabPanel("상관관계 히트맵",br(),
             plotOutput("corr_plot")
             
    ),
    tabPanel("상관관계 테이블 ",br(),
             dataTableOutput("corr")
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
             textOutput("annual_std"),
             
             plotOutput("backtestPlot")
             
             ),
    tabPanel("Fama-French 3 factor 분석", br(),
             textInput("Ticker", "Ticker", placeholder ="AAPL"),
             tableOutput("ff_table")
             
             
    )

  )
)
