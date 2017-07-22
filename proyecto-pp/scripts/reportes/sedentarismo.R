#!/usr/bin/env Rscript
suppressPackageStartupMessages(library(dplyr, quietly=TRUE))
setwd("/root/proyecto/scripts")
nuevos<-read.csv("../inputs/personas.csv")
sedentarismo<-nuevos %>%select(10,18) %>% filter(Tiempo.actividad.fisica<=150) %>% group_by(Anio) %>% summarise(Cantidad=n(), Media=mean(Tiempo.actividad.fisica))
write.csv(sedentarismo, file="../outputs/sedentarismo.csv", row.names=F)
