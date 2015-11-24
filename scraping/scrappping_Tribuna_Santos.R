library(XML)

busca <- "vereador"
ultima <- 2
urlbase <- "http://www.atribuna.com.br/resultado-de-busca/buscapor/BUSCA/pagina_busca/"
urlbase <- gsub("BUSCA", busca, urlbase)

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
  print(j); j = j + 1
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
