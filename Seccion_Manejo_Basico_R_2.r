objeto <- 15 

x = objeto

# a:b
S1=3:7
S1

# seq(a,b,by=s)
S2=seq(1, #valor de partida
       11, #valor final
       by=3) #orden de la secuencia
S2

S3=seq(1,9,2)
S3

x <- 4
x 

x <- c(18,10,13) 
x

length(x)

mode(x)

y <- "abc"

length(y)

mode(y)

z <- c("abc", 1115)

z

z = c(1115,"abc")
z

length(z)

mode(z)

# Compilar la cadena
u <- paste("Social", "Data", "Consulting")
u

m <- rbind(c(1, 4), c(2, 2))
m

j <- list(name= "Joe", salary= 55000, union=T)

j$name

j$salary

j$union

d <- data.frame (list(kids=c("Juan", "Jose", "María"), ages=c(16, 19, 22)))

d$ages
head(d)

x <- c(0,5,7,9,1,2,8) 
x

mean(x)

mean(X) #error

y <- c(4,2,0,9,5,3,10)
y

sort(y)

sort(y, decreasing=TRUE)

?mean

help(mean)

help.search("mean")

example(mean)

cigarros <- c(15,19,14,12,15,18,19,14,0,16,15,1,1,11,19,11)
cigarros

id <- (1:16)
id

sexo <- c(0,1,1,0,0,1,0,1,1,1,0,0,1,1,0,0)
sexo

nombres <- c ("Ana","Antonio","David","Filipa", "Joana","Joao","Maria","Paulo","Pedro","Ricardo","Rita","Rute","Rui","Bruno","Albertina","Vanesa")
nombres

BaseCig <- data.frame( id, nombres, sexo, cigarros)

head(BaseCig)

class(BaseCig)

BaseCig
