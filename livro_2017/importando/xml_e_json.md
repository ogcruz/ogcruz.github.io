
![](../imagens/barra_procc.png)
## XML 

XML, do inglês eXtensible Markup Language, é um formato que permite  documentos com dados organizados hierarquicamente em formato  textos, pode conter banco de dados ou até mesmo  desenhos vetoriais. A linguagem XML é classificada como extensível porque permite definir os elementos de marcação (TAGS).

Os Elementos XML são extensíveis e têm relacionamentos.

Os Elementos XML têm regras simples para nomes.

um exemplo simples! 

```xml
<bilhete>
<data>16/10/2017</data>
<para>Alunos Curso DataScience</para>
<de>Oswaldo</de>
<titulo>Lembrete</titulo>
<corpo>Não se esqueçam de estudar e praticar o R!</corpo>
</bilhete>
```




Aqui um outro exemplo um pouco mais complexo! o cabeçalho define a versão de XML e o tipo de caractere usado!



```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<Laudo>
<Paciente matricula="123">
<Nome> João da Silva </Nome>
<Sexo> Masculino </Sexo>
<Idade>62</Idade>
</Paciente>
<Conclusoes>
<LesaoArterial>
<Grau> 40% </Grau>
<Localiza> 1/3 proximal </Localiza>
<Arteria> 2a. Marginal </Arteria>
</LesaoArterial>
</Conclusoes>
</Laudo>
```

Os elementos XML podem ter atributos na tag de abertura, veja o Elemento Paciente define um atributo matrícula.

Os atributos são usados para prover informação adicional sobre os elementos. 

e quando temos mais de 1 registro?


```xml
<mensagens>
<bilhete id=001>
	<data>16/10/2017</data>
	<de>Oswaldo</de>
	<para>Alunos Curso DataScience</para>
	<titulo>Lembrete</titulo>
	<corpo>Não se esqueçam de estudar e praticar o R!</corpo>
	</bilhete>
<bilhete id=002>
	<data>16/10/2017</data>
	<de>Alunos Curso DataScience</de>
	<para>Oswaldo</para>
	<titulo>Lembrete</titulo>
	<corpo>Professor nos vamos estudar e praticar o R!</corpo>
	</bilhete>
</mensagens>
```


## JSON

JSON (JavaScript Object Notation - Notação de Objetos JavaScript) é uma formatação leve de troca de dados. Para seres humanos, é fácil de ler e escrever. Para máquinas, é fácil de interpretar e gerar. Está baseado em um subconjunto da linguagem de programação JavaScript,  JSON é em formato texto e completamente independente de linguagem, pois usa convenções que são familiares às linguagens C e familiares,. Estas propriedades fazem com que JSON seja um formato ideal de troca de dados.

```json
{ "nome":"João da Silva", "idade":31, "cidade":"Rio de Janeiro" };
```



 um exemlo um pouco mais complicado

```json
 {
"nome":"João da Silva",
"idade":31,
"sexo":"M",
"agravos":[ "A90", "A16", "A92.0" ]
}
```





