# desafio leo - tcl

set.seed(124)

# To generate a sample of size 100 from a standard normal distribution (with mean 0 and standard deviation 1) we use the rnorm function
norm <- rnorm(100)

norm[1:10]

mean(norm)
sd(norm)

# normal distribution with a different value for the mean and standard deviation

set.seed(124)
norm <- rnorm(100, 2, 5)
norm[1:10]

mean(norm)
sd(norm)

# other distr functions
#  runif, rpois, rmvnorm, rnbinom, rbinom, rbeta, rchisq, rexp, rgamma, rlogis, rstab, rt, rgeom, rhyper, rwilcox, rweibull

# Generating a random sample from a Poisson distribution with lambda=3
set.seed(124)
pois <- rpois(100, lambda = 3)
pois[1:10]

mean(pois)

var(pois)

set.seed(124)
binom <- rbinom(100, 20, 0.2)
binom[1:10]

dnorm(-1.96)

x <- seq(0, 4, 0.1)

plot(x, dnorm(x, 2, 0.5), type = "l")

#desafio Leo - inicio do Cod

# Preparando o Ambiente
rm(list=ls())
#install.packages("XML")
#install.packages("ggplot2")
library(XML)
library(ggplot2)

# Obtendo os dados online
url <- "http://www.pnud.org.br/atlas/ranking/ranking-idhm-municipios-2010.aspx"
pnud <- readHTMLTable(url, encoding = "utf-8")[[1]]

# Organizando a base de dados
names(pnud) <- c("ranking","municipio","idh","idh.renda","idh.longevidade","idh.educacao")
for (var in 3:6){
  pnud[,var] <- as.numeric(substr(as.character(pnud[,var]),3,5))/1000
}
pnud$ranking <- as.character(pnud$ranking)
pnud$ranking <- as.numeric(substr(pnud$ranking,1,nchar(pnud$ranking)-2))
pnud$municipio <- as.character(pnud$municipio)
pnud$uf <- substr(pnud$municipio, nchar(pnud$municipio)-2, nchar(pnud$municipio)-1)
pnud$municipio <- substr(pnud$municipio, 1, nchar(pnud$municipio)-5)
pnud <- pnud[,c(1, 2, 7, 3:6)]
head(pnud)

# Distribuicao
ggplot(pnud, aes(x=idh)) +
  geom_density(alpha=.3) +
  ggtitle("IDH dos Municípios Brasileiros (PNUD 2010)")

# Distribuicao comparadao SP e MG
ggplot(pnud[pnud$uf %in% c("BA","MG"), ], aes(x=idh, fill = as.factor(uf))) +
  geom_density(alpha=.3) +
  ggtitle("IDH dos Municípios Brasileiros (PNUD 2010) - BA e MG")

# sample n=36
trs <- sample(pnud$idh, 36)
mean(trs)
sd(trs)
# sample n=100
cem <- sample(pnud$idh, 100)
mean(cem)
sd(cem)

# sample n=1600
mils <- sample(pnud$idh, 1600)
mean(mils)
sd(mils)
i <- 1
dados <- data.frame()
for (i in 1:99999){
  trs <- sample(pnud$idh, 36)
  media <- mean(trs)
  dep <- sd(trs)
  
  dados <- rbind(dados, c(media,dep))
}
plot(dados$X0.652361111111111)

mean(dados$X0.652361111111111)
sd(dados$X0.652361111111111)

plot(dados$X0.652361111111111, dnorm(dados$X0.652361111111111, 0.6590886, 0.01194676), type = "l")

ggplot(dnorm(dados$X0.652361111111111, 0.6590886, 0.01194676))

ggplot(pnud, aes(x=idh)) +
  geom_density(alpha=.3)

pnud$ranking <- as.character(pnud$ranking)
names(dadoscem) <- c("medias", "sd")

a <- ggplot(dados, aes(x=medias))+
  geom_density(alpha=.3)

dadoscem <- data.frame()
for (i in 1:99999){
  cem <- sample(pnud$idh, 100)
  media <- mean(cem)
  dep <- sd(cem)
  
  dadoscem <- rbind(dadoscem, c(media,dep))
}

plot(dadoscem$medias, dnorm(dadoscem$medias, mean(dadoscem$medias), sd(dadoscem$medias)), type = "l")

ggplot(dadoscem, aes(x=medias))+
  geom_density(alpha=.3)

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}