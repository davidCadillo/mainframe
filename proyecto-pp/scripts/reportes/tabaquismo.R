#!/usr/bin/env Rscript
library("dplyr")
setwd("/root/proyecto/scripts")
nuevos<-read.csv("../inputs/personas.csv")
tabaquismo<-nuevos %>% select(6,18) %>% filter(nuevos$Cigarros.por.dia>=1 & nuevos$Tiempo.sin.fumar <6)
resumen<-aggregate(x=list(Tabaquismo=tabaquismo$Cigarros.por.dia),by=list(Anio=tabaquismo$Año), FUN=mean)
write.csv(resumen, file="../outputs/tabaquismo.csv", row.names=F)
