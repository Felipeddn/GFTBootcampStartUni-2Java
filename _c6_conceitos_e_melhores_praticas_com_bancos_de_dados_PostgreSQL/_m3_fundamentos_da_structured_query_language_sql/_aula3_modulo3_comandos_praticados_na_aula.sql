-- aula 3 modulo 3 trabalhando com joins

SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome FROM cliente;
SELECT banco_numero, agencia_numero, numero, digito, cliente_numero FROM conta_corrente;
SELECT id, nome FROM tipo_transacao;

SELECT banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, valor 
FROM cliente_transacoes; 

-- Esse comando abaixo é para retornar a quantidade de registros em uma tabela, caso alguém faça o comando:
-- (SELECT 1 FROM agencia;) para fazer a mesma operação tenha em mente que esse comando consome mais recursos 
-- logo usar o comando abaixo é a melhor prática, o ganho não é tão alto mas com diversos registros todo ganho
-- conta.
SELECT COUNT(1) FROM banco; -- 152 registros 
SELECT COUNT(1) FROM agencia; -- 306 registros

-- Nosso primeiro comando de Join do Curso, esse comando retorna uma união de dados que satisfaz a condição na 
-- comparação de dados (agencia.banco_numero = banco.numero)
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero 
-- agencia.banco_numero é uma foreign key da primary key banco.numero. Seguindo aquele conceito de uma busca
-- economizando recursos.
;

-- os comandos abaixo é uma curiosidade pessoal para compreender o JOIN
-- dados da tabela banco sem a junção
SELECT banco.numero, banco.nome
FROM banco
;

-- dados da tabela agencia sem a junção
SELECT agencia.numero, agencia.nome
FROM agencia
;

-- comando que conta o número de bancos
SELECT COUNT(banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero 
; -- 306 registros

-- comando sem GROUP BY, execute para visualizar o resultado e comparar com o comando abaixo que tem o GROUP BY
SELECT banco.numero
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero 
;

-- Com o GROUP BY podemos reduzir a repetição do comando para tornar mais agradavel a visualização dos dados
-- Nesse caso o GROUP BY juntou registros que se repetem e mostrou o valor que nos interessa
SELECT banco.numero
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero 
GROUP BY banco.numero
-- ORDER
;

-- Esse comando retorna o número de bancos que possuem agências.
SELECT COUNT (DISTINCT banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero 
;

-- Esse aqui fiquei com dúvida...
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia
 ON agencia.banco_numero = banco.numero
;

-- trouxe a mesma quantidade de registros que o comando acima.
SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia
RIGHT JOIN banco
 ON banco.numero = agencia.banco_numero
;

-- LEFT JOIN do comando acima, esse comando traz todas os registros em agencia e se existir um banco relacionado
-- a essa agencia ela é retornada.
SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia
LEFT JOIN banco
 ON banco.numero = agencia.banco_numero
;

-- 
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia
 ON agencia.banco_numero = banco.numero
;

CREATE TABLE IF NOT EXISTS teste_a (
	id SERIAL PRIMARY KEY,
	valor VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS teste_b (
	id SERIAL PRIMARY KEY,
	valor VARCHAR(10)
);

-- ALTER TABLE teste_ ???
-- DROP TABLE teste_;

-- atalho para selecionar toda a linha (no linux) alt + shift + seta para esquerda ou direita
-- inserindo dados na tabela teste_a
INSERT INTO teste_a (valor) VALUES ('teste 1');
INSERT INTO teste_a (valor) VALUES ('teste 2');
INSERT INTO teste_a (valor) VALUES ('teste 3');
INSERT INTO teste_a (valor) VALUES ('teste 4');

-- inserindo dados na tabela teste_b
INSERT INTO teste_b (valor) VALUES ('teste a');
INSERT INTO teste_b (valor) VALUES ('teste b');
INSERT INTO teste_b (valor) VALUES ('teste c');
INSERT INTO teste_b (valor) VALUES ('teste d');

-- aqui foi aplicado um alias (apelido para as tabelas)
SELECT tbla.valor, tblb.valor
FROM teste_a tbla
CROSS JOIN teste_b tblb
;

DROP TABLE IF EXISTS teste_a;
DROP TABLE IF EXISTS teste_b;

-- Um join bem elaborado para trazer uma relação de informaçõpes bem elaboradas.
SELECT banco.nome, agencia.nome, conta_corrente.numero, conta_corrente.digito, cliente.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
JOIN conta_corrente 
 -- ON conta_corrente.banco_numero = agencia.banco_numero
 ON conta_corrente.banco_numero = banco.numero
 AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
 ON cliente.numero = conta_corrente.cliente_numero
;



-- montar o select acima com inclusão das transações de cada cliente e os tipos de transações de cada cliente.

-- primeiro vou tentar descobrir em qual tabela estão esses dois campos (transacao de cliente e tipo de transacao)

-- SELECT * FROM information_schema.columns WHERE table_name = 'banco';

SELECT * FROM information_schema.columns WHERE table_name = 'cliente_transacoes';
SELECT column_name FROM information_schema.columns WHERE table_name = 'cliente_transacoes';
SELECT column_name FROM information_schema.columns WHERE table_name = 'tipo_transacao';

SELECT 
banco.nome, agencia.nome, conta_corrente.numero, conta_corrente.digito, cliente.nome, 

-- inclusão do código do desafio
cliente_transacoes.tipo_transacao_id, 
tipo_transacao.nome
-- fim da inclusão

FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
JOIN conta_corrente 
 -- ON conta_corrente.banco_numero = agencia.banco_numero
 ON conta_corrente.banco_numero = banco.numero
 AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
 ON cliente.numero = conta_corrente.cliente_numero
 
-- inclusão de código do desafio
JOIN cliente_transacoes
 ON cliente_transacoes.cliente_numero = cliente.numero
JOIN tipo_transacao
 ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
;

-- retornou uma consulta mas fiquei assustado porque não sei exatamente se cumpri o desafio.

