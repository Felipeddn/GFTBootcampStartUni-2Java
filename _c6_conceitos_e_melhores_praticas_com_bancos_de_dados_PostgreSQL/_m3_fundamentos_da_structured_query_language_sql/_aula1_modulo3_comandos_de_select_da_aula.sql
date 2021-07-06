-- comandos da aula 1 módulo 3 
SELECT nome, numero, ativo FROM banco; 
SELECT banco_numero, numero, nome FROM agencia;
--SELECT * FROM banco; 
SELECT numero, nome, email FROM cliente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero, agencia_numero, numero, cliente_numero FROM conta_corrente;
SELECT banco_numero, agencia_numero, cliente_numero FROM cliente_transacoes;

SELECT * FROM cliente_transacoes;
