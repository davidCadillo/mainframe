#!/usr/bin/env Rscript
suppressPackageStartupMessages(library(dplyr, quietly=TRUE))
setwd("/root/proyecto/scripts")
nuevos<-read.csv("../inputs/personas.csv")
tabaquismo<-nuevos %>% select(6,7,18) %>% filter(nuevos$Cigarros.por.dia>=1 & nuevos$Tiempo.sin.fumar <6)%>% group_by(Anio) %>% summarise(Tabaco = mean(Cigarros.por.dia),Promedio=mean(Cigarros.por.dia),Desviacion=sd(Cigarros.por.dia))
write.csv(tabaquismo, file="../outputs/tabaquismo.csv", row.names=F)
