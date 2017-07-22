#!/usr/bin/env Rscript
library("dplyr")
setwd("/root/proyecto/scripts")
nuevos<-read.csv("../inputs/personas.csv")
alcoholismo<-nuevos %>% select(8,9,18) %>% filter(Frecuencia.de.alcohol == "Semanal" & Cantidad.de.alcohol >=10)%>% group_by(Año) %>% summarise(Alcohol=mean(Cantidad.de.alcohol))
write.csv(alcoholismo, file="../outputs/alcoholismo.csv", row.names=F)
