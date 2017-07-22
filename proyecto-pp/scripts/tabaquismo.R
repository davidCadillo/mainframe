#!/usr/bin/env Rscript
library("wakefield")
library("dplyr")
nuevos<-read.csv("/root/proyecto/inputs/personas.csv")
tabaquismo<-nuevos %>% select(6,18) %>% filter(nuevos$Cigarros.por.dia>=1 & nuevos$Tiempo.sin.fumar <6)
resumen<-aggregate(x=list(Tabaquismo=tabaquismo$Cigarros.por.dia),by=list(Anio=tabaquismo$Anio), FUN=mean)
