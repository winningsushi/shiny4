pkg = c('shiny', 'broom', 'zoo', 'DT', 'quadprog','tidyverse','tidyquant', 'highcharter', 'quantmod', 'PerformanceAnalytics',
        'shinythemes', 'knitr', 'kableExtra', 'magrittr', 'shinyWidgets', 'timetk',
        'lubridate', 'stringr','ggplot2', 'dplyr', 'tidyr','corrplot', 'plotly','DT', 'tibble', "kableExtra", "shinyWidgets" ,"highcharter")

new.pkg = pkg[!(pkg %in% installed.packages()[, "Package"])]
if (length(new.pkg))
  install.packages(new.pkg, dependencies = TRUE)
sapply(pkg, require, character.only = TRUE)


