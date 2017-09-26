diretorio <- setwd("/home/alexia/Downloads/VOTACAO_CANDIDATO_UF_1945/")
lista.arquivos <- list.files(diretorio)

dados.output<-data.frame()

for (i in 1:length(lista.arquivos)){
  
  # Gerar o caminho e nome do arquivo combinando pasta e o arquivo i
  nome.arquivo <- file.path(diretorio, lista.arquivos[i])
  
  # Extrai a extensao do arquivo (ultimos 3 caracteres do nome)
  extensao.arquivo <- substr(nome.arquivo, (nchar(nome.arquivo)-2), nchar(nome.arquivo))
  
  # Se extensao do arquivo eh igual a txt, seguir
  if (extensao.arquivo=="txt"){
    
    # Obtem as 10 primeiras linhas do arquivo (se houver)
    linhas.arquivo <- length(readLines(nome.arquivo, n=10))
    
    # Se o numero de linhas for maior que 9, seguir
    if (linhas.arquivo>9){
      
      # Imprime no console o nome do arquivo
      print(paste("Arquivo", lista.arquivos[i], "aberto com sucesso!"))
      
      # Abre o arquivo de dados com o nome 'dados'
      # Opcoes: separador = ; , quote = " e enconding = latin1
      dados <- read.table(nome.arquivo, sep=";", quote="\"",
                          fill = TRUE, fileEncoding="latin1")
      
      # Acrescente os dados ao data frame dados.output (empilhar) 
      dados.output <- rbind(dados.output, dados)        
    }
  } 
}

#definir header

#corrigir nomes


#escrever arquivo final
write.table(dados.output, "Y:\\ELEITORAL\\Financiamento de Campanha\\Repositorio TSE - Originais\\2014\\prestacao_final_2014\\Candidatos\\Receita\\receita_2014_brasil.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = F)