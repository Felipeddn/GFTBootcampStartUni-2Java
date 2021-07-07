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

INSERT INTO vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
VALUES (51, 'Banco boa ideia', TRUE);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2 WHERE banco_numero = 51;

SELECT numero, nome, ativo FROM banco WHERE numero = 51;

-- parei no minuto 22:46