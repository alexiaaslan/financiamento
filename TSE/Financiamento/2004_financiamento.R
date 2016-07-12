# Financiamento Municipal

diretorio.base <- "C:\\Users\\8516201\\Downloads\\prestacao_contas_"

#2004

########## Despesa Candidato ##########
diretorio <- paste0(diretorio.base, "2004\\Candidato\\Despesa")
setwd(diretorio)

nome.arquivo <- "DespesaCandidato.csv"

dados <- read.table(nome.arquivo, sep=";", quote="",
                    fill = TRUE, fileEncoding="latin1", 
                    skip = 1, stringsAsFactors=FALSE)

# tirar as malditas aspas que ficaram
dados[] <- lapply(dados, function(x) gsub("\"", "", x))

# substituir virgula por ponto

dados[] <- lapply(dados, function(x) gsub(",", ".", x))
sum(dados$VALOR_DESPESA)


# dar nomes as colunas
# despesa candidato
names(dados) <- c("NOME_CAND",
                  "DESC_CARGO",
                  "COD_CARGO",
                  "NUM_CAND",
                  "SIGLA_UF",
                  "NOME_UF",
                  "COD_MUN",
                  "NUM_PART",
                  "SIGLA_PART",
                  "VALOR_DESPESA",
                  "DATA_DESPESA",
                  "TIPO_DESPESA",
                  "COD_TIPO_DESPESA",
                  "TIPO_RECURSO",
                  "COD_TIPO_RECURSO",
                  "NUM_DOC",
                  "TIPO_DOC",
                  "COD_TIPO_DOC",
                  "NOME_FORN",
                  "CPF_CNPJ_FORN",
                  "MUN_FORN",
                  "STATUS_RECEITA_FEDERAL")

# transformar tipo variavel

dados.fin <- transform(dados, 
                       COD_CARGO = as.numeric(COD_CARGO), 
                       NUM_CAND = as.numeric(NUM_CAND), 
                       COD_MUN = as.numeric(COD_MUN), 
                       NUM_PART = as.numeric(NUM_PART),
                       VALOR_DESPESA = as.numeric(VALOR_DESPESA),
                       COD_TIPO_DESPESA = as.numeric(COD_TIPO_DESPESA),
                       COD_TIPO_RECURSO = as.numeric(COD_TIPO_RECURSO),
                       CPF_CNPJ_FORN = as.numeric(CPF_CNPJ_FORN))

# checar pra ver o que deu ruim
sum(is.na(dados$COD_CARGO))
sum(is.na(dados.fin$COD_CARGO))

sum(is.na(dados$NUM_CAND))
sum(is.na(dados.fin$NUM_CAND))

sum(is.na(dados$COD_MUN))
sum(is.na(dados.fin$COD_MUN))

sum(is.na(dados$NUM_PART))
sum(is.na(dados.fin$NUM_PART))

#deu ruim: VALOR_DESPESA
sum(dados$VALOR_DESPESA == "")

sum(is.na(dados$VALOR_DESPESA))
sum(is.na(dados.fin$VALOR_DESPESA))

sum(is.na(dados$COD_TIPO_DESPESA))
sum(is.na(dados.fin$COD_TIPO_DESPESA))

#so parece que deu ruim mas nao deu: COD_TIPO_RECURSO
sum(is.na(dados$COD_TIPO_RECURSO))
sum(is.na(dados.fin$COD_TIPO_RECURSO))

#deu ruim: CPF_CNPJ_FORN
sum(is.na(dados$CPF_CNPJ_FORN))
sum(is.na(dados.fin$CPF_CNPJ_FORN))

sum(dados$VALOR_DESPESA == "")


#separar cargo

#salvar por cargo e geral


########## Receita Candidato ##########
diretorio <- paste0(diretorio.base, "2004\\Candidato\\Receita")
setwd(diretorio)

nome.arquivo <- "ReceitaCandidato.csv"

