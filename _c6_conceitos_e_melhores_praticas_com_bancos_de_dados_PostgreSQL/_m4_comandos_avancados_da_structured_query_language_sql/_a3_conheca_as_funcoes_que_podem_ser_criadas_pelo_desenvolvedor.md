# Aula 3 - Conheça as funções que podem ser criadas pelo desenvolvedor - Daniel Robert Costa

## Objetivo da aula 

* Abordar sobre funções

Funções são um conjunto de códigos que são executadas **dentro de uma transação** com a finalidade de facilitar a programação e obter o 
reaproveitamento/reutilização de códigos.

Nem todas as funções tem o recurso de trabalhar com transações, por isso opte por funções que tem a possibilidade de trabalhar com transações.

Existem 4 tipos de funções 

* Query language functions (funções escritas em SQL)   
* Procedural language functions (funções escritas em PL/pgSQL ou PL/py, por exemplo)   
* Internal functions   
* C-language functions

Porém, o foco será em USER DEFINED FUNCTIONS. Funções que podem ser criadas pelo usuário.

As funções que os usuários podem criar são:

**Linguagens**

* SQL   
* **PL/PGSQL** - Focaremos nessa linguagem.      
* PL/PY   
* PL/PHP   
* PL/RUBY   
* PL/JAVA   
* PL/LUA   
* ....

O PostgreSQL permite escrever essas funções nas linguagens citadas acima e pode ser conferido no link abaixo mais sobre o assunto.

https://www.postgresql.org/docs/13/external-pl.html	

Esse link trata dos diversos assuntos tratados na aula basta navegar pelas opções para entender melhor.   

https://www.postgresql.org/docs/13/xfunc-sql.html

Comando para criar funções 

CREATE [OR REPLACE] FUNCTION 
    *nome_da_função* ([*argmode*][*argname*]*argtype*[{DEFAULT | =} *default_expr*][,...])   
    [RETURN *rettype*    
     | RETURNS TABLE (*column_name* *column_type* [,...])]    
  { LANGUAGE *lang_name*    
    | TRANSFORM { FOR TYPE *type_name* } [,...]    
    | WINDOW     
    | IMMUTABLE | STABLE | VOLATILE | [ NOT ] LEAKPROOF    
    | CALLED ON NULL INPUT | RETURN NULL ON NULL INPUT | STRICT    
    | [ EXTERNAL ] SECURITY INVOKER | [ EXTERNAL ] SECURITY DEFINER   
    | PARALLEL { UNSAFE | RESTRICTED | SAFE }    
    | COST *execution_cost*       
    | ROWS *result_rows*     
    | SET configuration_parameter { TO *value* | = *value* | FROM CURRENT }   
    | AS '*definition*'   
    | AS '*obj_file*', '*link_symbol*'   
  }

A Idempotência das funções se faz com o comando "OR REPLACE"

CREATE **OR REPLACE** FUNCTION [nome da função] 

* Mesmo nome   
* Mesmo tipo de retorno   
* Mesmo número de parâmetros / argumentos

RETURNS 

* Tipos de retornos (data type)   
 * INTEGER   
 * CHAR / VARCHAR   
 * BOOLEAN   
 * ROW   
 * TABLE   
 * JSON  

LANGUAGE 

* **SQL**      
* **PLPGSQL**    
* PLJAVA   
* PLPY   
* ...

SEGURANÇA 

* SECURITY   
 * INVOKER (é o padrão)   
Os comandos da função é equivalente as permissões do usuário que está executando a função, exemplo: um usuário que executa uma função que possui um 
insert e esse usuário não possui permissão para realizar inserts receberá um erro ao executar a função.   
 * DEFINER  
A função herda as autorizações do usuário que criou a função, exemplo: se a função foi criada por um superusuário e quem executa a função não possui 
autorizações de superusuário mesmo assim a função será executada como se o usuário fosse um superusuário. Necessário para algumas ações mas deve ser 
utilizado com cuidado. 

