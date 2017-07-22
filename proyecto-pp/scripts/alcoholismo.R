#!/usr/bin/env Rscript
library("dplyr")
nuevos<-read.csv("../inputs/personas.csv")
alcoholismo<-nuevos %>% select(9,18) %>% filter(nuevos$Frecuencia.de.alcohol == "Semanal" & nuevos$Cantidad.de.alcohol >=10)
resumen<-aggregate(x=list(Alcohol=alcoholismo$Cantidad.de.alcohol),by=list(Anio=alcoholismo$Año), FUN=mean)
write.csv(resumen, file="../outputs/alcoholismo.csv", row.names=F)
