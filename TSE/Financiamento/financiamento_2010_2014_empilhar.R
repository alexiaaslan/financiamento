# Codigo Para Empilhar
# Os anos que vieram separados por estado entao para cada receita/despesa de candidato/partido/comite tem varios arquivos dentro do diretorio
# Casos consistem de 2010 e 2014

# ADAPTACAO
# lembrar de mudar os diretorios e nomes finais para nao misturar anos e entidades

# start code

# define diretorio
# aqui eh diretorio e nao arquivo pois tem um monte de arquivos por pasta
diretorio <- setwd("H:\\Financiamento\\2010\\TSE\\Partidos\\Receitas")

# lista arquivos do diretorio
# por algum motivo, no windows nem sempre ele muda de diretorio quando eu mando executar a linha de codigo acima, entao isso esta aqui para ver se o R mudou mesmo de diretorio ou nao
list.files(diretorio)

getwd()

# na verdade nao eh uma pasta temporaria criada para isso mesmo, eh a mesma pasta do diretorio, mas tava reaproveitando codigo e ai ficou assim mesmo
pasta.temporaria <- file.path(getwd())

# define lista arquivos como a lista dos arquivos no diretorio
lista.arquivos <- list.files(pasta.temporaria)

# cria o output em forma de dataframe
dados.output<-data.frame()


# Loop - para cada i de 1 at? o tamanho da lista (ou seja a quantidade de arquivos na pasta)
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
      
      # Abre o arquivo de dados com o nome 'dados'
      # Opcoes: separador = ; , quote = " e enconding = latin1
      # LEMBRAR DE TROCAR O VALOR DO V PARA A COLUNA QUE CONTEM O CPF
      # CPF/CNPJ como numerico cortam os zeros
      
      # colunas que devem ser colocadas para serem lidas como character em cada ano
      # 2014: 
      # Despesa candidato: V4="character", V5="character", V11="character"
      # Receita candidato: V4="character", V5="character", V11="character", V14="character", V28="character"
      # Despesa comite: V4="character", V5="character", V11="character"
      # Receita comite: V4="character", V5="character", V11="character", V25="character"
      # Despesa partido: V4="character", V5="character", V11="character"
      # Receita partido: V4="character", V5="character", V11="character", V25="character"
      # 2010
      # Despesa candidato: V2="character", V8="character", V12="character"
      # Receita candidato: V2="character", V8="character", V12="character"
      # Despesa comite: V7="character"
      # Receita comite: V7="character"
      # Despesa partido: V7="character"
      # Receita partido: V7="character"
      # 2006 (em 2006 o problema comeca nos comites e suas aspas, recomendo olhar o outro codigo)
      # Despesa candidato: V1="character", V7="character", V17="character"
      # Receita candidato: V2="character", V8="character", V12="character"
      # Despesa comite: V7="character"
      # Receita comite: V5="character", V13="character"
      
      
      dados <- read.table(nome.arquivo, sep=";", quote="\"",
                          fill = TRUE, fileEncoding="latin1", 
                          skip = 1, stringsAsFactors=FALSE,
                          colClasses=c(V7="character"))
      
      # Imprime no console o nome do arquivo
      print(paste("Arquivo", lista.arquivos[i], "aberto com sucesso!"))
      
      # Acrescente os dados ao data frame dados.output (empilhar) 
      dados.output <- rbind(dados.output, dados)        
      
      # Imprime no console o nome do arquivo
      print(paste("Arquivo", lista.arquivos[i], "empilhado!!"))
    }
  } 
}



# dar nomes as colunas - Depesa Candidatos 2014
names(dados.output) <- c("COD_ELEICAO",
                         "DESC_ELEICAO",
                         "DATA_HORA",
                         "CNPJ_PRESTADOR",
                         "SEQ_CAND",
                         "SIGLA_UF",
                         "SIGLA_PART",
                         "NUM_CAND",
                         "DESC_CARGO",
                         "NOME_CAND",
                         "CPF_CAND",
                         "TIPO_DOC",
                         "NUM_DOC",
                         "CPF_CNPJ_FORNECEDOR",
                         "NOME_FORNECEDOR",
                         "NOME_FORNECEDOR_RF",
                         "COD_SET_ECON_FORNECEDOR",
                         "SETOR_ECON_FORNECEDOR",
                         "DATA_DESPESA",
                         "VALOR_DESPESA",
                         "TIPO_DESP",
                         "DESC_DESP")

