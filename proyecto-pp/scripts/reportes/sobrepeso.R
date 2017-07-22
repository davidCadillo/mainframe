#!/usr/bin/env Rscript
suppressPackageStartupMessages(library(dplyr, quietly=TRUE))
setwd("/root/proyecto/scripts")
nuevos<-read.csv("../inputs/personas.csv")
sobrepeso<-nuevos %>%select(13,18) %>% filter(between(IMC,25,30)) %>% group_by(Anio) %>% summarise(Cantidad=n(), Media=mean(IMC))
write.csv(sobrepeso, file="../outputs/sobrepeso.csv", row.names=F)
