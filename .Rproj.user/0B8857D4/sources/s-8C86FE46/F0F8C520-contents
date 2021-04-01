
source('read_pak.R', local = TRUE)

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
