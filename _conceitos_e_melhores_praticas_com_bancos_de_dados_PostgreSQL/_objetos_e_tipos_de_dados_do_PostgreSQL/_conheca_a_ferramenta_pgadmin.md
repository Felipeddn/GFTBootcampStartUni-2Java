# Conheça a ferramenta PGAdmin4 - aula 2 - Daniel Robert Costa

## Objetivos da aula 

1. Visão geral do PGAdmin4 
2. Configurar o acesso ao servidor PostgreSQL
3. Visão geral do cluster e nosso primeiro comando

A primeira conexão entre o PGAdmin4 e o PostgreSQL costuma trazer problemas e alguns passos que devemos verificar para mitigar essa 
situação é:

1. Liberar acesso ao cluster em postgresql.conf
2. Liberar acesso ao cluster para o usuário do banco de dados em pg_hba.conf
3. Criar/editar usuários

O primeiro arquivo que iremos editar é o postgresql.conf

No Ubuntu ele fica localizado no diretório etc/postgresql/versao/nome_do_cluster

iremos editar esse arquivo no tópico connections e authentication

Na configuração listen_addresses mudando a valor 'localhost' para '*', lembrando que esse comando libera o banco de dados para qualquer 
pessoa acessar, isso em produção é totalmente inseguro e nunca deve ser feito, fazemos isso apenas em ambiente de desenvolvimento ou para
fins de aprendizado.

Agora podemos fazer a conexão com o banco de dados através dos comandos:  
**psql**  

No Windows basta usar o prompt do comando para o caminho do binário ou adicionar o diretório ao path para usar o comando como no linux.

O comando psql aceita alguns argumentos como:  
-h (endereço host do banco de dados) 127.0.0.1 
-p (porta) 5432
-U postgres 

Esses parametros são padrões e serão subententidos caso não seja digitado  
o ultimo parametro é o banco de dados que se for ocultado será conectado ao banco de dados do usuário.

Agora podemos executar o comando SELECT 1; (precisa ser em maiúsculo senão retorna erro).

No Windows durante a instalação ele solicita uma senha para o usuario master. No demais sistemas operacionais podemos fazer isso com o 
comando abaixo:  
**ALTER USER nome_de_usuario PASSWORD 'senha';**

Se tudo tiver ocorrido ok retorna ALTER ROLE.

Após a configuração da senha precisamos editar o arquivo pg_hba.conf

Agora iremos configurar os campos nas seguintes linhas:

# Database administrative login by Unix domain socket
local   all             postgres                               peer

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     peer

# replication privilege.
local   replication     all                                     peer

Como estamos usando a conexão local iremos modificar apenas as linhas local mudando o valor peer para md5: 

# Database administrative login by Unix domain socket
local   all             postgres                                <span style="color: red;">md5</span>

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     <span style="color: red;">md5</span>

local   replication     all                                     <span style="color: red;">md5</span>

Após essas configurações podemos usar o comando reload para atualizar as configurações:  
**pg_ctlcluster versão nome_do_cluster reload**

dessa forma o down time é minímo, down time é o tempo que o banco de dados não está dísponível.

Assim as configurações realizadas serão aplicadas e agora para acessar os bancos de dados precisamos usar a senha do usuário.

## Trabalhando com o PGAdmin4

A interface do PGAdmin4 Tem diversas opções disponíveis:

Dashboard (painel de controle) -> Um painel onde podemos verificar diversas informações do que está ocorrendo em nosso banco de dados.

Properties -> Informa sobre as propriedades dos objetos selecionados no menu do lado esquerdo.

SQL -> uma área que podemos digitar nossos comandos de structured query language (SQL), para fazer todo tipo de controle no banco de dados.

Statistics -> informações estatísticas dos objetos selecionados no menu do lado esquerdo.

Dependencies -> dependências do objeto.

Dependente -> objetos dependente do objeto selecionado.

No menu do programa temos as opções:

File
* Preferências -> 
* Reset layout  - para trabalhar com a aparência do PGAdmin
* Lock layout   - para trabalhar com a aparência do PGAdmin
