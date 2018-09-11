## Script para leitura do SINASC diretamente do site do DATASUS

library(RCurl)

#site do FTP do datasus
url <- 'ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/NOV/DNRES/'

#le o diretorio do ftp
lista <- getURL(url)

# insere quebra de linha
lista <- strsplit(lista,'\n')

#seleciona somente o ACRE
 l2 <- grep ('DNAC',lista[[1]],value = T) ## DN do ACRE

# Seleciona o nome dos Arquivos

 l3 <- substr(l2,40,52)
# OU

 l3 <- gsub('.*(DNAC[1-2][0-9]{3})','\\1',lista[[1]][grepl("DNAC",lista[[1]])])


## caso necessario instale o pacote read.dbc

install.packages('read.dbc')
library(read.dbc)

## cria lista para receber os resultados
   
sinasc <- list()

## faz um loop para os 3 primeiros anos , para todos os anos use length(l3) ao invez de 1:3

for (i in 1:3) {
    loc <- paste0(url,l3[i])
    download.file(loc,"temp.dbc")
    sinasc[[i]] <- read.dbc("temp.dbc",as.is=T)
    file.remove("temp.dbc")
}

## verifica a estrutura do primeiro data.frame da lista

str(sinasc[[1]])


## estrai os anos da lista , poderia fazer anos <- 1996:2000

anos <- substr(l3,5,8) 

## OU

anos <- gsub('.*([0-9]{4})\\.[A-Z,a-z]{3}','\\1',l3)

## nomeia para ficar mais simples lidar com a lista

names(sinasc) <- anos[1:3]

# estatistica de PESO para cada ano. 


lapply(sinasc, function(x) {summary(as.numeric(x$PESO))})


##convertendo para um unico DF

todos <- do.call(rbind,sinasc)

todos$ANO <- substr(todos$DTNASC,5,8)
		
#  numero de nascidos por ano!

table(todos$ANO)
		
	

