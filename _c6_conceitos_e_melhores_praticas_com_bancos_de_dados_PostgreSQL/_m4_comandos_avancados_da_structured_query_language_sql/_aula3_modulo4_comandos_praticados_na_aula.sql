-- aula 3 modulo 4 funções que podem ser criadas pelos desenvolvedores 

CREATE OR REPLACE FUNCTION fc_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER 
RETURNS NULL ON NULL INPUT
LANGUAGE SQL 	
AS $$
	SELECT $1 + $2
$$;

-- para executar a função usamos um select
SELECT fc_somar (1, 2);
SELECT fc_somar (100, 2);
SELECT fc_somar (1, null);

CREATE OR REPLACE FUNCTION fc_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER 
CALLED ON NULL INPUT
LANGUAGE SQL 
AS $$
	SELECT $1 + $2
$$;

-- qualquer operação com nulo retorna nulo
SELECT fc_somar (1, null);

-- uma boa prática é o uso do comando COALESCE, que retorna o primeiro dado de uma lista.
SELECT COALESCE (null, 'daniel'); -- retorna daniel
SELECT COALESCE (null, 'daniel', 'digital'); -- retorna daniel 
SELECT COALESCE (null, null, 'digital', 'daniel'); -- retorna digital

-- o comando COALESCE pode servir como um tratamento de erros.

-- dessa forma podemos tratar nossa função para evitar retornar null.

CREATE OR REPLACE FUNCTION fc_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER 
CALLED ON NULL INPUT
LANGUAGE SQL 
AS $$
	SELECT COALESCE($1, 0) + COALESCE($2, 0)
$$;

SELECT fc_somar (1, null);
SELECT fc_somar (null, 1);

-- Função em PLPGSQL ------------------

CREATE OR REPLACE FUNCTION bancos_add(p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
RETURNS INTEGER 
SECURITY INVOKER 
LANGUAGE PLPGSQL 
CALLED ON NULL INPUT 
AS $$ 
DECLARE variavel_id INTEGER;
BEGIN
-- tratamento inserido após primeiro teste e verificado sua necessidade.
	IF p_numero IS NULL OR p_nome IS NULL OR p_ativo IS NULL THEN 
		RETURN 0;
	END IF;
	
	SELECT INTO variavel_id numero
	FROM banco
	WHERE numero = p_numero;
	
	-- segundo tratamento de erros.
	IF variavel_id IS NULL THEN 
		INSERT INTO banco(numero, nome, ativo) 
		VALUES(p_numero, p_nome, p_ativo);
	ELSE 
		RETURN variavel_id;
	END IF;
	-- terceiro tratamento caso o dado seja inserido
	
	SELECT INTO variavel_id numero
	FROM banco
	WHERE numero = p_numero;
	
	RETURN variavel_id;
-- Quando aprendemos transações usavamos COMMIT para finalizar uma transação, agora estamos usando o END, o END é um 
-- alias (apelido) para o comando COMMIT.
END; $$;

-- sendo usado para executar a função
SELECT bancos_add (1, 'Banco Novo', FALSE);
-- o retorno desse comando foi 1 isso significa que o valor 1 para banco já existe.

SELECT bancos_add (5432, 'Banco Novo', FALSE);
-- o retorno foi null, uma recomendação do Daniel é fazer a função aos poucos para identificar os erros facilitando o 
-- processo de debugar, baseado nesse momento será necessário fazer um tratamento.

SELECT bancos_add( 5432, 'Banco Novo', null);
-- retornou 0 e o tratamento de erros está funcionando

SELECT bancos_add( 5432, 'Banco Novo', FALSE);
-- retornou null apesar de inserir o dado mais um tratamento será necessário

-- validando inserção
SELECT numero, nome, ativo FROM banco WHERE numero = 5432;

SELECT bancos_add( 5433, 'Banco Novo em outra porta', true);

-- validando inserção
SELECT numero, nome, ativo FROM banco WHERE numero = 5433;

-- Finalizado a aula muito top mesmo!
-- Gostei demais da aula!!

-- Desafio, fazer uma função para inserir um banco, para inserir agencia, para inserir cliente, para trabalhar com 
-- os tipo de transação para os clientes. haverá um código com exemplos, mas a próxima aula será trabalhado views e 
-- funções.
