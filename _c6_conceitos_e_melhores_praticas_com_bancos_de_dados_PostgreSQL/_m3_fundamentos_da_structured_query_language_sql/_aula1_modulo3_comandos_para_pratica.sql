CREATE TABLE IF NOT EXISTS teste (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS teste;

CREATE TABLE IF NOT EXISTS teste (
	cpf VARCHAR(11) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (cpf)
);

-- sem boas práticas.
INSERT INTO teste (cpf, nome, created_at) VALUES
('22344566712', 'Jose Colmeia', '2019-07-01 12:00:00');

-- com boas práticas
INSERT INTO teste (cpf, nome, created_at) VALUES
('22344566712', 'Jose Colmeia', '2019-07-01 12:00:00') ON CONFLICT (cpf) DO NOTHING;

UPDATE teste SET nome = 'Pedro Alvares' WHERE cpf = '22344566712';

SELECT * FROM teste;
