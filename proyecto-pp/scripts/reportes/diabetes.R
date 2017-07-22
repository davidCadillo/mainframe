#!/usr/bin/env Rscript
suppressPackageStartupMessages(library(dplyr, quietly=TRUE))
setwd("/root/proyecto/scripts")
nuevos<-read.csv("../inputs/personas.csv")
diabetes<-nuevos %>% select(14,18) %>% filter(Glicemia>=125) %>% group_by(Anio) %>% summarise(Personas=n(), Promedio=mean(Glicemia), Desviacion=sd(Glicemia))
write.csv(diabetes, file="../outputs/diabetes.csv", row.names=F)
