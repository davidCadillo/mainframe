#!/bin/bash

#Llama al script start pasando la cantidad y el año desde donde empezara a generar datos
Rscript /root/proyecto/scripts/start.R $1 $2

scp /root/proyecto/output/* root@10.0.0.5:/root/proyecto/inputs

rm -rf /root/proyecto/output/*
