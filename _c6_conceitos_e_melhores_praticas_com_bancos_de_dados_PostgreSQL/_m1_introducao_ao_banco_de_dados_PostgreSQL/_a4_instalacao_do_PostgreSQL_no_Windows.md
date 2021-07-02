# Intalação do PostgreSQL no Windows - aula 4 - Daniel Robert Costa

Site oficial do PostgreSQL

https://www.postgresql.org/download/windows/

site da EDB Postgres

https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

Instalação no Windows é iniciar o instalador e seguir as intruções selecionando as opções.

A primeira opção é para escolher o diretório de instalação.

A segunda opção é para escolher quais componentes devem ser instalados.

selecione todos: PostgreSQL Server, pgAdmin4, Stack builder, Command Line Tools

A terceira opção é sobre o armazenamento dos dados, então devemos escolher uma pasta para isso.

A quarta configuração é a senha do usuario PostgreSQL para acessar bancos de dados.

A quinta opção é a Porta de uso do PostgreSQL deixe a padrão mesmo `5432`.

A sexta é sobre as opções avançadas e deve ser selecionada Default locale.

next e next para iniciar a instalação

Podemos interagir com o PostgreSQL de diversos sistemas operacionais.

Podemos configurar o banco de dados para iniciar automáticamente ou para não iniciar automáticamente, para o ambiente de "produção" (Ambiente onde fica armazenados os projetos web) é interessante que o banco de dados inicie automáticamente já para um ambiente de desenvolvimento o controle manual é mais interessante.

Para visualizar os processos do Postgre digitamos no campo de pesquisas do windows Services (Serviços).Nesse momento também podemos configurar a inicialização manual selecionando o serviço do PostgreSQL apertando com o botão direito escolhemos propriedades e mudamos no tipo de inicialização para manual ou automática.

A instalação do Windows permite instalar todos os pacotes em uma única instalação já nas instalações de Linux usamos diversos pacotes, o PostgreSQL é uma ferramenta web que abre no navegador.
