# Objetos e comandos do banco de dados - aula 4 - Daniel Robert Costa

## Objetivos da aula 

1. Database/schemas/objetos
2. Tabelas/Colunas/Tipos de dados
3. DML e DDL

## Database/Schemas/Objetos 

Database </br>
É o banco de dados.  </br>
Grupo de schemas e seus objetos, como tabelas, types, views, funções, entre outros.  </br>
Seus schemas e objetos não podem ser compartilhados entre si.  </br>
Cada Database é separado um do outro compartilhando apenas usuários/roles e configurações do cluster PostgreSQL.

Schemas  </br>
É um grupo de objetos, como tabelas, types, views, funções, entre outros.  </br>
É possível relacionar objetos entre diversos schemas.  </br>
Por exemplo: schema public e schema curso podem ter tabelas com o mesmo nome (teste por exemplo) relacionado-se entre si.

Objetos  </br>
São as tabelas, views, functions, types, sequences, entre outros, pertencentes ao sch...

Esses comandos foram pegos na documentação do PostgreSQL, cortesia do mentor Daniel.   
https://www.postgresql.org/docs/current/sql-commands.html

Sintaxe para criar Database, mudar nome e excluir banco de dados.  </br>
CREATE DATABASE name  </br>

define quem será o dono desse banco de dados, o role proprietário  </br>
 [[WITH] [OWNER [=] user_name]  </br>
   [TEMPLATE [=] template]  </br>
   [ENCODING [=] encoding]  </br>
   [LC_COLLATE [=] lc_collate]  </br>
   [LC_CTYPE [=] lc_ctype]  </br>

algo relacionado ao disco  </br>
   [TABLESPACE[=]tablespace_name]  </br>
   [ALLOWS_CONNECTIONS[=]allowconn]   </br>
   [CONNECTIONS LIMIT[=] connlimit]   </br>
   [IS_TEMPLATE [=] is_template]   </br>
   

Comandos para renomar o banco de dados  </br>
ALTER DATABASE name RENAME TO new_name </br>

trocar o dono do banco de dados  </br>
ALTER DATABASE name OWNER TO ( new_owner| CURRENT_USER | SESSION_USER)  </br>


ALTER DATABASE name SET TABLESPACE new_tablespace

Apagar um banco de dados.
DROP DATABASE [nome] 

Sintaxe para criar, alterar o nome de um schema e excluir  </br>
CREATE SCHEMA schema_name [AUTHORIZATION role_specification] 

CREATE SCHEMA name RENAME TO new_name  </br>
ALTER SCHEMA name OWNER TO { new_owner | CURRENT_USER | SESSION_USER}

DROP SCHEMA name

Melhores Práticas

Esses comandos abaixo evita erros, em uma situação de automatização ele não para a execução do código.

CREATE SCHEMA IF NOT EXISTS schema_name [AUTHORIZATION role_specification]
DROP SCHEMA IF EXISTS [nome];

## Tabelas, Colunas e Tipos de dados

Tabela é o Conjunto de dados dispostos em colunas e linhas referentes a um objetivo comum.

As colunas são consideradas como "campos da tabela", como atributos de uma tabela.

As linhas de uma tabela são chamadas também de tuplas, e é onde estão contidos os valores, os dados.

Exemplo de uma tabela 

TABELA = automovel  </br>
COLUNA 1 = tipo (carro, moto, aviao, helicoptero)  </br>
COLUNA 2 = ano_de_fabricacao (2010, 2011, 2020)  </br>
COLUNA 3 = capacidade_pessoas (1, 2, 350)  </br>
COLUNA 4 = fabricante (Honda, Avianca, Yamaha)  

TABELA = produto  </br>
COLUNA 1 = codigo serial do produto  </br>
COLUNA 2 = tipo (vestuário, eletronico, beleza)  </br>
COLUNA 3 = preco

### Primary key / Chave primária / PK

No conceito de modelo de dados relacional e obedecendo as regras de normalização, uma PK é um conjunto de um ou mais campos que nunca se repetem 
em uma tabela e que seus valores garantem a integridade do dado único e a utilização do mesmo como referência para o relacionamento entre demais 
tabela.

* Não pode haver duas ocorrências de uma mesma entidade com o mesmo conteúdo na PK.

* A chave primária não pode ser composta por atributo opcional, ou seja, atributo que aceite nulo.

* Os atributos identificadores devem ser o conjunto mínimo que pode identificar cada instância de uma entidade.

* Não devem ser usadas chave externas, apesar de existir exceções.

* Não devem conter informações volátil.

### Foreign key / Chave estrangeira / FK

Campo ou conjunto de campos que são referênciais de chaves primárias de outras tabelas ou da mesma tabela.  </br>
Sua principal função é garantir a integridade referencial entre as tabelas.

exemplo presente no arquivo `_aula3_diagrama_relacionamento_entidade.svg`.

### Tipos de dados

**Numeric types**           UUID type  </br>
Monetary types              XML type  </br>
**Character types**         JSON types  </br>
Binary Data types           arrays  </br>
**Date/time types**         Composite types  </br>
**Boolean types**           Range types  </br>
Enumerated types            Domain types  </br>
Geometric types             Object Identifier types  </br>
Network address types       pg_Isn type  </br>
Bit string types            Pseudo types  </br>
Text Search types

Os tipos em negritos serão os tipos tratados no curso.

Caracteristicas dos dados do tipo Numéricos 

Nome		tamanho de armazenamento	descrição				Alcance </br>
smallint	2 bytes				inteiro pequeno				-32.768 até +32.767  </br>
inteiro		4 bytes				escolha tipica para inteiros		-2.147.483.648 até +2.147.483.647  </br>
bigint		8 bytes				inteiro de longo alcance		-9.223.372.036.854.775.808 até +9.223.372.036.854.775.808  </br>
decimal		variavel			uso de precisão específica		até 131.072 digitos antes do ponto decimal; até 16.383 digitos depois do ponto decimal.  </br>
numeric		variavel			uso de precisão específica		até 131.072 digitos antes do ponto decimal; até 16.383 digitos depois do ponto decimal.  </br>
real		4 bytes				precisão variavel, inexato		6 digitos decimal de precisão  </br>
double precision 8 bytes			precisão variavel, inexato		15 digitos decimal de precisão  </br>
smallserial	2 bytes				inteiro de auto incremento pequeno	1 até 32.767  </br>
serial		4 bytes				inteiro de auto incremento		1 até 2.147.483.647  </br>
bigserial	8 bytes				inteiro de auto incremento grande	1 até 9.223.372.036.854.775.808  

Quando usamos as 3 ultimas opções de tipos ao criar um novo registro automáticamente ele gera o próximo número.

Caracteristicas dos dados do tipo Caracteres

Nome					Descrição  </br>
character varying (n), varchar (n)	variação de tamanho com limite  </br>
character (n), char(n)			tamanho fixo, com espaços não ocupados ocupados com zero. caso não seja informado um valor em n ficará definido como espaço 1.  </br>
text					variação de tamanho ilimitado.

Caracteristicas dos dados do tipo Data

Nome					tamanho de armazenamento	descrição				Valor baixo	valor alto	resolução  </br>
timestamp [ (p) ] [without time zone]	8 bytes				Tanto data quanto tempo (no time zone)	4713 BC		294276 AD	1 microsecond  </br>
timestamp [ (p) ] with time zone	8 bytes				tanto data quanto tempo com time zone	4713 BC		294276 AD	1 microsecond  </br>
date					4 bytes				data (sem tempo do dia?)		4713 BC		587497 AD	1 dia  </br>
time [ (p) ] [without time zone]	8 bytes				tempo do dia sem data			00:00:00	24:00:00	1 microsecond  </br>
time [ (p) ] [with time zone]		12 bytes			tempo do dia sem data, com time zone	00:00:00+1459	24:00:00-1459	1 microsegundo  </br>
interval [ (fields) ] [(p)]		16 bytes			intervalo de tempo			-178000000 years 178000000 years 1 microsegundo

Caracteristicas dos dados do tipo booleano

nome		tamanho de armazenamento	descrição
booleano	1 byte				estado de verdadeiro ou falso

Usar ORM precisa ter cautela por conta de uso de recursos, modelando dados de tamanho que use apenas recursos necessários, o ORM costuma usar tipos 
de dados que não faz sentido usando muito recurso, sempre fique atento as boas práticas.

### DML e DDL

DML </br>
Data Manipulation Language  </br>
Linguagem de manipulação de dados  </br>
INSERT, UPDATE, DELETE, **SELECT**  </br>
O select não é unanime sobre ser DML, outros como DQL, que significa data query language, ou linguagem de consulta de dados.

DDL  </br>
Data Definition Language  </br>
Linguagem de definição de dados  </br>
CREATE, ALTER, DROP

CREATE / ALTER / DROP 

CREATE [objeto] [nome do objeto] [opções];

ALTER [objeto] [nome do objeto] [opções];

DROP [objeto] [nome do objeto] [opções];

CREATE DATABASE dadosbancarios;  </br>
ALTER DATABASE dadobancarios OWNER TO diretoria;  </br>
DROP DATABASE dadosbancarios;  

CREATE SCHEMA IF NOT EXITS bancos; </br>
ALTER SCHEMA bancos OWNER TO diretoria;  </br>
DROP SCHEMA IF EXISTS bancos;

CREATE TABLE [IF NOT EXISTS] [nome da tabela] (    
    [nome do campo] [tipo] [regras] [opções],   
    [nome do campo] [tipo] [regras] [opções],   
    [nome do campo] [tipo] [regras] [opções]   
);


ALTER TABLE [nome da tabela] [opções];

DROP TABLE [nome da tabela]; 
	
exemplos de comando   
```sql   
CREATE TABLE IF NOT EXISTS banco (   
    codigo INTEGER PRIMARY KEY,  
    nome VARCHAR(50) **NOT NULL**,   
    data_criacao TIMESTAMP NOT NULL DEFAULT NOW(),   
);

CREATE TABLE IF NOT EXISTS banco(   
    codigo INTEGER,   
    nome VARCHAR(50) **NOT NULL**,   
    data_criacao TIMESTAMP NOT NULL DEFAULT NOW()   
    PRIMARY KEY (codigo)
);
``` 

ALTER TABLE banco ADD COLUMN tem_poupanca BOOLEAN;

DROP TABLE IF EXISTS banco;

INSERT 

INSERT INTO [nome da tabela] ([campos da tabela, outro campo da tabela, ...])   
VALUES ([valores de acordo com a ordem dos campos acima, valor de outro campo da tabela, ...]);

INSERT INTO [nome da tabela] ([campos da tabela, outro campo da tabela, ...])
SELECT [valore de acordo com a ordem dos campos acima]

exemplo prático

```sql
INSERT INTO banco (codigo, nome, data_criacao)   
VALUES (100, 'Banco do Brasil', now())

INSERT INTO banco (codigo, nome, data_criacao)    
SELECT 100, Banco do Brasil, now();    
```
UPDATE 

UPDATE [nome da tabela] SET   
[campo1] = [novo valor do campo1],   
[campo2] = [novo valor do campo2],   
...   
[WHERE + condições]

**Atençao: muito cuidado com os updates. Sempre utilize-os com condição.**

utilizar o update sem colocar a condição faz o comando ser valido para todos os objetos, ou seja, por exemplo se colocamos o comando update banco 
santander sem a condição where todos os bancos de dados serão atualizados com o nome santander. Uma tremenda dor de cabeça...

exemplo prático 

UPDATE banco SET   
codigo = 500   
WHERE codigo = 100;

UPDATE banco SET
data_criacao = now()
WHERE data_criacao IS NULL;

DELETE 

DELETE FROM [nome da tabela]
[WHERE + condições]

**Atenção: muito cuidado com os deletes. Sempre utilize-os com condição.**

No comando delete usa-lo sem condição exclui toda a tabela.

SELECT 

SELECT [campos de tabela]
FROM [nome da tabela]
[WHERE + condições]

DICA DE BOAS PRÁTICAS = Evite sempre que puder o SELECT * esse comando retorna todos os registros de uma tabela e nem sempre precisamos de todos 
eles, as ferramentas ORM costumam utilizar ele, então é interessante sempre ficar de olho no uso dos mesmo. tente usar select id, por exemplo, 
usar o comando select * isso consome muito recurso porque os dados tem um tamanho que será utilizado pelos sistemas computacionais.

exemplo prático 

```sql
SELECT codigo, nome   
FROM banco;

SELECT codigo, nome   
FROM banco   
WHERE data_criacao > '2019-10-15 15:00:001'
```

MÃO NA MASSA !!!

mão na massa inserido no arquivo `_aula4_comandos_ddl_da_aula_para_criar_tabela.sql` 


dados do arquivo do daniel de inserções na tabela encontra-se no arquivo `_aula4_insercoes_do_daniel_em_bd.sql`

