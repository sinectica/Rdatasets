
library(shiny)
library(datasets)

# Define UI for dataset
ui <- fluidPage(
    
    # App title
    titlePanel("Built-in R Datasets"),
    
    # Sidebar layout with a input and output definitions
    sidebarLayout(
        
        # Sidebar panel for inputs
        sidebarPanel(
            
            # Input: Selector for choosing dataset
            selectInput(inputId = "datasetId",
                        label = "Choose an R dataset:",
                        choices = ls("package:datasets")),
            
            # Input: Numeric entry for number of obs to be viewed
            numericInput(inputId = "obs",
                         label = "# Observations to view:",
                         value = 5)
        ),
        
        # Main panel for displaying App output
        mainPanel(
           
            #Item and Title of the datasets
            p(h4("Title of the Dataset")),
            textOutput("Title"),
            
            # Output: Verbatim text for data summary
            p(h4("Data summary")),
            verbatimTextOutput("summary"),
            
            # Output: HTML table with requested number of observations
            p(h4("Observations")),
            tableOutput("view"),
            
        )
    )
)
