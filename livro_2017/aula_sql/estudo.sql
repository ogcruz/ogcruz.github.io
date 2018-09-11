-- Exemplo 1 

-- Criando a Tabela paciente 

CREATE TABLE paciente (
ID INTEGER PRIMARY KEY,
Nome TEXT,
SNome TEXT,
Idade INTEGER,
Sexo VARCHAR(1),
Peso DOUBLE,
Altura FLOAT
 );

-- entrando dados paciente 
INSERT INTO `paciente` (ID,Nome,SNome,Idade,Sexo,Peso,Altura) VALUES (100,'Joao','Silva',43,'M',87.0,1.78);
INSERT INTO `paciente` (ID,Nome,SNome,Idade,Sexo,Peso,Altura) VALUES (101,'Paulo','Coelho',64,'M',78.0,1.72);
INSERT INTO `paciente` (ID,Nome,SNome,Idade,Sexo,Peso,Altura) VALUES (102,'Maria','Sabina',48,'F',67.0,1.63);
INSERT INTO `paciente` (ID,Nome,SNome,Idade,Sexo,Peso,Altura) VALUES (103,'Carlos','Pinto',38,'M',82.0,1.68);
INSERT INTO `paciente` (ID,Nome,SNome,Idade,Sexo,Peso,Altura) VALUES (104,'Joana','Braga',34,'F',55.0,1.58);

-- criando a tabela estudo
CREATE TABLE estudo (
ID INTEGER ,
Grupo VARCHAR(1),
Contagem INTEGER ,
Peso DOUBLE,
Semana INTEGER,
Data DATE DEFAULT CURRENT_DATE
 );

-- entrando dados da tabela estudo
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (100,'E',16,88.0,1);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (100,'E',32,87.0,2);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (100,'E',16,88.5,3);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (100,'E',32,87.0,4);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (101,'C',32,79.0,1);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (101,'C',64,81.2,2);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (101,'C',64,80.5,3);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (101,'C',128,81.0,4);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (102,'E',8,66.5,1);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (102,'E',32,67.0,2);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (102,'E',16,68.5,3);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (102,'E',32,68.0,4);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (103,'E',16,83.5,1);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (103,'E',32,84.5,2);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (103,'E',32,84.0,3);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (103,'E',64,86.0,4);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (104,'C',8,56.0,1);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (104,'C',8,55.5,2);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (104,'C',8,56.5,3);
INSERT INTO `estudo` (ID,Grupo,Contagem,Peso,Semana) VALUES (104,'C',8,56.0,4);

