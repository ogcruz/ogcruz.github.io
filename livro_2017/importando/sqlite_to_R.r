library(RSQLite)

canal <- dbConnect(RSQLite::SQLite(), "meuBD.sqlite")

dbListTables(canal)

dbWriteTable(canal,"SINASC",todos)

dbListTables(canal)

dbGetQuery(canal, "SELECT ANO,COUNT(*) AS TOTAL FROM SINASC GROUP BY ANO")


q <- "select ANO, 
			SUM(CASE WHEN SEXO = 1 THEN 1 END) as MASCULINO,
			SUM(CASE WHEN SEXO = 2 THEN 1 END) as FEMININO,
			SUM(CASE WHEN SEXO = 1 THEN 1.0 END) / SUM(CASE WHEN SEXO = 2 THEN 1.0 END) as RAZAO
            from SINASC
            group by ANO"

dbGetQuery(canal,q)

q2 <- "select ano, substr(DTNASC,3,2) as mes ,count(*) as casos
from sinasc
group by ano,mes 
order by ano,mes
"

serie <- dbGetQuery(canal,q2)
boxplot(serie$casos ~ serie$mes)
nasc.ts <- ts(serie$casos,start=c(1996,1),freq=12)
plot(nasc.ts)

dbDisconnect(canal)
