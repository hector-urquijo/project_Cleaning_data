  
#Descargar el archivo ziP
 download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./data/datos.zip")
 #descomprimir el archivo zip en la carpeta archivosinsumos
 unzip(zipfile = "./data/datos.zip", exdir = "./data/archivosinsumos")

 
 #Cargar Librerias
 library(dplyr)
 library(plyr)
 library(car)
 library(data.table)
 library(reshape2)
 
 
 # cargar etiquetas de actividad
 activity_labels <- read.table("./data/archivosinsumos/activity_labels.txt")[,2]
 
 
  # cargar nombres de las columnas de datos
 features <- read.table("./data/archivosinsumos/features.txt")[,2]

 
 #cargar y procesar los datos de X_test e y_test.
 test <- read.table("./data/archivosinsumos/test/X_test.txt", header = FALSE) # Leer el archivo X_test.txt
 y_test <- read.table("./data/archivosinsumos/test/y_test.txt") # Leer el archivo y_test.txt
 subject_test <- read.table("./data/archivosinsumos/test/subject_test.txt") # Leer el archivo y_test.txt
 names(test) = features #poner nombres de columnas al archivo test.txt

 
 # medidas de la media y la desviación estándar de cada variable de datos prueba.
 mean_test <- matrix(data = NA, nrow = 1,  ncol = ncol(test))  ## Calculate the mean for test.  ,
 for(i in 1:ncol(test)){
     mean_test[1,i]<-mean(test[,i])	
 }
 
  
 sd_test <- matrix(data = NA, nrow = 1, ncol = ncol(test))   ## Calculate the standard deviation for test. 
 for(i in 1:ncol(test)){
     sd_test[1,i]<- sd(test[,i])	
 }

 
 # Cargar y procesar datos de X_train e y_train
 training <- read.table("./data/archivosinsumos/train/X_train.txt", header = FALSE) # Leer el archivo training.txt
 y_train <- read.table("./data/archivosinsumos/train/y_train.txt")
 subject_train <- read.table("./data/archivosinsumos/train/subject_train.txt")
 names(training) = features #poner nombres de columnas al archivo training.txt
 
  
 # medidas de la media y la desviación estándar de cada variable de datos entrenamiento
  mean_train <-sapply(training, mean)  #Calcular la media para datos entrenamiento
  sd_train <-sapply(training, sd)      #calcular la desviacion estandar para datos entrenamiento
 
 
  # Combinar datos de prueba y entrenamiento
 intersect(names(test), names(training)) #verificar nombres de columnas iguales en los dos archivos
 data = merge(test, training) #fusionar data.frame test y training
 
 
 # medidas de la media y la desviación estándar de cada variable de datos de prueba + entrenamiento.
 mean_data <- matrix(data = NA, nrow = 1,  ncol = ncol(test))  ## Calculate the mean for each measurement.  ,
 for(i in 1:ncol(test)){
   mean_data[1,i]<-mean(test[,i])	
 }
 
 sd_data<-matrix(data = NA, nrow = 1, ncol = ncol(test))   ## Calculate the standard deviation for each measurement. 
  for(i in 1:ncol(test)){
   sd_data[1,i]<-sd(test[,i])	
 }
 
 
 #Cargar etiquetas de actividad prueba
 y_test[,2] = activity_labels[y_test[,1]]    #adicionar etiquetAS DE PRUEBA(ACTIVIDAD) a CONJUNTO DE PRUEBA
 names(y_test)= c("Activity_ID" , "Activity_Label") #asignar nombres a columnas
 names(subject_test) = "subject"
 
 
 # Cargar datos de actividad entrenamiento
 y_train [, 2] = activity_labels [y_train [, 1]] #adicionar etiquetAS DE entrenamiento a CONJUNTO DE entrenamiento
 names(y_train) = c ("Activity_ID", "Activity_Label") #asignar nombres a columnas
 names(subject_train) = "subject"

 
 #vincular datos
 test_data <-cbind(test , y_test, subject_test)   #Unir Y_test, test y subject_test
 train_data <-cbind(training , y_train, subject_train) #Unir Y_train, training y subject_train
 
 
 #union de datos prueba y entrenamiento
 data_dw <- rbind(test_data, train_data)
 
 
 #datos ordenados e independientes,  con promedio de cada variable para cada actividad
 tidy_data<-aggregate(data_dw, by=list(data_dw[,563],data_dw[,564]),FUN=mean) ## Calculate the mean of each variable for each activity and each subject. 
 write.table(tidy_data,file="tidy_data.txt",row.name=FALSE)  ## Create a txt file contains the mean of each variable for each activity and each subject.
 


 
 
 
 
 