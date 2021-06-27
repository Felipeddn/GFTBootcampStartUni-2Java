CREATE ROLE professores NOCREATEDB NOCREATEROLE INHERIT NOLOGIN NOBYPASSRLS CONNECTION LIMIT 10;
-- esses argumentos vem por padrão mas estamos escrevendo para aprendizado.

ALTER ROLE professores PASSWORD '123';

--CREATE ROLE daniel LOGIN PASSWORD '123';

--DROP ROLE daniel;
--CREATE ROLE daniel LOGIN PASSWORD '123' IN ROLE professores;

DROP ROLE daniel;
--CREATE ROLE daniel LOGIN PASSWORD '123' ROLE professores;

-- cria uma tabela
CREATE TABLE teste (nome varchar);

-- Atribui permissões para o grupo professores. 
GRANT ALL ON TABLE teste TO professores;

-- cria o perfil daniel.
CREATE ROLE daniel LOGIN PASSWORD '123';

DROP ROLE daniel;

-- nesse comando o perfil daniel é criado herdando (inherit) as permissões do grupo professores
CREATE ROLE daniel INHERIT LOGIN PASSWORD '123' IN ROLE professores;

REVOKE professores FROM daniel;
