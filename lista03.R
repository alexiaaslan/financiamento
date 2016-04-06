dados2 <- read.csv2("C:/Users/8516201.FFLCH/Dropbox/Note-Linux2/2016.1/3. Metodos 3/Aula 5/Lista 03/bla.csv")

dados2 <- read.csv2("C:/Users/8516201.FFLCH/Dropbox/Note-Linux2/2016.1/3. Metodos 3/Aula 5/Lista 03/bla.csv")

p <- table(dados2$posco)

f <- table(dados2$fed)


p/nrow(dados2)

f/nrow(dados2)

hist(dados$posco)


hist(dados$fed, breaks = -1:2, labels = T)

barplot(p/nrow(dados2))

barplot(p, main="Frequência da variável 'posco'", xlab="Variável 'posco'", ylab="Frequência Absoluta")

barplot(f/nrow(dados2))

barplot(f, main="Frequência da variável 'fed'", xlab="Variável 'fed'", ylab="Frequência Absoluta")

#ex 3

d <- table(dados2$apoio)

write.table(d, file = "C:/Users/8516201.FFLCH/Dropbox/Note-Linux2/2016.1/3. Metodos 3/Aula 5/tab_freq.txt", quote = T, sep = ";", col.names = T)

#media

mean(dados2$apoio)
median(dados2$apoio)
var(dados2$apoio)

sd(dados2$apoio)

#

lines(dados2$apoio)

hist(dados2$apoio, labels = T, main="Frequência da variável 'apoio'", xlab="Variável 'apoio'", ylab="Frequência")

table(dados2$apoio)

stem(dados2$apoio)

#https://www.mail-archive.com/r-help@r-project.org/msg78739.html

set.seed(54321)
N <- 1000
x <- rnorm(N)
H <- hist(x,breaks=50)
dx <- (H$breaks[2]-H$breaks[1])
m  <- mean(x)
s  <- sd(x)
x0 <- H$breaks
x1 <- c(x0[1]-dx/2,x0+dx/2)
y0 <- H$counts
lines(x1,N*dnorm((x1 - m)/s)*dx)
dnorm((x - m)/s)*dx

a <- table(dados2$apoio)

d <- a/nrow(dados2)

write.table(d, file = "C:/Users/8516201.FFLCH/Dropbox/Note-Linux2/2016.1/3. Metodos 3/Aula 5/tab_freq_apoio.txt", quote = T, sep = ";", col.names = T)

boxplot(dados2$apoio, plot = F)

quantile(dados2$apoio)
