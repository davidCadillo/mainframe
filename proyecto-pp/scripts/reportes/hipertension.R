#!/usr/bin/env Rscript
suppressPackageStartupMessages(library(dplyr, quietly=TRUE))
setwd("/root/proyecto/scripts")
nuevos<-read.csv("../inputs/personas.csv")
hipertension<-nuevos %>% select(11,12,18) %>% filter(Presion.sistolica >=140 & Presion.diastolica >=90) %>% group_by(Anio) %>% summarise(Cantidad=n(),Sistolica=mean(Presion.sistolica), Diastolica=mean(Presion.diastolica))
write.csv(hipertension,file="../outputs/hipertension.csv",row.names=F)
