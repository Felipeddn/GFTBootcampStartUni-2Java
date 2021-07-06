-- Uma dúvida que surgiu foi quanto ao uso da sintaxe do SQL usando letras maiúsculas vou mante-la
-- porque percebi que isso torna o código mais legivel apesar de saber que comandos com letras 
-- minusculas funcionam.	

-- Criando tabelas
CREATE TABLE IF NOT EXISTS banco (
	-- numero do banco (funciona como um identificador [id])
	numero INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	-- a linha abaixo é uma boa prática para saber se o banco está ativo ou inativo
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	-- no comando abaixo pode ser usado também now() no lugar do current_timestamp.
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (numero)
);

-- segunda tabela
CREATE TABLE IF NOT EXISTS agencia (
	-- essa linha abaixo é uma foreign key para fazer referência ao número da tabela acima
	banco_numero INTEGER NOT NULL,
	-- O integer da conta de "240 milhões de registros", estamos considerando esse valor por isso é 
	-- importante consultar as definições de tamanho definidas nessa aula apesar de que o que foi 
	-- visto foi a capacidade de armazenar (positivo)+2 bilhões 147 milhões 483 mil 647.
	-- numero da agência (funciona como um identificador [id])
	numero INTEGER NOT NULL,
	-- podemos definir valores pequenos para para nome e se precisarmos aumentar basta usar o comando
	-- ALTER TABLE dessa forma não sobrecarregamos nossa infraestrutura.
	nome VARCHAR(80) NOT NULL,
	-- campos de boas práticas, para verificar se o banco está ativo e para salvar o momento em que
	-- ocorreu o registro.
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	-- no comando abaixo pode ser usado também now() no lugar do current_timestamp.
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (banco_numero, numero),
	FOREIGN KEY (banco_numero) REFERENCES banco (numero)
);
-- observando o comando para gerar o nome de uma chave estrangeira podemos usar a metodologia 
-- nome_do_banco+nome_da_chave_primaria.

-- terceira tabela
-- É uma boa prática separar as tabelas por campos que desejamos visualizar para cada situação
-- "O Daniel vai ter conta em 10 bancos (ele está bem kkk)", por isso devemos separar os dados de 
-- acesso rápido independente se isso gera muitas tabelas, porque assim atualizações e consultas são
-- realizadas de forma mais rápida e os dados ficam agrupado de forma conveniente e podemos usar os 
-- recursos do banco de dados relacionais para juntar informações.

-- Terceira tabela
CREATE TABLE IF NOT EXISTS cliente (
	-- podemos usar o comando PRIMARY KEY tanto no fim da tabela quanto no começo, fica ao critério do
	-- programador. o BIGSERIAL tem o tamanho de pouco mais que 9 quintilhões.
	-- numero do cliente (funciona como um identificador [id])
	numero BIGSERIAL PRIMARY KEY,
	-- o maior nome do mundo tem tamanho de 147 caracteres, se ele quiser ser cliente seu nome irá 
	-- caber com os espaços necessários.
	nome VARCHAR (157),
	email VARCHAR (250),
	-- campos de boas práticas, para verificar se o banco está ativo e para salvar o momento em que
	-- ocorreu o registro.
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	-- no comando abaixo pode ser usado também now() no lugar do current_timestamp.
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- quarta tabela
CREATE TABLE IF NOT EXISTS conta_corrente (
	-- uma conta corrente precisa estar associada a um banco
	banco_numero INTEGER NOT NULL,
	-- uma conta corrente precisa estar associada a uma agência
	agencia_numero INTEGER NOT NULL,
	-- numero da conta corrente (funciona como um identificador [id])
	numero BIGINT NOT NULL,
	digito SMALLINT NOT NULL,
	cliente_numero BIGINT NOT NULL,
	-- campos de controle, boa prática
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	-- a primary key está grande mas ela segue a normalização o que garante a integridade, apesar de 
	-- ser uma prática do mercado para criar uma chave primaria pequena.
	PRIMARY KEY (banco_numero, agencia_numero, numero, digito, cliente_numero),
	-- Esse aqui ficou confuso, mas pelo o que eu entendi quando uma foreign key faz referência 
	-- uma foreygn key que faz referência a uma primary key com dois campos precisa fazer referência
	-- a esses campos. então é obrigatória colocar os dois numeros no caso da nossa tabela 
	-- banco_numero é o primeiro campo e agencia_numero faz referência ao numero na primary key da 
	-- tabela agência.
	FOREIGN KEY (banco_numero, agencia_numero) REFERENCES agencia (banco_numero, numero),
	FOREIGN KEY (cliente_numero) REFERENCES cliente (numero)
);

-- quinta tabela
CREATE TABLE IF NOT EXISTS tipo_transacao (
	-- porque não existirá muitos tipos de transações
	id SMALLSERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	-- campos de controle, boa prática
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- sexta e ultima tabela.
CREATE TABLE IF NOT EXISTS cliente_transacoes (
	-- BIGSERIAL Porque haverá muitas transações
	id BIGSERIAL PRIMARY KEY,
	-- esse tipo de transação tem relação com a conta corrente por isso vamos precisar gerar um 
	-- vinculo atráves de uma referência
	banco_numero INTEGER NOT NULL,
	agencia_numero INTEGER NOT NULL,
	conta_corrente_numero BIGINT NOT NULL,
	conta_corrente_digito SMALLINT NOT NULL,
	cliente_numero BIGINT NOT NULL,
	tipo_transacao_id SMALLINT NOT NULL,
	-- esse valor pode ter 15 campos de valores inteiros e dois campos dos valores decimais.
	valor NUMERIC(15,2) NOT NULL,
	-- nessa tabela o campo ativo é dispensavel
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY 
	(banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero) 
	REFERENCES 
	-- lembrando que se a gente faz refência a primary key composta devemos ter todos esses campos
	-- compostos representados.
	conta_corrente (banco_numero, agencia_numero, numero, digito, cliente_numero)
);

-- com as tabelas criadas irei inserir os dados primeiro para depois inserir dados contido no link
-- apresentado na aula. github.com/drobcosta/digital_innovation_one

-- minhas tentativas estão em um arquivo separado chamado 

