# aula 1 modulo 4 - Como as views auxiliam no acesso ao bancos de dados - Daniel Robert Costa

## Views 

Views são visões.   
Views são "camadas" para as tabelas.   
São "alias" para uma ou mais querys.   
Aceitam comandos de SELECT, **INSERT, UPDATE e DELETE.**   

INSERT, UPDATE e DELETE são comandos que podem ser aplicados a apenas uma tabela por vez.

CREATE [OR REPLACE] [TEMP | TEMPORARY] [RECURSIVE] VIEW name [(column_name[,...])] 
	[WITH ([view_option_name][= views_option_value][,...])] 
	AS query
	[WITH [ CASCADE | LOCAL ] CHECK OPTIONS ]

As views são consideradas uma boa prática de segurança, porque elas substituem consultas diretas aos bancos de dados por comandos com uma camada 
superior ao acesso direto no banco de dados.

### Exemplos de comandos

Idempotências em views

Usar o recurso "OR REPLACE" durante o comando CREATE é uma forma de garantir a Idempotência do comando, evitando o erro durante a execução desse 
comando. 

Comandos de SELECT em Views

CREATE OR REPLACE VIEW vw_bancos AS (
    SELECT numero, nome, ativo
    FROM banco
);

SELECT numero, nome, ativo
FROM vw_bancos;

CREATE OR REPLACE VIEW vw_bancos (banco_numero, banco_nome, banco_ativo) AS (
    SELECT numero, nome, ativo
    FROM banco
);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos; 

Views não tem definição de tipo de dados (data type) elas assumem o tipo do dado acessado.

Comandos de INSERT, UPDATE e DELETE em Views

CREATE OR REPLACE VIEW vw_bancos AS(
    SELECT numero, nome, ativo
    FROM banco
);

SELECT numero, nome, ativo
FROM vw_bancos;

* funcionam apenas para views com uma tabela

INSERT INTO vw_bancos (numero, nome, ativo) VALUES (100, 'Banco CEM', TRUE);

UPDATE vw_bancos SET nome = 'Banco 100' WHERE numero = 100;

DELETE FROM vw_bancos WHERE numero = 100;

Temporary 

CREATE OR REPLACE **TEMPORARY** VIEW vw_bancos AS(
    SELECT numero, nome, ativo
    FROM banco
);

SELECT numero, nome, ativo
FROM vw_bancos;

VIEW presente apenas na sessão do usuário.
Se você se desconectar e conectar novamente, a VIEW não estará disponível.	

Recusive 

CREATE OR REPLACE RECURSIVE VIEWS (nome_da_view) (campo_da_view) AS(
    SELECT base
    UNION ALL
    SELECT campos
    FROM tabela_base
    JOIN (nome_da_view)
);

* Obrigatório a existência dos campos da VIEW   
* UNION ALL 

A view recursiva é uma view que dentro do comando dela, ela irá chamar ela mesmo. Para uma view recursiva é obrigatório os campos da view e o 
comando UNION ALL, o comando UNION sem all ele unifica campos iguais já o UNION ALL não unifica.

exemplo de um comando recursive 

CREATE TABLE IF NOT EXISTS funcionarios(
    id SERIAL NOT NULL,
    nome VARCHAR(50),
    gerente INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (gerente) REFERENCES funcionario(id)
);

INSERT INTO funcionarios(nome, gerente) VALUES ('Ancelmo', null);
INSERT INTO funcionarios(nome, gerente) VALUES ('Beatriz', 1);
INSERT INTO funcionarios(nome, gerente) VALUES ('Magno', 1);
INSERT INTO funcionarios(nome, gerente) VALUES ('Cremilda', 2);
INSERT INTO funcionarios(nome, gerente) VALUES ('Wagner', 4);

nas inserções observe que o Ancelmo é inserido sem referências, Beatriz terá como gerente o id 1 que é o Ancelmo, o Magno também terá como 
referência o Ancelmo já Cremilda faz referência a Beatriz e o Wagner que faz referência a Cremilda.

Veja um exemplo de como ficará a tabela na imagem `_aula1_modulo4_exemplo_de_tabela_com_dados_inseridos_recursivamente.png`

Para compreender o comportamento da View vamos abordar o comportamento de dois comandos de SELECT atuando separadamente sem a metodologia do 
recursivo

SELECT id, nome, gerente FROM funcionarios WHERE gerente IS NULL;

esse comando baseado no exemplo da tabela da imagem retorna o seguinte resultado: 

id	nome		gerente
1	Ancelmo

SELECT id, nome, gerente FROM funcionarios WHERE id = 999;

