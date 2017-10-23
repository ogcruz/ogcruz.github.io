![](../imagens/barra_procc.png)

##Espressões  Regulares 

Uma [Expressão Regular](https://pt.wikipedia.org/wiki/Express%C3%A3o_regular),  conhecidas por [REGEX](https://pt.wikipedia.org/wiki/Express%C3%A3o_regular), é um método formal de se especificar um padrão de texto.

É uma composição de símbolos, caracteres com funções especiais, chamados “metacaracteres” que, agrupados formam uma sequencia, ou expressão regular 

Uma expressão regular é testada em textos e retorna sucesso caso este texto obedeça exatamente a todas as suas condições.
Neste caso dizemos que o texto “casa” com (**match**) a expressão regular.

As REGEXs servem para se dizer algo abrangente de forma mais rigorosa.
Definido o padrão, tem-se uma lista (finita ou não) de possibilidades de casamento.

Exemplo:
[rgp]ato
pode casar com
“rato”, “gato” e “pato” Mas  não "mato"

Utilidade das Expressões Regulares e a busca de padrões em textos

* Data e Horário
* Número IP,Sites
* Endereço de e-mail
* URL
* Número de telefone, CPF, cartão de crédito

Vários Linguagens de Programação, editores de texto têm suporte às REGEXs.

Para exemplificar o uso das REGEX em **R** , usaremos as  funções **grep**, **gsub** 

```R
cores <- colors()
grep("blue",cores)
```
Retorna o índice de todos os elementos do vetor cores que possuem   "blue"

#### Alguns Metacaracteres

* Circunflexo ^ - Simboliza o início de uma linha 

   ```R
   grep("^blue",cores) 
   ```

   ​
   ​	
   Retorna o índice de todos os elementos do vetor cores começados por "blue"

* Cifrão $ -  Simboliza o fim de uma linha 

   ```R
   grep("yellow$",cores,value=T)
   ```

   ​

Retorna o índice de todos os elementos do vetor cores terminados por "yellow"

* Listas [] - Simboliza conjunto de caracteres numa determinada posição.


```R
	grep("^[aeiou]",cores,value=T)
```
cores começadas por vogais

```R
	grep("[0-9]$",cores,value=T)
```
cores terminadas por numeros

* Ponto . - Simboliza “qualquer” caracteres numa determinada posição


```R
	grep("grey..",cores,value=T)
```
 cor cinza seguida por dois  caracteres qualquer

```R
	grep("^....$",cores,value=T)
```
cores com apenas 4 caracteres

* Chaves {} - Simboliza a quantidade de repetições do caractere anterior

   		 grep("e{2}",cores,value=T)
  padrão onde cores tem dois "e" seguidos


   		 grep("[0-9]{3,5}",cores ,value=T)
onde cores tem de 3 a 5 numeros

* Curinga * - Simboliza “qualquer coisa”, inclusive nada.

    ```R
    grep("^[s].*[0-9]$",cores,value=T)
    ```
    cores começadas por "s" e terminadas por numero! 

* Operador logico **OU** (OR) '|'

Para fazer um OU lógico, onde buscamos uma coisa OU outra, deve-se usar o | e delimitar as opções entre parênteses:
​       
```R
    grep("^[w]|^[y]",cores,value=T)
```

Não deve conter espaços! Nesse exemplo é o mesmo que 

```R
    "^[wy]"
```

 * Operador logico **NÃO** (NOT) [^] 

Pesquisa para retornar as cores que não começam por vogais

```R
    grep ("^[bcdfghjklmnpqrstvwxyz]",cores)
```

Ou usar negativa (NOT) usando “^”

```R
    grep ("^[^aeiou]", cores,value=T)
```

  repare que o não é o ^ que está dentro das chaves!  

 * Intervalo de Lista [-] - Busca por faixa de caracteres ou números

    grep ("[0-9]{3,}", cores,value=T)


Busca por números de três dígitos ou mais

```R
grep("[r-z]$",cores,value=T) 
```

Busca por cores terminadas com letras entre r e z
​        
 A função **gsub** faz substituições em strings usando REGEX
​        
```R
teste <- "   caracteres em branco, no incio e final  "
gsub("^\\s+|\\s+$", "", teste)
```


Existem varias funções que podem usar REGEX, o R utiliza dialeto de REGEX aprenda um pouco mais nessa [Vignette ](https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html)

