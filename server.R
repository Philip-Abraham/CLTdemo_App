#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(function(input, output) {
        
        output$plot1 <- renderPlot({
               
                # POPULATION Code
                set.seed(1234)
                X <- rexp(500000,0.2)
              
                par(mfrow=c(2,1))
                par(bg = 'grey')
                hist(X, probability = TRUE,
                     main = "POPULATION - 500,000 Simulated Random Exponential Distribution with a Rate (lambda) of 0.2",
                     col="yellow", xlab='Theoretical Mean = 5 (Green Line) of Random Exponential Distributions with a Rate (lambda) = 0.2', breaks=500, xlim=c(0,30))
                abline(v=5, col="green",lty=2, lwd=5)
                
                
                ################################################################################
                # SAMPLE MEANS Code
                set.seed(112)
                mns=NULL
                N=input$Slider
                n=input$numeric
                for (i in 1 : N) mns = c(mns, mean(rexp(n,0.2)))
                hist(mns, probability = TRUE, 
                     main=paste("A Sampling Distribution (Variance=",round(var(mns),3),") of", N, "Exponential Sample Means from Random Samples (Size",n,") taken from Population",sep=" "), 
                     xlab = paste("Mean (Red Line) = ",round(mean(mns),3),"of Exponential's Sample Means. Green Line indicates Theoretical Mean of Random Exponential Distributions with a lambda = 0.2", sep = " "),font.lab=2, breaks = 50,col ="yellow")
                abline(v=mean(mns), col="red",lty=2, lwd=4)
                abline(v=5, col="green",lty=2, lwd=3)
                lines(density(mns), lwd=3, col="black")
                
               
                
                
        })
        
})