esse comando não terá retorno, porque não tem o valor.

agora veja a forma recursivo do comando SELECT e seu retorno

SELECT id, nome, gerente FROM funcionarios WHERE gerente IS NULL   
UNION ALL    
SELECT id, nome, gerente FROM funcionairos WHERE id = 999

O retorno será:   

id	nome		gerente
1	Ancelmo

Agora com essa compreensão vamos entender a construção da view recursiva.

CREATE OR REPLACE RECURSIVE VIEW vw_funcionarios (id, gerente, funcionario) AS(
    SELECT id, gerente, nome
    FROM funcionarios
    WHERE gerente IS NULL
    UNION ALL
    SELECT funcionarios.id, funcionarios.gerente, funcionarios.nome
    FROM funcionarios
    JOIN vw_funcionarios ON vw_funcionarios.id = funcionarios.gerente
);

SELECT id, gerente, funcionario
FROM vw_funcionarios;

Agora a consulta acima porém melhorada

CREATE OR REPLACE RECURSIVE VIEW vw_funcionarios (id, gerente, funcionario) AS(
    SELECT id, CAST('' AS VARCHAR) AS gerente, nome
    FROM funcionarios
    WHERE gerente IS NULL
    UNION ALL
    SELECT funcionarios.id, gerente.nome, funcionarios.nome
    FROM funcionarios
    JOIN vw_funcionarios ON vw_funcionarios.id = funcionarios.gerente
    JOIN funcionairos.gerente ON gerentes.id = vw_funcionarios.id
);

SELECT id, gerente, funcionario
FROM vw_funcionarios;

WITH OPTIONS 

CREATE OR REPLACE VIEW vw_bancos AS(
    SELECT numero, nome, ativo
    FROM banco
);

INSERT INTO vw_bancos(numero, nome, ativo) VALUES (100, 'Banco CEM', FALSE) 
-- OK

CREATE OR REPLACE VIEW vw_bancos AS(
    SELECT numero, nome, ativo
    FROM banco
    WHERE ativo IS TRUE
) WITH LOCAL CHECK OPTIONS;

INSERT INTO vw_bancos(numero, nome, ativo) VALUES (100, 'Banco CEM', FALSE)
-- ERRO

	
CREATE OR REPLACE VIEW vw_bancos_ativos AS(
    SELECT numero, nome, ativo
    FROM banco
    WHERE ativo IS TRUE
) WITH LOCAL CHECK OPTIONS;


CREATE OR REPLACE VIEW vw_bancos_maiores_que_100 AS(
    SELECT numero, nome, ativo
    FROM vw_banco
    WHERE numero > 100
) WITH LOCAL CHECK OPTIONS;

INSERT INTO vw_bancos_maiores_que_100(numero, nome, ativo) VALUES (99, 'Banco DIO', FALSE)
-- ERRO

INSERT INTO vw_bancos_maiores_que_100(numero, nome, ativo) VALUES (200, 'Banco DIO', FALSE)
-- ERRO


CREATE OR REPLACE VIEW vw_bancos_ativos AS(
    SELECT numero, nome, ativo
    FROM banco
    WHERE ativo IS TRUE
);


CREATE OR REPLACE VIEW vw_bancos_maiores_que_100 AS(
    SELECT numero, nome, ativo
    FROM vw_banco
    WHERE numero > 100
) WITH LOCAL CHECK OPTIONS;

INSERT INTO vw_bancos_maiores_que_100(numero, nome, ativo) VALUES (99, 'Banco DIO', FALSE)
-- ERRO

INSERT INTO vw_bancos_maiores_que_100(numero, nome, ativo) VALUES (200, 'Banco DIO', FALSE)
-- OK

CREATE OR REPLACE VIEW vw_bancos_ativos AS(
    SELECT numero, nome, ativo
    FROM banco
    WHERE ativo IS TRUE
) WITH LOCAL CHECK OPTIONS;


CREATE OR REPLACE VIEW vw_bancos_maiores_que_100 AS(
    SELECT numero, nome, ativo
    FROM vw_banco
    WHERE numero > 100
) WITH CASCADED CHECK OPTIONS;

INSERT INTO vw_bancos_maiores_que_100(numero, nome, ativo) VALUES (99, 'Banco DIO', FALSE)
-- ERRO

INSERT INTO vw_bancos_maiores_que_100(numero, nome, ativo) VALUES (200, 'Banco DIO', FALSE)
-- ERRO

E agora o mão na massa para poder práticar esses conceitos!!

Os comandos estão no arquivo `_aula1_modulo4_comandos_praticados_na_aula.sql`

Finalizado a aula.