dados <- read.table(nome.arquivo, sep=";", quote="",
                    fill = TRUE, fileEncoding="latin1", 
                    skip = 1, stringsAsFactors=FALSE)

# somente para comite 2006 e Candidato 2002: tirar as malditas aspas que ficaram
dados[] <- lapply(dados, function(x) gsub("\"", "", x))

#Colunas
# receita candidato
names(dados) <- c("NOME_CAND",
                  "DESC_CARGO",
                  "COD_CARGO",
                  "NUM_CAND",
                  "SIGLA_UF",
                  "NOME_UF",
                  "COD_MUN",
                  "NUM_PART",
                  "SIGLA_PART",
                  "VALOR_RECEITA",
                  "DATA_RECEITA",
                  "TIPO_RECEITA",
                  "COD_TIPO_RECEITA",
                  "TIPO_RECURSO",
                  "COD_TIPO_RECURSO",
                  "NOME_DOADOR",
                  "NUM_CPF_CGC_DOADOR",
                  "STATUS_RECEITA_FEDERAL")

# converter tipo de variável das colunas
# http://stackoverflow.com/questions/2288485/how-to-convert-a-data-frame-column-to-numeric-type

dados.fin <- transform(dados, 
                       COD_CARGO = as.numeric(COD_CARGO), 
                       NUM_CAND = as.numeric(NUM_CAND), 
                       COD_MUN = as.numeric(COD_MUN), 
                       NUM_PART = as.numeric(NUM_PART),
                       VALOR_RECEITA = as.numeric(VALOR_RECEITA),
                       NUM_PART = as.numeric(NUM_PART))



# salvar geral (o arquivo grande com todo mundo, sem divisao)
write.csv2(dados, "C:\\Users\\8516201\\Downloads\\Financiamento\\2004_Receitas_Candidato_Brasil.csv", row.names=FALSE)

#salvar cargos

dados.cargoPr <- subset (dados, V2=="Prefeito")

write.csv2(dados.cargoPr, "C:\\Users\\8516201\\Downloads\\Financiamento\\2004_Receitas_Candidato_Prefeito.csv", row.names=FALSE)


########## Despesa Comite ##########
diretorio <- paste0(diretorio.base, "2004\\Comitê\\Despesa")
setwd(diretorio)

nome.arquivo <- "DespesaComitê.csv"

########## Receita Comite ##########
diretorio <- paste0(diretorio.base, "2004\\Comitê\\Receita")
setwd(diretorio)
getwd()
nome.arquivo <- "ReceitaComitê.csv"

dados <- read.table(nome.arquivo, sep=";", quote="",
                    fill = TRUE, fileEncoding="latin1", 
                    skip = 1, stringsAsFactors=FALSE)

# tirar as malditas aspas que ficaram
dados[] <- lapply(dados, function(x) gsub("\"", "", x))

#Colunas
# receita comite
names(dados) <- c("TIPO_COMITE",
                  "NUM_PART",
                  "SIGLA_PART",
                  "SIGLA_UF",
                  "NOME_UF",
                  "COD_MUN",
                  "VALOR_RECEITA",
                  "DATA_RECEITA",
                  "TIPO_RECEITA",
                  "COD_TIPO_RECEITA",
                  "TIPO_RECURSO",
                  "COD_TIPO_RECURSO",
                  "NOME_DOADOR",
                  "NUM_CPF_CGC_DOADOR",
                  "STATUS_RECEITA_FEDERAL")


# salvar geral (o arquivo grande com todo mundo, sem divisao)
write.table(dados, "C:\\Users\\8516201\\Downloads\\Financiamento\\2004_Receitas_Comite_Brasil.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
write.csv2(dados, "C:\\Users\\8516201\\Downloads\\Financiamento\\2004_Receitas_Comite_Brasil.csv", row.names=FALSE)

#salvar cargos

dados.cargoPr <- subset (dados, TIPO_COMITE=="Presidente")


#2008




#2012



