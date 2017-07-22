#!/usr/bin/env Rscript
suppressPackageStartupMessages(library(dplyr, quietly=TRUE))
setwd("/root/proyecto/scripts")
nuevos<-read.csv("../inputs/personas.csv")
obesidad<-nuevos %>%select(13,18) %>% filter(IMC >=30) %>% group_by(Anio) %>% summarise(Cantidad=n(), Media=mean(IMC))
write.csv(obesidad, file="../outputs/obesidad.csv", row.names=F)
