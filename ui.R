library(shiny)
library(shinydashboard)

shinyUI(dashboardPage(
  dashboardHeader(title = "Time Series"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data Upload", tabName = "tab_1", icon = icon("dashboard")),
      menuItem("Decomposition", tabName = "tab_2", icon = icon("dashboard"))
      
    )
  ),
  
  dashboardBody(tabItems(
    tabItem(tabName = "tab_1",
            fluidRow(
              box(title = "Data upload", status = "primary", solidHeader = T, width = 12,
                  fileInput(inputId = 'data_upload',
                            label = "Please upload .csv files",
                            multiple = F,
                            accept = ".csv",
                  )
                  
              ),
              
            ),
            
            fluidRow(
              box(title = "View data", status = "primary", solidHeader = T, width = 12,
                  dataTableOutput(outputId = "table_1")
                  
              )
            )
    ),
    
    tabItem(tabName = "tab_2",
            fluidRow(
              box(title = "Control", status = "primary", solidHeader = T, width = 12,
                  sliderInput(inputId = "slider_1",
                              label = "Please choose period of data: 0 for auto",
                              value = 0,
                              min = 0,
                              max = 10,
                              step = 1
                  ),
                  selectInput(inputId = "select_1",
                              label = "Please select the columns of data",
                              choices = c("Item A", "Item B", "Item C")
                              )
              )
            ),
            
            fluidRow(
              box(title = "Decompostion", status = "primary", solidHeader = T, width = 12,
                  plotOutput(outputId = "plot_1")
              )
            ),
    )
    )
    
            
  ))
)
