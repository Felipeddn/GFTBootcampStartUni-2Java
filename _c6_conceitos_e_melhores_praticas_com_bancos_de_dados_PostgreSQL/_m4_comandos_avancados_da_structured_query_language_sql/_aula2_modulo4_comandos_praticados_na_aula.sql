-- aula 2 modulo 4 transações 

-- visualizando uma tabela
SELECT numero, nome, ativo 
FROM banco
-- organizando sua visualização
ORDER BY numero
;

-- atualizando informações na primeira linha
UPDATE banco 
SET ativo = false 
WHERE numero = 0 
;

-- comando da primeira transação, podemos executar cada comando por partes seguindo o número 
-- podemos executar só o begin
BEGIN;

-- depois só o comando de update
UPDATE banco 
SET ativo = true
WHERE numero = 0 
;

-- comando para verificar o efeito durante a transação, lembre-se que o commit (comprometer-se) ...
-- ... que consolida a transação
SELECT nome, numero, ativo 
FROM banco 
WHERE numero = 0
;

-- depois só o ROLLBACK, esse comando retorna ao estado anterior antes do comando BEGIN e os comandos internos após 
-- o BEGIN e antes de ROLLBACK
ROLLBACK;

-- comando com o COMMIT que consolida uma transação sem retornar ao estado anterior
BEGIN;

UPDATE banco 
SET ativo = true 
WHERE numero = 0
;

COMMIT;

SELECT numero, nome, ativo
FROM banco
;

SELECT id, gerente, nome
FROM funcionarios
;

-- fazer juntinho para melhorar a visualização de toda a transação
BEGIN;
UPDATE funcionarios SET gerente = 2 WHERE id = 3;
SAVEPOINT sf_func;
-- comando que não deve ser executado, pois não é uma boa prática mas que exemplifica muito bem o comando savepoint
UPDATE funcionarios SET gerente = null;
ROLLBACK TO sf_func;
UPDATE funcionarios SET gerente = 3 WHERE id = 5;
COMMIT;

