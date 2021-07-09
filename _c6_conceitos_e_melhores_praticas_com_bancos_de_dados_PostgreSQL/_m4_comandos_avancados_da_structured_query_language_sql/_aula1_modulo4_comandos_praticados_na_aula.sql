-- aula 1 modulo 4 Como as views auxiliam no acesso ao banco de dados
SELECT numero, nome, ativo 
FROM banco
;

CREATE OR REPLACE VIEW vw_bancos AS(
	SELECT numero, nome , ativo
	FROM banco
);

SELECT numero, nome, ativo 
FROM vw_bancos
;

CREATE OR REPLACE VIEW vw_bancos_2 (banco_numero, banco_nome, banco_ativo) AS(
	SELECT numero, nome, ativo
	FROM banco
);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2
;

-- sobre os comandos INSERTs, UPDATEs e DELETEs, as views tem que fazer referência a apenas uma tabela para funcionar
-- esse exemplo abaixo é sobre esse conceito de views que faz referência a apenas um banco de dados.
INSERT INTO vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
VALUES (51, 'Banco boa ideia', TRUE);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2 WHERE banco_numero = 51;

SELECT numero, nome, ativo FROM banco WHERE numero = 51;

UPDATE vw_bancos_2 SET banco_ativo = FALSE WHERE banco_numero = 51;

DELETE FROM vw_bancos_2 WHERE banco_numero = 51;

CREATE OR REPLACE TEMPORARY VIEW vw_agencia AS(
	SELECT nome 
	FROM agencia
);

SELECT nome from vw_agencia;
-- execute um comando igual o comando acima em outra aba do 'Query Tools' para verificar que seu acesso só é possível
-- temporariamente para uma seção específica.

--CREATE OR REPLACE VIEW  vw_bancos_ativos AS(
-- 	SELECT numero, nome, ativo
--	FROM banco
--	WHERE ativo IS TRUE	
--) WITH LOCAL CHECK OPTION;

-- para prática de exemplo vamos retirar o comando WITH ...
CREATE OR REPLACE VIEW  vw_bancos_ativos AS(
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE	
);--WITH LOCAL CHECK OPTION


-- Comando que fere as locais check options, ou seja, fere uma determinação que um campo deve seguir.
INSERT INTO vw_bancos_ativos (numero, nome, ativo) VALUES (51, 'Banco Boa Ideia', FALSE);

--CREATE OR REPLACE VIEW vw_bancos_com_a AS(
--	SELECT numero, nome, ativo
--	FROM vw_bancos_ativos 
--	WHERE nome ILIKE 'a%'
--) WITH LOCAL CHECK OPTION;

-- view acima com o comando cascaded
CREATE OR REPLACE VIEW vw_bancos_com_a AS(
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos 
	WHERE nome ILIKE 'a%'
) WITH CASCADED CHECK OPTION;

SELECT numero, nome, ativo FROM vw_bancos_com_a;

-- exemplo que dá erro
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (333, 'Beta Omega', TRUE);

-- cometi um erro durante a inserção da linha acima, esse comando abaixo corrigiu o erro
DELETE FROM vw_bancos_com_a WHERE nome = 'Beta Omega';

INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (333, 'Alfa Omega', TRUE);

-- Esse comando viola as regras. após a mudança para pratica esse comando funciona
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (331, 'Alfa Gama', FALSE);

-- testando o comando com view com with cascaded onde valida as diversas regras de views
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (332, 'Alfa Gama Beta', FALSE);

-- Exemplo da view recursiva 
CREATE TABLE IF NOT EXISTS funcionarios(
	id SERIAL,
	nome VARCHAR(50),
	gerente INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (gerente) REFERENCES funcionarios(id)
	-- essa referência é diferente, ela se refere ao campo id dessa tabela que está sendo criada.
);

INSERT INTO funcionarios (nome, gerente) VALUES ('Ancelmo', null);
INSERT INTO funcionarios (nome, gerente) VALUES ('Beatriz', 1);
INSERT INTO funcionarios (nome, gerente) VALUES ('Magno', 1);
INSERT INTO funcionarios (nome, gerente) VALUES ('Cremilda', 2);
INSERT INTO funcionarios (nome, gerente) VALUES ('Wagner', 4);

-- validando a tabela
SELECT id, nome, gerente FROM funcionarios;