# dar nomes as colunas - Receita Candidatos 2014
names(dados.output) <- c("COD_ELEICAO",
                         "DESC_ELEICAO",
                         "DATA_HORA",
                         "CNPJ_PRESTADOR",
                         "SEQ_CAND",
                         "SIGLA_UF",
                         "SIGLA_PART",
                         "NUM_CAND",
                         "DESC_CARGO",
                         "NOME_CAND",
                         "CPF_CAND",
                         "NUM_RECIBO_ELEITORAL",
                         "NUM_DOC",
                         "CPF_CNPF_DOADOR",
                         "NOME_DOADOR",
                         "NOME_DOADOR_RF",
                         "SIGLA_UE_DOADOR",
                         "NUM_PARTIDO_DOADOR",
                         "NUM_CAND_DOADOR",
                         "COD_SETOR_ECON_DOADOR",
                         "SETOR_ECON_DOADOR",
                         "DATA_RECEITA",
                         "VALOR_RECEITA",
                         "TIPO_RECEITA",
                         "FONTE_RECURSO",
                         "ESPECIE_RECURSO",
                         "DESC_RECEITA",
                         "CPF_CNPJ_DOADOR_ORIG",
                         "NOME_DOADOR_ORIG",
                         "TIPO_DOADOR_ORIG",
                         "SETOR_ECON_DOADOR_ORIG",
                         "NOME_DOADOR_ORIG_RF")


# dar nomes as colunas - Depesa Comite 2014
names(dados.output) <- c("COD_ELEICAO",
                         "DESC_ELEICAO",
                         "DATA_HORA",
                         "CNPJ_PRESTADOR",
                         "SEQ_CAND",
                         "SIGLA_UF",
                         "TIPO_COMITE",
                         "SIGLA_PART",
                         "TIPO_DOC",
                         "NUM_DOC",
                         "CPF_CNPJ_FORNECEDOR",
                         "NOME_FORNECEDOR",
                         "NOME_FORNECEDOR_RF",
                         "COD_SET_ECON_FORNECEDOR",
                         "SETOR_ECON_FORNECEDOR",
                         "DATA_DESPESA",
                         "VALOR_DESPESA",
                         "TIPO_DESP",
                         "DESC_DESP")

# dar nomes as colunas - Receita Comite 2014
names(dados.output) <- c("COD_ELEICAO",
                         "DESC_ELEICAO",
                         "DATA_HORA",
                         "CNPJ_PRESTADOR",
                         "SEQ_CAND",
                         "SIGLA_UF",
                         "TIPO_COMITE",
                         "SIGLA_PART",
                         "TIPO_DOC",
                         "NUM_DOC",
                         "CPF_CNPF_DOADOR",
                         "NOME_DOADOR",
                         "NOME_DOADOR_RF",
                         "SIGLA_UE_DOADOR",
                         "NUM_PARTIDO_DOADOR",
                         "NUM_CAND_DOADOR",
                         "COD_SETOR_ECON_DOADOR",
                         "SETOR_ECON_DOADOR",
                         "DATA_RECEITA",
                         "VALOR_RECEITA",
                         "TIPO_RECEITA",
                         "FONTE_RECURSO",
                         "ESPECIE_RECURSO",
                         "DESC_RECEITA",
                         "CPF_CNPJ_DOADOR_ORIG",
                         "NOME_DOADOR_ORIG",
                         "TIPO_DOADOR_ORIG",
                         "SETOR_ECON_DOADOR_ORIG",
                         "NOME_DOADOR_ORIG_RF")

