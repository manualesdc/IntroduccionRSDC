library(png)
library(grid)

print("Hola Mundo")

# Funcion para calcular CV (Coeficiente de Variabilidad)
CV <- function(x){
  (sd(x)/mean(x))*100
}

datos = c(22,25,28)
CV(datos)

library(tm)

.libPaths()

getwd()

setwd("C:/Users/SOCIAL DATA/Dropbox/Programa de Especialización en R - 7ma Edición/1. Nivel I")

1*3
2*3
3*3
4*3
5*3
6*3
7*3
8*3
9*3
10*3

for (i in 1:10)
    print(i*3)

for(i in 1:10)
    {
    expression(i)
}

i=1; while(i<=5) {print(i^3); i=i+1}

while(condición)
    {
    comandos
}

{if(condición)
    comandos1
 else
    comandos2
 }

deltam = function(x)
{
    if (x==0) deltam =0
    else
        if(x>0) deltam =1
        else
            if(x<0) deltam =-1
    return(deltam)
}

deltam(-5)

deltam(0)

deltam(5)

deltam(3)

modulo= function(x)
    {
    ifelse(x>=0,x,-x)
}

modulo(5)

modulo(3)

{
switch(expresión, valor1=acción1, valor2, acción2,..., valork=acciónk) 
}

centro= function(x,tipo)
    {
    switch(tipo, media=mean(x), mediana=median(x))
}

alumnos=c(25,35,28,32,24,23,22,40)

centro(alumnos,"media")

centro(alumnos,"mediana")

for(i in -5:5)
    {
#     if(i==0) next;
    print(i^2)
}

for(i in -5:5)
    {
    if(i==0) break;
    print(i^2)
}

repeat{print(i^2);
      i=i+1;
      if(i==10) break
}
