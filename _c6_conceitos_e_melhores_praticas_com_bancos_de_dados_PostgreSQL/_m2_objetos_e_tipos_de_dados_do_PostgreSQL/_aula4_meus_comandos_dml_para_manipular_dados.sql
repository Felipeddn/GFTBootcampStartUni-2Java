-- dados inseridos na tabela agencia
INSERT INTO agencia (banco_numero, numero, nome)
VALUES 
(1, 6913, 'CANDIDO RODRIGUES'),
(1, 4309, 'BELMIRA MARIN'),
(1, 3561, 'INTERLAGOS'),
(237, 1, 'Parelheiros-USP'),
(237, 2, 'Vl Sao Jose-USP'),
(260, 1, 'Agencia virtual para operações'),
(341, 1, 'Av. Dona Belmira Marin'),
(341, 2, 'Av. do Rio Bonito'),
(341, 3, 'SP Market'),
(33, 1547, 'Av. Dona Belmira Marin'),
(33, 254, 'R. Boa Vista'),
(33, 662, 'Av. Sen. Teotonio Vilela')
;
-- comando para verificar os dados inseridos na tabela banco.
SELECT * FROM agencia;


-- dados inseridos na tabela banco
INSERT INTO banco (numero, nome)
VALUES 
(1, 'Banco do Brasil S.A. (BB)'),
(237, 'Bradesco S.A'),
(260, 'Nu Pagamentos S.A. (Nubank)'),
(341, 'Itau Unibanco S.A.'),
(33, 'Banco Santander Brasil S.A.');
-- comando para verificar os dados inseridos na tabela banco.
SELECT * FROM banco;


-- dados inseridos na tabela cliente
INSERT INTO cliente (numero, nome, email)
VALUES
(1, 'Ciro Gomes', 'Cirogomes@hotmail.com'),
(2, 'Fernando Pessoa', 'Fernandopessoa@gmail.com'),
(3, 'Michael Jackson', 'Michaeljackson@icloud.com'),
(4, 'Jeff Besus', 'Jeffbesus@hotmail.com'),
(5, 'Linus Torvalds','Linustorvalds@gmail.com'),
(6, 'Steve Jobs', 'Stevejobs@icloud'),
(7, 'Bill Gates', 'Billgates@hotmail.com'),
(8, 'Bia Falcao', 'Biafalcao@gmail.com'),
(9, 'Renato Russo', 'Renatorusso@icloud.com'),
(10, 'Messi', 'Messi@hotmail.com'),
(11, 'Tony Stark', 'Tonystark@gmail.com'),
(12, 'Viuva Negra', 'Viuvanegra@icloud.com')
;
-- comando para verificar os dados inseridos na tabela cliente.
SELECT * FROM cliente;

-- dados inseridos na tabela cliente_transacoes
INSERT INTO cliente_transacoes 
(id, banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, tipo_transacao_id, valor)
VALUES
(1, 1, 6913, 11111, 1, 1, 9, 200.00),
(2, 237, 1, 44444, 4, 4, 2, 1000.00),
(3, 341, 3, 99999, 9, 9, 3, 1500.00),
(4, 33, 254, 54321, 2, 11, 6, 850.50)
;
-- comando para verificar os dados inseridos na tabela cliente_transacoes.
SELECT * FROM cliente_transacoes; 


-- dados inseridos na tabela conta_corrente
INSERT INTO conta_corrente (banco_numero, agencia_numero, numero, ditito, cliente_numero)
VALUES
(1, 6913, 11111, 1, 1),
(1, 4309, 22222, 2, 2),
(1, 3561, 33333, 3, 3),
(237, 1, 44444, 4, 4),
(237, 2, 55555, 5, 5),
(260, 1, 66666, 6, 6),
(341, 1, 77777, 7, 7),
(341, 2, 88888, 8, 8),
(341, 3, 99999, 9, 9),
(33, 1547, 12345, 1, 10),
(33, 254, 54321, 2, 11),
(33, 662, 67890, 3, 12)
;
-- comando para verificar os dados inseridos na tabela conta_corrente.
SELECT * FROM conta_corrente;


-- dados inseridos na tabela tipo_transacao
-- fonte https://www.equals.com.br/blog/saiba-quais-sao-os-principais-tipos-de-transacoes-financeiras/
INSERT INTO tipo_transacao (id, nome)
VALUES
(1, 'dinheiro'),
(2, 'cartao credito'),
(3, 'cartao debito'),
(4, 'doc'),
(5, 'ted'),
(6, 'boletos'),
(7, 'voucher'),
(8, 'duplicatas')
;
-- inserido depois
INSERT INTO tipo_transacao (id, nome)
VALUES
(9, 'pix')
;
-- comando para verificar os dados inseridos na tabela tipo_transacao.
SELECT * FROM tipo_transacao; 

-- corrigindo um equivoco.
UPDATE tipo_transacao SET
nome = 'doc'
WHERE nome = 'dc';

UPDATE tipo_transacao SET
nome = 'duplicatas'
WHERE nome = 'Duplicatas';

