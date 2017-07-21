generador=function(tamanio_muestra, year=1960){
    library("wakefield")
    #setwd("/root/proyecto")
    setwd("C:\\Users\\David\\Documents\\examen\\")
    
    #Generación de sexo
    sexo<-0
    for(i in 1:tamanio_muestra){
        sexo[i]<-sample(1,x=c("Hombre", "Mujer"),prob = c(0.498623389,0.501376611),replace=T)    
    }
    
    #Generación de edad
    edad<-0
    for(i in 1:tamanio_muestra){
        edad[i]=age(1,x=c(sample(18:24,1),sample(15:39,1),
                          sample(40:55,1),sample(56:90,1)),prob=c(.2,.35,.255,.195))  
    }
    
    #Generación de estado civil
    estado_civil<-0
    for(i in 1:tamanio_muestra){
        estado_civil[i] = sample(1, x = c("Casado", "Soltero", "Divorciado", "Viudo", "Separado",
                                          "Pareja de hecho"), prob =c(.23,.27,.11,.09,.15,.15),replace=T )    
    }
    
    #Generación de status socieconómico
    status<-upper(tamanio_muestra, k = 5, prob = c(0.02,0.059,0.205,0.25,0.466))
    
    #Generación de grado de instruccion  
    educacion<-0
    for(i in 1:tamanio_muestra){
        educacion[i]<-sample(1, x = c("Escuela Primaria", "Secundaria incompleta",
                                      "Secundaria completa","Estudios tecnologicos", "Estudios universitarios","Postgrado"), prob = c(0.05,0.1,0.5,0.1,0.2,0.05),replace=T)
    }
    
    #Datos de tabaquismo
    frecuencia_fumar<-sample(0:5,tamanio_muestra,replace=T,prob = c(0.5,0.3,0.1,0.05,0.03,0.02) )
    tiempo_sin_fumar<-sample(0:12,tamanio_muestra,replace=T,prob =c(0.6,0.04,0.04,0.04,0.004,0.1,0.01,0.02,0.03,0.02,0.02,0.02,0.02) )
    
    #Datos de alcoholismo
    alcohol_frecuencia<-sample(tamanio_muestra,x=c("Semanal","Mensual"),prob = c(0.67,0.33), replace = T)
    alcohol_cantidad<-0
    for(i in 1:tamanio_muestra){
        alcohol_cantidad[i]<-sample(1,x=c(sample(1:5,1),sample(6:10,1),sample(11:20,1)),prob = c(.7,.25,.05),replace = T)  
    }
    
    #Datos de la actividad física
    tiempo_actividad_fisica<-0
    for(i in 1:tamanio_muestra){
        tiempo_actividad_fisica[i]<-sample(1,x=c(sample(0:150,1),sample(151:300,1)),prob = c(0.75,0.25),replace = T)  
    }
    
    #Datos sobre presión arterial
    presion_sistolica<-sample(tamanio_muestra,x=70:200,replace = T)
    presion_diastolica<-sample(tamanio_muestra,x=50:120,replace=T)
    
    #Datos sobre el IMC
    imc<-runif(tamanio_muestra,16,40)
    
    #Datos sobre glicemia
    glicemia<-sample(tamanio_muestra,x=80:130,replace = T)
    
    #Datos sobre el perfil lipídico
    colesterol_total<-sample(tamanio_muestra,x=150:300, replace = T)
    trigliceridos<-sample(tamanio_muestra,x=130:220, replace = T)
    colesterol_hdl<-sample(tamanio_muestra,x=37:60, replace = T)
    
    #Año hecho del estudio
    anio_estudio<-0
    for(i in 1:tamanio_muestra){
        anio_estudio=year;
    }
    
    
    datos<-data.frame(sexo,edad,estado_civil,status,educacion,frecuencia_fumar,tiempo_sin_fumar,alcohol_frecuencia,
                      alcohol_cantidad,tiempo_actividad_fisica,presion_sistolica,presion_diastolica, imc,glicemia,
                      colesterol_total, trigliceridos,colesterol_hdl, anio_estudio,  stringsAsFactors = F)
    
    
    nombreColumnas=c("Sexo","Edad","Estado civil","Nivel socieconómico",
                     "Grado de instrucción","Cigarros por día","Tiempo sin fumar",
                     "Frecuencia de alchol","Cantidad de alcohol",
                     "Tiempo actividad física","Presión sistólica",
                     "Presión diastólica","IMC","Glicemia","Colesterol total","Triglicéridos","Colesterol HDL", "Año")
    
    for(i in 1:length(nombreColumnas)){
        colnames(datos)[i]<-nombreColumnas[i]
    }
    
    return (datos)
    
}

generador_estudio=function(n,year_from){
    year_to<-as.numeric(format(as.Date(Sys.Date()),"%Y")) - 1
    unidos<-0
    for(i in year_from:year_to){
        generado<-generador(tamanio_muestra=n,year=i)
        unidos<-rbind(unidos,generado)   
    }
    unidos<-unidos[-c(1),]
    write.csv(x=unidos, file="output/personas.csv", row.names = F)
    
}