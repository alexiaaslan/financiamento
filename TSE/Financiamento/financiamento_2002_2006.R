# Financiamento 2002 e 2006

# especificar o local do arquivo
# deixei manual para mudar pois cada ano era um problema diferente, incluindo nomeclatura

nome.arquivo <- "H:\\Financiamento\\2002\\TSE\\Comite\\Receita\\ReceitaComite.csv"

# ler arquivo
# especifiquei o colClasses de acordo com cada ano, receita e depesa de cada entidade 
# o CPF/CNPJ tem umas letras perdidas e ler como numero estava cortando os zeros e as celulas com letras

dados <- read.table(nome.arquivo, sep=";", quote="\"",
                    fill = TRUE, fileEncoding="latin1", 
                    skip = 1, stringsAsFactors=FALSE,
                    colClasses=c(V7="character"))

dados <- read.table(nome.arquivo, sep=";", quote="\"",
                    fill = TRUE, fileEncoding="latin1", header = T,
                    stringsAsFactors=FALSE, 
                    colClasses=c(SEQ_CAND="character", CNPJ_CAND="character", NUMERO_CPF_CGC_FORNECEDOR="character"))

# para comites e as aspas malditas, os arquivos ja devem ser lidos de forma diferente

dados <- read.table(nome.arquivo, sep=";", quote="",
                    fill = TRUE, fileEncoding="latin1", 
                    skip = 1, stringsAsFactors=FALSE,
                    colClasses=c(V5="character"))

# nomear colunas
# checar documento nomes_colunas.r (esta no git tambem)

names(dados) <- c("SIGLA_UF",
                         "SIGLA_PART",
                         "TIPO_COMITE",
                         "DATA_RECEITA",
                         "NUM_CPF_CGC_DOADOR",
                         "UNIDADE_FEDERACAO_DOADOR",
                         "NOME_DOADOR",
                         "VALOR_RECEITA",
                         "DESC_TIPO_RECURSO")



# somente para comite 2006 e Candidato 2002: tirar as malditas aspas que ficaram
dados[] <- lapply(dados, function(x) gsub("\"", "", x))

# salvar geral (o arquivo grande com todo mundo, sem divisao)
write.table(dados, "H:\\Financiamento\\2002\\Comites\\2002_Receitas_Comite_Brasil.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)

# somente candidatos: subset por cargo
dados.cargoP <- subset (dados, DESC_CARGO=="Presidente")

dados.cargoG <- subset (dados, DESC_CARGO=="Governador")

dados.cargoS <- subset (dados, DESC_CARGO=="Senador")

dados.cargoE <- subset (dados, DESC_CARGO=="Deputado Estadual")

dados.cargoD <- subset (dados, DESC_CARGO=="Deputado Distrital")

dados.cargoF <- subset (dados, DESC_CARGO=="Deputado Federal")

# somente candidatos: salvar em arquivo txt para cada cargo
write.table(dados.cargoD, "H:\\Financiamento\\2002\\Candidatos\\Receitas\\2002_Receitas_Cand_DepDis.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

write.table(dados.cargoE, "H:\\Financiamento\\2002\\Candidatos\\Receitas\\2002_Receitas_Cand_DepEst.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

write.table(dados.cargoF, "H:\\Financiamento\\2002\\Candidatos\\Receitas\\2002_Receitas_Cand_DepFed.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

write.table(dados.cargoG, "H:\\Financiamento\\2002\\Candidatos\\Receitas\\2002_Receitas_Cand_Gov.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

write.table(dados.cargoP, "H:\\Financiamento\\2002\\Candidatos\\Receitas\\2002_Receitas_Cand_Pre.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

write.table(dados.cargoS, "H:\\Financiamento\\2002\\Candidatos\\Receitas\\2002_Receitas_Cand_Sen.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")