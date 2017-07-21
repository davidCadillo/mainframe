#!/usr/bin/env Rscript

args <- commandArgs(TRUE)
muestra<-as.numeric(args[1])
anio<-as.numeric(args[2])

source("/root/proyecto/scripts/generador.R")

generador_estudio(n=muestra,year_from=anio)
