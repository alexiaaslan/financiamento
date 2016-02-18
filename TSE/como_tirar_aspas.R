# Substituir Aspas por Nada

dados[] <- lapply(dados, function(x) gsub("\"", "", x))

# onde dados ? o data frame com as aspas
# dados[] garante que fique no formato data frame

# fonte: http://stackoverflow.com/questions/25386679/use-gsub-in-r-to-remove-and-replace-with-nothing