SELECT id, nome, gerente FROM funcionarios WHERE gerente IS NULL--;
UNION ALL
SELECT id, nome, gerente FROM funcionarios WHERE id = 999;

CREATE OR REPLACE RECURSIVE VIEW vw_func(id, gerente, funcionario) AS(
	SELECT id, gerente, nome
	FROM funcionarios
	WHERE gerente IS NULL
	
	UNION ALL
	
	SELECT funcionarios.id, funcionarios.gerente, funcionarios.nome
	FROM funcionarios
	JOIN vw_func ON vw_func.id = funcionarios.gerente
);

SELECT id, gerente, funcionario 
FROM vw_func
;

-- Desafio montar a view recursiva retornando o nome do gerente ao invés do número.

-- ###############################################
-- INICIO DO DESAFIO

-- primeiro vou pensar um pouco na lógica, isso me lembra um join onde eu trago uma relação de nomes se existir essa 
-- relação, vou tentar rever o conceito de join mas o select eu vou testando também

SELECT nome FROM funcionarios WHERE funcionarios.id = gerente;
SELECT nome FROM funcionarios WHERE gerente = funcionarios.id;
SELECT nome FROM funcionarios;

-- JOIN não tem muito haver talvez um UNION ou UNION ALL

SELECT id, gerente, nome
	FROM funcionarios
	WHERE gerente IS NULL
--;
	
	UNION ALL
-- each UNION query must have the same number of columns === cada consulta UNION deve ter o mesmo número de colunas

	SELECT funcionarios.nome
	FROM funcionarios
--;
	JOIN vw_func ON vw_func.id = funcionarios.gerente
;

-- está dificil compreender a lógica do comando, não está fazendo sentido. Vou rever a aula para ver se enxergo algo.
-- poxa a resposta estava no vídeo, logo o desafio vai ser resolvido mas a lógica precisará ser praticada
CREATE OR REPLACE RECURSIVE VIEW vw_funcionarios2 (id, gerente, funcionario) AS(
	SELECT id, CAST('' AS VARCHAR) AS gerente, nome
	FROM funcionarios
	WHERE gerente IS NULL
	
	UNION ALL
	
	SELECT funcionarios.id, gerente.nome, funcionarios.nome
	FROM funcionarios
	JOIN vw_funcionarios2 ON vw_funcionarios2.id = funcionarios.gerente
	JOIN funcionario.gerente ON gerente.id = ww_funcionarios2.id
)
;
-- Erro na view recursiva para ser resolvida
-- ERROR:  missing FROM-clause entry for table "gerente" === 
-- ERRO: entrada da cláusula FROM ausente para a tabela "gerente"


SELECT id, gerente, funcionario
FROM vw_funcionarios2
;

-- Exatamente igual a explicação
CREATE OR REPLACE RECURSIVE VIEW vw_funcionarios (id, gerente, funcionario) AS(
	SELECT id, CAST('' AS VARCHAR) AS gerente, nome
	FROM funcionarios
	WHERE gerente IS NULL
	
	UNION ALL
	
	SELECT funcionarios.id, gerentes.nome, funcionarios.nome
	FROM funcionarios
	JOIN vw_funcionarios ON vw_funcionarios.id = funcionarios.gerente
	JOIN funcionarios gerentes ON gerentes.id = vw_funcionarios.id
)
;


SELECT id, gerente, funcionario
FROM vw_funcionarios
;
-- solucionado, muito bom mas a resposta estava no vídeo tenho minhas dúvidas de quanto tempo seria necessário para 
-- fazer algo parecido no dia a dia, muito legal esse recurso, um código que funciona para sempre após inclusão de 
-- dados, assim o programador programa uma única vez, faz todo o sentido e o banco de dados pode crescer à vontade.

-- FIM DO DESAFIO
-- #######################################################

-- Usar views é uma forma de melhorar a segurança e trabalhar melhor com framework ORM, mapeando as views ao invés
-- dos campos diretamente.

-- não está funcionando muito estranho isso, rapaz eu tenho que usar aspas simples em palavras e não aspas duplas lol
UPDATE funcionarios 
SET nome = 'Beatriz'
WHERE nome = 'Beatroz';

-- funciona...
SELECT nome FROM funcionarios WHERE funcionarios.id = gerente
--WHERE nome = beatroz