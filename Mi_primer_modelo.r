#install.packages('caTools')
library(caTools)

df<-read.csv("data_credit.csv",na.strings = c(""," ",NA), sep=",") 
head(df)

summary(df)

round(cor(df), digits=2)

barplot(table(df$customer),
main="Age Count of 10 Students",
xlab="Age",
ylab="Count"
)

sample_split <- sample.split(Y = df$customer, SplitRatio = 0.7)
train_set <- subset(x = df, sample_split == TRUE)
test_set <- subset(x = df, sample_split == FALSE)

X_train=train_set[, 1:15] #Las variables independientes de la data de entrenamineto
y_train=train_set[, 16]# La variable dependiente de la data de entrenamineto

X_test=test_set[, 1:15] #Las variables independientes de la data de testeo
y_test=test_set[, 16]# La variable dependiente de la data de testeo

X_train_scaled = scale(X_train) # Realizar el entrenamiento de la estandarizacion

#Aplicar la estandarizacion a la data de testeo
X_test_scaled = scale(X_test, center=attr(X_train_scaled, "scaled:center"), 
                              scale=attr(X_train_scaled, "scaled:scale"))

#Crear un dataframe con la data estandarizada
train_set2 = cbind(X_train_scaled, y_train)
test_set2 = cbind(X_test_scaled, y_test)
#Cambiar el nombre de las columnas
colnames(train_set2)[colnames(train_set2) == 'y_train'] <- 'customer'
colnames(test_set2)[colnames(test_set2) == 'y_test'] <- 'customer'

#Definimos el dataframe
train_set2 <- as.data.frame(train_set2)
test_set2 <- as.data.frame(test_set2)
#Cambiamos el tipo del target
train_set2$customer = as.factor(train_set2$customer)
test_set2$customer = as.factor(test_set2$customer)

head(train_set2)

#install.packages("rpart.plot")
library(rpart.plot)

#install.packages('e1071', dependencies=TRUE)
library(e1071)

library(tidyverse)


#Definimos y se entrena los modelos
models=list(
        list(naiveBayes(customer ~., data = train_set2),"Naive Bayes"),
        list(rpart(formula = customer ~ ., data = train_set2,method = "class", xval = 10),"Decision Tree")
       )

names_l = c()
acc_train_l = c()
acc_test_l = c()

for (i in 1:length(models)){

    print(models[[i]][[2]])#El titulo del Modelo
    #---
    predicciones <- predict(models[[i]][[1]], train_set2, type = "class")
    acc_train=confusionMatrix(predicciones, train_set2$customer)$overall[1]
    acc_train=str_sub(acc_train, 1, 4)
    print(paste("El Accuracy de Entrenamiento:",acc_train))
    
    #Realizar las predicciones para testeo
    predicciones <- predict(models[[i]][[1]], test_set2, type = "class")
    acc_test=confusionMatrix(predicciones, test_set2$customer)$overall[1]
    acc_test=str_sub(acc_test, 1, 4)
    print(paste("El Accuracy de Testeo:",acc_test))
    names_l <- append(names_l,models[[i]][[2]])
    acc_train_l <- append(acc_train_l,acc_train)
    acc_test_l <- append(acc_test_l,acc_test)
    
    if (models[[i]][[2]]=="Decision Tree"){
        rpart.plot(models[[i]][[1]])
    }

}

data.frame(Nombre = names_l,
                 Acc_train = acc_train_l,
                 Acc_test =acc_test_l
                 )

