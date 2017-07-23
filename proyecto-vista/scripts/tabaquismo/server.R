library("dygraphs")
library("datasets")
library("dplyr")
#setwd("/root/proyecto/scripts")
shinyServer(function(input, output) {
    tabaquismo<-read.csv(file="~/../../outputs/tabaquismo.csv")
    output$dygraph <- renderDygraph({
    dygraph(resumen, main = "Consumo diario") %>%
            dyRangeSelector()
            
    })
    
})


