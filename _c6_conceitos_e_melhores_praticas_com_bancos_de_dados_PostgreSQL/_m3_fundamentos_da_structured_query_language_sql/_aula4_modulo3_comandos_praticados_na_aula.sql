-- aula 4 modulo 3 otimizando o código com CTE 
SELECT numero, nome FROM banco;
SELECT numero, nome, banco_numero FROM agencia;

-- RAPAZ AQUI VIROU UM COPY/PAST porque não sei bem o que estou fazendo, assim o aprendizado fica prejudicado demais.

WITH tbl_tmp_banco AS (
	SELECT numero, nome -- linha que fornece dados para o SELECT FORA DO PARENTESES.
	FROM banco
)
SELECT numero, nome -- os valores numero e nome vem da linha marcada no select
FROM tbl_tmp_banco
;

WITH params AS(
	SELECT 213 AS banco_numero
), tbl_tmp_banco AS (
	SELECT numero, nome
	FROM banco
	JOIN params ON params.banco_numero = banco.numero
)
SELECT numero, nome
FROM tbl_tmp_banco
;

-- um subselect
SELECT banco.numero, banco.nome
FROM banco
JOIN (
	SELECT 213 AS banco_numero
) params ON params.banco_numero = banco.numero
;


WITH cliente_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
		   tipo_transacao.nome AS tipo_transacao_nome,
		   cliente_transacoes.valor AS tipo_transacao_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM cliente_e_transacoes
;

-- Esse comando parece melhor que aqueles diversos JOINS da aula anterior. Mas saber usar isso vai dar trabalho.
WITH cliente_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
		   tipo_transacao.nome AS tipo_transacao_nome,
		   cliente_transacoes.valor AS tipo_transacao_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
	JOIN banco ON banco.numero = cliente_transacoes.banco_numero 
	-- Uma boa prática quando usar condições diretas usar como na linha abaixo.
	AND banco.nome ILIKE '%Itaú%'
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM cliente_e_transacoes
;