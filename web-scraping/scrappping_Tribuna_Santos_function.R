# rm(list=ls())
library(XML)
tribuna_busca <- function(busca){
  urlbase <- "http://www.atribuna.com.br/resultado-de-busca/buscapor/BUSCA/pagina_busca/"
  urlbase <- gsub("BUSCA", busca, urlbase)
  
  pag_zero <- paste0(urlbase, 0)
  pagina <- xmlRoot(htmlParse(readLines(pag_zero)))
  link_ultima <- xpathSApply(pagina, "//li[@class = 'tx-pagebrowse-last']/a", xmlGetAttr, name = "href")
  ultima = as.numeric(substr(link_ultima, nchar(link_ultima) - 2, nchar(link_ultima) - 1))
  
  linksNoticias <- c()
  for (i in 0:ultima){
    print(i)
    url <- paste0(urlbase, i)
    pagina <- xmlRoot(htmlParse(readLines(url)))
    link <- xpathSApply(pagina, "//a[@class = 'search-results--item-link']", xmlGetAttr, name = "href")
    linksNoticias <- c(linksNoticias, link)  
  }
  
  dados <- data.frame()
  links.problema = c()
  j = 1
  for (link in linksNoticias){
    print(paste("Noticia de #", j); j = j + 1
    erro <- try(pagina <- xmlRoot(htmlParse(readLines(link))), silent=TRUE)
    if ('try-error' %in% class(erro)){
      links.problema = c(links.problema, link)
    }
    else {
      titulo <- xpathSApply(pagina, "//h1[@class = 'single-header-title']", xmlValue)
      dataehora <- xpathSApply(pagina, "//div[@class = 'single-header-date']", xmlValue)
      texto <- xpathSApply(pagina, "//div[@itemprop = 'articleBody']", xmlValue)
      dados <- rbind(dados, data.frame(titulo, dataehora, texto))
    }
  }
  return(dados)
}

busca <- c("vereador", "Prefeito Ze")

dados <- data.frame()
for (b in busca){
  dados <- rbind(dados, tribuna_busca(b))
}
