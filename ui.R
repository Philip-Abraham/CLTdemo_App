#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
        includeCSS("www/bootstrap.min.css"),
        titlePanel("Visualization of the Central Limit Theorem"),
        sidebarLayout(
                sidebarPanel(
                       
                        tags$h3("Central Limit Theorem Visualization App", style="color:orange;", align="center"),
                        
                       
                        tags$h5("Developed by: Philip Abraham (rainier96@earthlink.net), March 26, 2017", align="center", style="color:green;"),
                        tags$a(href="http://www.khanacademy.org/math/statistics-probability/sampling-distributions-library/sample-means/v/central-limit-theorem", "For CLT Explanation Click Here!", style="color:lightblue;", align="center"),
                        br(), br(),
                        tags$a(href="http://rpubs.com/rainier96/262756", "For App Info Click Here!", style="color:lightblue;", align="center"),
                        br(), br(),
                        
                        
                        p("This app demonstates the fundamental idea of the Central Limit Theorem with an exponential population distribution."),
                          
                        
                        tags$h3("User Inputs", style="color:red;"),
                        strong(em("The user inputs the following:")), 
                        
                        p("A). Sample Size in each random exponential Sample - 50, 100 or 150, and"),
                        p("B). Number of Sample Means to be Generated in the Distribution:  Minimum = 100, maximum = 5000."),
                        
                        numericInput("numeric", tags$h5(" A). Select your Random Exponential's Sample Size: 50, 100 or 150",style="color:red;"), 
                                     value = 50, min = 50, max = 150, step = 50),
                        sliderInput("Slider", tags$h5("B). Select the Number of Sample Means of Random Exponentials to be Generated in the Distribution: 100 to 5000",style="color:red;"), 100, 5000, 100, step=100),
                        
                        strong(em("The app, based on the inputs selected, outputs histograms of the:")),
                        p("1). Exponential population distribution with a rate (lambda) of 0.2, and"),
                        p("2). Sampling distribution of the exponential's sample means, with the associated value for the mean of the sampling means."),
                        strong(em("As the input values change, the app also displays on the sampling distribution, the calculated MEAN and VARIANCE."))
                        
                        
                        
                ),
                
                mainPanel(
                        
                        img(src = "cltimage1.jpg", height = 250, width = 300), br(),
                        h3("Histograms of the Exponential Distribution and the Sampling Means Distribution"),
                        plotOutput("plot1")
                        
                )
        )
))

