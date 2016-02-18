# CRIADO PARA RECEITAS 2014
# basicamente um copia, cola, ajeita do codigo get_financiamento do Leo com as primeiras tentativas de ajustar para o que eu queria que o codigo realmente fizesse

# define diretorio
setwd("Y:\\ELEITORAL\\Financiamento de Campanha\\Repositorio TSE - Originais\\2014\\prestacao_final_2014\\Candidatos\\Receita")
# lista arquivos do diretorio
list.files("Y:\\ELEITORAL\\Financiamento de Campanha\\Repositorio TSE - Originais\\2014\\prestacao_final_2014\\Candidatos\\Receita")

getwd()

# define lista arquivos como a lista dos arquivos no diretorio
lista.arquivos <- list.files("Y:\\ELEITORAL\\Financiamento de Campanha\\Repositorio TSE - Originais\\2014\\prestacao_final_2014\\Candidatos\\Receita")

# cria o output em forma de dataframe
dados.output<-data.frame()

pasta.temporaria <- file.path(getwd())

#parte Leo do codigo
# Loop - para cada i de 1 at? o tamanho da lista
for (i in 1:length(lista.arquivos)){
  
  # Gerar o caminho e nome do arquivo combinando pasta e o arquivo i
  nome.arquivo <- file.path(pasta.temporaria, lista.arquivos[i])
  
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
# fim da parte Leo

# dar nomes as colunas
# esses nomes nao estao padronizados, sao os do proprio TSE

names(dados.output) <- c("C?d. Elei??o","Desc. Elei??o","Data e hora","CNPJ Prestador Conta","Sequencial Candidato","UF","Sigla  Partido","Numero candidato","Cargo","Nome candidato","CPF do candidato","Numero Recibo Eleitoral","Numero do documento","CPF/CNPJ do doador","Nome do doador","Nome do doador (Receita Federal)","Sigla UE doador","N?mero partido doador","N?mero candidato doador","Cod setor econ?mico do doador","Setor econ?mico do doador","Data da receita","Valor receita","Tipo receita","Fonte recurso","Especie recurso","Descricao da receita","CPF/CNPJ do doador origin?rio","Nome do doador origin?rio","Tipo doador origin?rio","Setor econ?mico do doador origin?rio","Nome do doador origin?rio (Receita Federal)")

# excluir linhas de header (quando sao linhas especificas)
#dados.output <- dados.output[-c(1, 5095, 8601), ]

# excluir linhas de header (quando tem uma caracteristica em comum)
ind <- which(with( dados.output, UF=="UF" ))
ind
dados.output <- dados.output[ -ind, ]

# salvar em arquivo txt
write.table(dados.output, "Y:\\ELEITORAL\\Financiamento de Campanha\\Repositorio TSE - Originais\\2014\\prestacao_final_2014\\Candidatos\\Receita\\receita_2014_brasil.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = F)