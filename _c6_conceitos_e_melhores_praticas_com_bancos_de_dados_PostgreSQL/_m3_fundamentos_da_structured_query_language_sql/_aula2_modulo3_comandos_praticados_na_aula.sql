-- Aula 2 módulo 3 Funções agregadas 
-- reduzir e aumentar tamanho da tela com ctrl - ou ctrl + (sinais proximo ao enter), fora do teclado numérico.
SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome, email FROM cliente;
SELECT banco_numero, agencia_numero, cliente_numero FROM cliente_transacoes;

-- caso não lembre do campos, esses comandos de select podem ser realizados em um ambiente de testes
-- com asterísco, mas em ambiente de produção essa é uma péssima prática, pois isso exige muitos 
-- recursos causando transtornos no servidor, na rede entre a aplicação e o banco de dados ...

--SELECT * FROM conta_corrente;

-- Eu quero muito aprender a fazer da forma correta!

-- Agora vamos retomar aquele conceito de metadados salvos dos bancos de dados, acessando o catalago
-- do banco mais especificamente o information schemas

-- comando para saber nome das colunas de uma tabela
SELECT * FROM information_schema.columns WHERE table_name = 'banco';

-- Podemos fazer um SELECT mais preciso para economizar recursos e obter essa informação
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'banco';

-- outros campos que considerei importante olhando por cima
SELECT 
column_name, data_type, is_nullable, character_maximum_length,  is_updatable
FROM 
information_schema.columns 
WHERE 
table_name = 'banco';

-- funções de agregação
-- AVG (Average - média)
-- COUNT (having)
-- MAX
-- MIN
-- SUM (soma em português)

SELECT valor FROM cliente_transacoes;

-- retorna a média 
SELECT AVG(valor) FROM cliente_transacoes;

-- retorna a quantidade de clientes, 
SELECT COUNT (numero) 
FROM cliente;

-- Esse comando dessa forma retorna um erro porque, as funções agregadas agrupam colunas em um único 
-- registro (junta os conteúdos de diversas colunas em uma única linha.)
SELECT COUNT (numero), email 
FROM cliente
WHERE email ILIKE '%gmail.com'
;

-- para o comando acima é necessario usar outro comando em conjunto GROUP BY
SELECT COUNT (numero) , email
FROM cliente
WHERE email ILIKE '%gmail.com'
GROUP BY email
;

-- retorna o maior número, nesse caso o ultimo registro
SELECT MAX (numero)
FROM cliente;

-- retorna o menor número, nesse caso o primeiro registro
SELECT MIN (numero)
FROM cliente;

-- retorna o maior valor
SELECT MAX (valor)
FROM cliente_transacoes;

-- retorna o menor valor
SELECT MIN (valor)
FROM cliente_transacoes
;

-- nesse formato retorna erro, erro do tipo de agrupamento de campo que deve ser corrigido com GROUP BY
SELECT MAX (valor), tipo_transacao_id
FROM cliente_transacoes
;

-- correção aplicada com o group by, ele retorna o valor máximo por cada transação, bem poderoso essa consulta.
SELECT MAX (valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
;

-- operação para o valor minímo, ele retorna o menor valor por cada transação, bem legal para comparar
SELECT MIN (valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
;

-- em caso de duvida dos campos usamos aquele comando sobre catalogo do banco de dados.
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'cliente_transacoes';

-- comando que retorna a contagem de transações de clientes porém com a caracteristica de ser maior que 150 o 
-- valor da transação
SELECT COUNT (id), tipo_transacao_id 
FROM cliente_transacoes
GROUP BY tipo_transacao_id
-- o having ajuda no retorno de valores similares ou iguais na tabela.
HAVING COUNT (id) > 150
;
-- estou achando que o Daniel renomeou a tabela dele... mudou não rs ele corrigiu o nome.

SELECT SUM (valor)
FROM cliente_transacoes
;

SELECT SUM (valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
-- esse comando ordena o resultado
ORDER BY tipo_transacao_id -- (por padrão o order by é ASC - ascendente, do menor para o maior)
;

SELECT SUM (valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
-- esse comando ordena o resultado
ORDER BY tipo_transacao_id DESC
;