# Despesas Partidos 2014
names(dados.output) <- c("COD_ELEICAO",
                         "DESC_ELEICAO",
                         "DATA_HORA",
                         "CNPJ_PRESTADOR",
                         "SEQ_DIRETORIO",
                         "SIGLA_UF",
                         "TIPO_DIRETORIO",
                         "SIGLA_PART",
                         "TIPO_DOC",
                         "NUM_DOC",
                         "CPF_CNPJ_FORNECEDOR",
                         "NOME_FORNECEDOR",
                         "NOME_FORNECEDOR_RF",
                         "COD_SET_ECON_FORNECEDOR",
                         "SETOR_ECON_FORNECEDOR",
                         "DATA_DESPESA",
                         "VALOR_DESPESA",
                         "TIPO_DESP",
                         "DESC_DESP")

# Receitas Partidos 2014
names(dados.output) <- c("COD_ELEICAO",
                         "DESC_ELEICAO",
                         "DATA_HORA",
                         "CNPJ_PRESTADOR",
                         "SEQ_DIRETORIO",
                         "SIGLA_UF",
                         "TIPO_DIRETORIO",
                         "SIGLA_PART",
                         "TIPO_DOC",
                         "NUM_DOC",
                         "CPF_CNPF_DOADOR",
                         "NOME_DOADOR",
                         "NOME_DOADOR_RF",
                         "SIGLA_UE_DOADOR",
                         "NUM_PARTIDO_DOADOR",
                         "NUM_CAND_DOADOR",
                         "COD_SETOR_ECON_DOADOR",
                         "SETOR_ECON_DOADOR",
                         "DATA_RECEITA",
                         "VALOR_RECEITA",
                         "TIPO_RECEITA",
                         "FONTE_RECURSO",
                         "ESPECIE_RECURSO",
                         "DESC_RECEITA",
                         "CPF_CNPJ_DOADOR_ORIG",
                         "NOME_DOADOR_ORIG",
                         "TIPO_DOADOR_ORIG",
                         "SETOR_ECON_DOADOR_ORIG",
                         "NOME_DOADOR_ORIG_RF")


# salvar em arquivo txt (o geral)
# especifiquei um endereco inteiro para salvar pois nao uso o mesmo lugar para ler e salvar os finais
write.table(dados.output, "H:\\Financiamento\\2010\\Partidos\\2010_Receitas_Partidos_Brasil.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)

# salvar em csv (caso necessario)
write.csv2(dados.output, "H:\\Financiamento\\2014\\Candidatos\\Receitas\\2014_Receitas_Cand_Brasil_2.csv")

# Separar por Cargo

# escolher linhas especificas (por uma caracteristica em comum)
dados.cargoP <- subset (dados.output, DESC_CARGO=="Presidente")

dados.cargoG <- subset (dados.output, DESC_CARGO=="Governador")

dados.cargoS <- subset (dados.output, DESC_CARGO=="Senador")

dados.cargoE <- subset (dados.output, DESC_CARGO=="Deputado Estadual")

dados.cargoD <- subset (dados.output, DESC_CARGO=="Deputado Distrital")

dados.cargoF <- subset (dados.output, DESC_CARGO=="Deputado Federal")

# salvar em arquivo txt por cargo
write.table(dados.cargoD, "H:\\Financiamento\\2010\\Candidatos\\Receitas\\2010_Receitas_Cand_DepDis.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

write.table(dados.cargoE, "H:\\Financiamento\\2010\\Candidatos\\Receitas\\2010_Receitas_Cand_DepEst.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

write.table(dados.cargoF, "H:\\Financiamento\\2010\\Candidatos\\Receitas\\2010_Receitas_Cand_DepFed.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

write.table(dados.cargoG, "H:\\Financiamento\\2010\\Candidatos\\Receitas\\2010_Receitas_Cand_Gov.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

write.table(dados.cargoP, "H:\\Financiamento\\2010\\Candidatos\\Receitas\\2010_Receitas_Cand_Pre.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

write.table(dados.cargoS, "H:\\Financiamento\\2010\\Candidatos\\Receitas\\2010_Receitas_Cand_Sen.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")

