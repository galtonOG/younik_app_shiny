#
#

library(tidyverse)
library(class)
library(shiny)

shinyServer(function(input, output) {
  
  range01 <- function(x, ...){(x - min(x, ...)) / (max(x, ...) - min(x, ...))}
  qPers <- read.csv("data/qPers.csv")

  Results <- reactive(data.frame(input$Nem, input$Eletkor, input$Lakohely, input$vegzettseg, input$jovedelem,
                                 input$v1, input$v2, input$v3, input$v9, input$v10, input$v15, input$v16,
                                 input$v18, input$v20, input$v21, input$v22, input$v26, input$v27, input$v29,
                                 input$v30, input$v31, input$v33, input$v37, 1))  
  
  #To append the row and display in the table when the submit button is clicked
  observeEvent(input$Action,{
    #Append the row in the dataframe
    
    dfResults <- Results()
    colnames(dfResults) <- colnames(qPers)

    dfResults <- apply(dfResults, 2, function(x)(as.integer(x)))
    
    qPers <<- rbind(qPers,dfResults) 
    qPers <- apply(qPers, 2, function(x)(as.numeric(x)))
    qPers <- as.tibble(qPers)
  prefPresent <- as.factor(qPers$valasztott)
  qPersScaled <- apply(qPers[,-24], 2, range01)
  qPersScaled <- as.tibble(qPersScaled)
  qPersScaled$valasztott <- prefPresent
  #testing <- qPersScaled[nrow(qPersScaled),-24]
  #megnezzuk miket ir be a tablazatba
#write.csv(testing, "C:/Users/Nandi/Desktop/testing.csv")

  prefPresent <- unlist(c(qPersScaled[-nrow(qPersScaled), 24]))

  write.table(prefPresent, "data/prefpresent.csv", append = T, sep = ",", dec = ".")


  knnPred <- knn(qPersScaled[-nrow(qPersScaled),-24],
                 testing,
                 k=floor(sqrt(nrow(qPersScaled)-1)),
                 cl = prefPresent)

write.table(knnPred, "data/knn.csv", append = T, sep = ",", dec = ".")
          
output$image <- renderImage({
  list(src = paste0("pics/",
                    as.character(knnPred), ".jpg"),
       contentType = "image/png")
          }, deleteFile = F)

      })

  })
