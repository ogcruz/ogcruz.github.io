# intruções para compilar o bookdown do curso!



1 abrir o **Rstudio** e o projeto do Livro 



2  setar o diretorio de trabalho  para bookdown

```R
setwd('./bookdown/')
```



3 	compilar o livro

```R
setwd('./bookdown/')

bookdown::render_book('ecologico_book.Rmd')
```

4	o resultado vai estar na subdiretorio *docs* poara publicar copiar o conteudo para o diretorio do github.io


4 para extrair o codigo R de dentro do Rmarkdown use:

knitr::purl("bookdown/capitulo8.Rmd")