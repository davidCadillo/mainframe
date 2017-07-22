#!/usr/bin/env Rscript
suppressPackageStartupMessages(library(dplyr, quietly=TRUE))
setwd("/root/proyecto/scripts")
nuevos<-read.csv("../inputs/personas.csv")
secundaria_incompleta<-nuevos %>%select(5,18)  %>% filter(Grado.de.instruccion == "Secundaria incompleta")%>% group_by(Anio) %>% summarise(Secundaria.Incompleta=n())
secundaria_completa<-nuevos %>%select(5,18)  %>% filter(Grado.de.instruccion == "Secundaria completa")%>% group_by(Anio) %>% summarise(Secundaria.Completa=n())
instituto<-nuevos %>%select(5,18)  %>% filter(Grado.de.instruccion == "Estudios tecnologicos")%>% group_by(Anio) %>% summarise(Instituto=n())
universidad<-nuevos %>%select(5,18)  %>% filter(Grado.de.instruccion == "Estudios universitarios")%>% group_by(Anio) %>% summarise(Universidad=n())
postgrado<-nuevos %>%select(5,18)  %>% filter(Grado.de.instruccion == "Postgrado")%>% group_by(Anio) %>% summarise(Postgrado=n())
escolaridad<-secundaria_incompleta %>% inner_join(secundaria_completa, by="Anio") %>% inner_join(instituto, by="Anio") %>% inner_join(universidad, by="Anio") %>% inner_join(postgrado, by="Anio") 

write.csv(escolaridad, file="../outputs/escolaridad.csv", row.names=F)