COMPORTAMENTO DAS FUNÇÕES 

* IMMUTABLE      
Não pode alterar o banco de dados. Funções que garantem o mesmo resultado para os mesmos argumentos/parâmetros da função. Evitar a utilização de 
selects, pois tabelas podem sofrer alterações.   
* STABLE   
Não pode alterar o banco de dados. Funções que garantem o mesmo resultado para os mesmos argumentos/parâmetros da função. Trabalha melhor com tipos 
variáveis. Podem conter selects.   
* VOLLATILE   
Comportamento padrão. Aceita todos os cenários.

SEGURANÇA E BOAS PRÁTICAS 

* CALLED ON NULL INPUT   
Padrão. Se qualquer um dos parâmetros/argumentos for NULL, a função será executada. As documentações recomenda esse pois é responsabilidade do 
programador e também uma boa prática que ele faça o tratamento dos dados inseridos.

* RETURNS NULL ON NULL INPUT  
Se qualquer um dos parâmetros/argumentos for NULL, a função retornará NULL. Caso o programador não deseja fazer o tratamento dos dados essa opção 
deve ser usada. 

SEGURANÇA E BOAS PRÁTICAS 

* SECURITY INVOKER    
Padrão. A função é executada com permissões de quem executa.

* SECURITY DEFINER   
A função é executada com permissões de quem criou a função.

RECURSOS 

* COST    
Custo/row em unidades de CPU. 

* ROW    
Número estimados de linhas que será analisada pelo planner.

Podemos mexer nesses parametros para controlar o uso de recurso e as performances desejadas na definição das funções.

SQL FUNCTIONS   

Não é possível utilizar **TRANSAÇÕES**.

-- função sem nomear os parâmetros.   
CREATE OR REPLACE FUNCTION fc_somar (INTEGER, INTEGER)   
RETURNS INTEGER   
LANGUAGE SQL   
AS $$   
    SELECT $1 + $2;   
$$;   

-- O conteúdo entre o dolar/dolar ($$) é o que será executado na função.
-- Para linguagem definida como SQL (LANGUAGE SQL) devemos usar o SELECT como o retorno da função.

-- função com parâmetros nomeados. Considerado uma boa prática nesse formato   
CREATE OR REPLACE FUNCTION fc_somar (num1 INTEGER, num2 INTEGER)   
RETURNS INTEGER   
LANGUAGE SQL   
AS $$ 
    SELECT num1 + num2   
$$;

CREATE OR REPLACE FUNCTION fc_bancos_add(p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)   
RETURNS TABLE (numero INTEGER, nome VARCHAR)   
RETURNS NULL ON NULL INPUT   
LANGUAGE SQL   
AS $$   
	INSERT INTO banco (numero, nome, ativo)   
	VALUES (p_numero, p_nome, p_ativo);

	SELECT numero, nome   
	FROM banco   
	WHERE numero = p_numero;
$$; 

PLPGSQL 

CREATE OR REPLACE FUNCTION banco_add(p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)   
RETURNS BOOLEAN     
LANGUAGE PLPGSQL    
AS $$   
DECLARE variavel_id INTEGER;   
BEGIN    
	SELECT INTO variavel_id numero FROM banco WHERE nome = p_nome;   

	IF variavel_id IS NULL THEN    
		INSERT INTO banco (numero, nome, ativo) VALUES (p_numero, p_nome, p_ativo)   
	ELSE   
		RETURN FALSE;   
	END IF;   

	SELECT INTO variavel_id numero FROM banco WHERE nome = p_nome;   
 
	IF variavel_id IS NULL THEN   
		RETURN FALSE;   
	ELSE   
		RETURN TRUE;    
	END IF;   
END; $$;   

SELECT banco_add(13, 'Banco azarado', true);

Agora o momento feliz o mão na massa!! para fixar os conceitos e garantir o aprendizado.

Os comandos SQL práticados estarão no arquivo `_aula3_modulo4_comandos_praticados_na_aula.sql`

Fim da aula.
