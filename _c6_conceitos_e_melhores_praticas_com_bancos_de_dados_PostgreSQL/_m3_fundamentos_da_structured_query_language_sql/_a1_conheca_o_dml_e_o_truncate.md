# aula 1 - Conheça o DML e o Truncate - Daniel Robert Costa

## Objetivos da aula 
1. Revisão   
2. DML/CRUD   
3. TRUNCATE

## Revisão

* Primary key (PK) - chave que garante a não duplicação de dados.      
* Foreign key (FK) - chave responsável pelas relações entre dados em diferentes tabelas.   
* Tipos de dados - formatos que os dados podem assumir.
* DDL - Data Definition Language   
* DML - Data Manipulation Language   

Idempotência 

Propriedade que algumas ações/operações possuem possibilitando-as de serem executadas diversas vezes sem alterar o resultado após a aplicação 
inicial.

...IF EXISTS Por exemplo é um código de Idempotência.

eu reparei e arrumei, que maneiro, mas o importante é que a ausência de idempotência trás problemas para a aplicação. Então é uma boa prática 
garantir esse recurso no código.

Maneiro agora eu posso até selecionar tudo (ctrl + a) e executar o código (f5) que ele funciona perfeitamente, sem retornar um erro.

Veremos nessa aula comandos DML para respeitar a idempotência.

* Melhores Práticas em DDL   

Importante as tabelas possuírem campos que realmente serão utilizados e que sirvam de atributo direto a um objetivo comum.

* Criar/acrescentar colunas que são "atributos básicos" do objeto; Exemplo: tabela CLIENTE: coluna TELEFONE/ coluna AGENCIA_BANCARIA

* Cuidado com regras (constraints)

* Cuidado com o excesso de Foreign keys - substitua criação de foreing keys por novas tabelas, caso seja necessário usar muitas foreign keys.

* Cuidado com o tamanho indevido de colunas, exemplos: coluna CEP varchar (255)


## DML - CRUD 

comandos DML 

SELECT 

SELECT (campos,...) FROM tabela [condições]

EXEMPLOS: 

SELECT numero,nome FROM banco;   
SELECT numero, nome FROM banco WHERE ativo IS TRUE;   
SELECT numero FROM cliente WHERE email LIKE '%gmail.com';

o LIKE respeita o case sensitive e o ILIKE não respeita o case sensitive.

`Esse select não é recomendado pelo daniel, porque não é uma boa prática usar IN dessa forma e tem outras formas mais inteligentes e que não 
utiliza tantos recursos do servidor.`   
SELECT numero FROM agencia   
WHERE banco_numero IN (SELECT numero FROM banco WHERE nome ILIKE '%Bradesco%');

Quando fazemos uma consulta com SELECT existem várias etapas que não 'exergamos' ocorrendo.

Quando realizamos uma consulta, essa consulta é enviada para a engine do banco de dados que monta um plano de execução para filtrar a query, após 
o filtro ele retorna os dados, esses dados farão o fetch, e diversas memórias (buffer) atuam no momento do retorno, 

Uma consulta incorreta traz um mal desempenho para a rede de transmissão entre o servidor da aplicação e o  banco dados, ou o servidor não suporta 
esse número exagerado de dados, ou o banco de dados que não consegue atuar com tanto registros solicitados.

SELECT - Condição (WHERE/ AND/ OR)

WHERE (coluna/condição):

* =  
* > / >=  
* < / <=   
* <> / !=   
* LIKE   
* ILIKE   
* IN   

A primeira condição deve sempre ser WHERE as demais condições, AND ou OR.

Quanto melhor a condição da consulta mais rápido será o acesso e retorno dos dados. 

SELECT com idempotência

SELECT (campos,...)   
FROM tabela1   
WHERE EXISTS (
    SELECT (campos,...)
    FROM tabela2
    WHERE campo1 = valor1    
    [AND/OR campoN = valorN]
); 

O código acima não é uma boa prática ele consome recursos excessivos em relação a outras formas mais apropriada. A melhor prática recomenda utilizar 
LEFT JOIN. 

SELECT * ...

Evite esse comando.Nem sempre é necessário consultar todos os campos das tabelas.

Vale a pena tirar um tempinho do dia a dia para programar com essa boa prática apesar da cobrança de retornar recursos (features).

INSERTS

INSERT (campos de tabela, ...) VALUES (valores, ...);   
INSERT (campos de tabela, ...) SELECT (valores,...);

INSERTS COM Idempotência 

INSERT INTO agencia (banco_numero, numero, nome) VALUES (341, 1, 'Centro da cidade');

`Esse comando abaixo não é uma boa prática`   
INSERT INTO agencia (banco_numero, numero, nome)    
SELECT 341, 1, 'Centro da cidade'   
WHERE NOT EXISTS (SELECT banco_numero, numero, nome FROM agencia WHERE banco_numero = 341 AND numero=1 AND nome = 'Centro da cidade');

ON CONFLICT 

INSERT INTO agencia (banco_numero, numero, nome) VALUES (341, 1, 'Centro da cidade') ON CONFLICT (banco_numero, numero) DO NOTHING;

Esse comando é uma alternativa para o comando não recomendado acima e garante a idempotência do comando.  

UPDATE 

UPDATE (tabela) SET campo1 = novo_valor WHERE (condição);

Lembre-se NUNCA FAÇA UPDATE SEM CONDIÇÃO (WHERE).

DELETE 

DELETE FROM (tabela) SET campo1 = novo_valor WHERE (condição);

Lembre-se NUNCA USE DELETE SEM CONDIÇÃO (WHERE).

## TRUNCATE 

Comando que "esvazia" a tabela.

TRUNCATE [ TABLE ] [ ONLY ] **name** [ * ] [,...] 
    [ RESTART IDENTIFY | CONTINUE IDENTIFY ] [ CASCADE | RESTRICT ]

Truncate - comando para limpar a tela.   
Table - nome da tabela    
Only - regra que delimita o comando   
RESTART IDENTIFY - com esse argumento quando limpamos um campo com identificadores de auto-incremento ele reinicia e o proximo registor inserido irá 
começar do "zero" ou um, o Daniel não recomenda muito porque isso pode "quebrar as relações no banco de dados".   
CONTINUE IDENTIFY - com esse argumento a proxima inserção de registro irá continuar do último incremento que estava presente antes do truncate.   
CASCADE - apaga o registro e os registros em outras tabelas relacionadas aos registros que está sendo apagado. Esse comando precisa ser executado 
com muito cuidado.   
RESTRICT - não foi abordado. Ele é o padrão e não "trunca" a tabela caso exista relações do registro sendo truncado com outros registros externos.

Agora vamos executar alguns comandos abordado no módulo anterior e também alguns comandos novos. Esses comandos estão salvos nos seguintes arquivos. 

`_aula1_modulo3_comandos_de_select_da_aula.sql` e `_aula1_modulo3_comandos_para_pratica.sql`.

