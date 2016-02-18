# mesmo espirito do PrimeiroCodigo_Empilhar
# mas esse foca na separacao por criterio
# no fundao nao tem nenhuma grande diferenca, sao so dois arquivos diferentes mesmo

#USADO PARA RECEITAS 2014

# define diretorio
diretorio <- setwd("Y:\\ELEITORAL\\Financiamento de Campanha\\Repositorio TSE - Originais\\Auxiliares\\Processados no R")

# lista arquivos do diretorio
list.files(diretorio)

# define qual o arquivo a ser usado e da o nome de arquivo
arquivo <- ("Y:\\ELEITORAL\\Financiamento de Campanha\\Repositorio TSE - Originais\\Auxiliares\\Processados no R\\receitas_cand_2014_brasil_cpf.txt")

# cria o output em forma de dataframe
dados.output<-data.frame()

# Abre o arquivo de dados com o nome 'dados'
# Opcoes: separador = ; , quote = " e enconding = latin1
dados <- read.table(arquivo, sep=";", quote="\"",
                    fill = TRUE, fileEncoding="latin1", header = T,
                    colClasses=c("CPF_CAND"="character"))


# esses nomes nao estao padronizados, sao os do proprio TSE
# dar nomes as colunas - Depesa 2014
names(dados) <- c("C?d. Elei??o",
                   "Desc. Elei??o",
                   "Data e hora",
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


# dar nomes as colunas - Receita 2014
names(dados) <- c("C?d. Elei??o",
                  "Desc. Elei??o",
                  "Data e hora",
                  "CNPJ Prestador Conta",
                  "Sequencial Candidato",
                  "UF",
                  "Sigla  Partido",
                  "Numero candidato",
                  "Cargo",
                  "Nome candidato",
                  "CPF do candidato",
                  "Numero Recibo Eleitoral",
                  "Numero do documento",
                  "CPF/CNPJ do doador",
                  "Nome do doador",
                  "Nome do doador (Receita Federal)",
                  "Sigla UE doador",
                  "N?mero partido doador",
                  "N?mero candidato doador",
                  "Cod setor econ?mico do doador",
                  "Setor econ?mico do doador",
                  "Data da receita","Valor receita",
                  "Tipo receita","Fonte recurso",
                  "Especie recurso","Descricao da receita",
                  "CPF/CNPJ do doador origin?rio",
                  "Nome do doador origin?rio",
                  "Tipo doador origin?rio",
                  "Setor econ?mico do doador origin?rio",
                  "Nome do doador origin?rio (Receita Federal)")


# escolher linhas especificas (por uma caracteristica em comum)
dados.output <- subset (dados, DESC_CARGO=="Deputado Federal")

# salvar em arquivo txt
write.table(dados.output, "Y:\\ELEITORAL\\Financiamento de Campanha\\Repositorio TSE - Originais\\Auxiliares\\Processados no R\\receita_2014_brasil_fed_cpf.txt",
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")
