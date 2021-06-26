# O que é o arquivo postqresql.conf - aula 1 - Daniel Robert Costa

## O que é o arquivo postgresql.conf ? </br>
É o arquivo onde estão definidas e armazenadas todas as configurações do servidor PostgreSQL.   
Alguns parâmetros só podem ser alterados com uma reinicialização dos bancos de dados.   
A view pg_settings, acessado por dentro do banco de dados, guarda todas as configurações atuais.

Ao acessar a view pg_settings, é possível visualizar todas as configurações atuais com o comando: </br>
**SELECT name, settings**
**FROM pg_settings;**

Ou usando o comando dentro do banco de dados: </br>
**SHOW [parâmetro];**

No CentOS eu encontrei ele nesse local: </br>
var/lib/pgsql/versao/data/postgresql.conf

No Ubuntu encontrei esse arquivo no seguinte caminho: </br>
/etc/postgresql/versao/nome_do_cluster/posgresql.conf

essa parte da aula 1 é importante para a aula 2 também.

`anotações abaixo realizadas no Linux Ubuntu`

### Configurações das conexões 

* LISTEN_ADDRESSES

Endereços(s) TCP/IP das interfaces que o servidor PostgreSQL vai escutar/liberar conexões.

* PORT

A porta TCP que o servidor PostgreSQL vai ouvir. O padrão é 5432.

* MAX_CONNECTIONS

Número máximo de conexões simultâneas no servidor PostgreSQL.  
"As conexões usam recursos do servidor por isso deve ser feito um controle baseado nos seus recursos computacionais para verificar quantas
conexões serão permitidas".

* SUPERUSER_RESERVERD_CONNECTIONS

Número de conexões (slots) reservadas para conexões ao banco de dados de superusuários. 
"Caso o limite de max connections seja atinginda ainda sim haverá algumas conexões livres para o superusuário."

### Configurações de autenticação

* AUTHENTICATION_TIMEOUT

Tempo máximo em segundos para o cliente conseguir uma conexão com o servidor.

* PASSWORD_ENCRYPTION

Algoritmo de criptografia das senhas dos novos usuários criados no banco de dados.

* SSL

Habilita a conexão criptografada por SSL (somente se o PostgreSQL foi compilado com suporte SSL)  
"Em tempos de LGPD criar metodologias de segurança para acesso de dados é uma política interessante de proteção de dados."

### Configurações de memória

* SHARED_BUFFERS

Tamanho da memória compartilhada do servidor PostgreSQL para cache/buffer de tabelas, indíces e demais relações.  
"Tudo que executa em disco é mais lento que o que executa em memória, por isso o Postgre pode armazenar alguns dados na memória da máquina
para melhorar o desempenho dos acessos. Não adianta configurar o máximo de memória para o PostgreSQL, por que aqui é importante um equilíbrio."

* WORK_MEM

Tamanho da memória para operações de agrupamento e ordenação (ORDER BY, DISTINCT, MERGE JOINS)  
"É uma memória exclusiva para operações de agrupamento e ordenações, o PostgreSQL separa uma parte da memória exclusivamente para esse tipo
de operações. "

* MAINTENENCE_WORK_MEM

Tamanho da memória para operações como VACCUM, INDEX, ALTER TABLE.  
"Memória exclusiva para operações administrativa do banco de dados.Então quando um objeto muito grande for criado podemos modificar essa 
configuração para melhorar o desempenho do banco de dados em relação a esse objeto e depois retomar uma configuração para objetos mais cotidianos, esse comportamento é recomendável para deixar a operação mais rápida."

antes de seguir para o próximo tópico veremos o arquivo postgresql.conf

Primeiro acesse o usuario postgres com o comando:
**sudo -u postgres -i**

caminhe até o diretório que contem o arquivo:

etc/postgresql/[versao_do_postgresql]/[nome_do_cluster]/postgresql.conf

Olhando esse arquivo podemos ver as configurações e valores

Ás vezes para acessar os bancos de dados com maior facilidade usamos * na configuração listen_addresses, isso permite qualquer pessoa 
acessar os bancos de dados o que é muito perigoso, por esse motivo fazer isso só é recomendado se existe a certeza de que o ambiente é 
apropriado para tal configuração. Para estudos essa é uma opção válida.

## O arquivo pg_hba.conf

Arquivo responsável pelo controle de autenticação dos usuários no servidor PostSQL.  
o formato do arquivo pode ser:
local      database  user  auth-method  [auto-options]
host       database  user  address  auth-method  [auto-options] 
hostssl    database  user  address  auth-method  [auto-options]
hostnossl  database  user  address  auth-method  [auto-options]
host       database  user  IP-address  IP-mask  auth-method  [auto-options]
hostssl    database  user  IP-address  IP-mask  auth-method  [auto-options]
hostnossl  database  user  IP-address  IP-mask  auth-method  [auto-options]

"Essa arquivo que controla quem pode acessar, de onde pode acessar, qual IP deve ser usado para poder acessar, quais bancos de dados podem
ser acessados pelo IP e usuário, por exemplo se um grupo cadastro como vendas, com o alcance de IP específico, esse grupo pode acessar 
determinadas tabelas relacionadas ao seu trabalho, já outro grupo definido como consultoria, pode acessar com determinado IP, com senhas 
criptografadas, garantindo assim uma política de segurança bem aplicada".

"Os formatos acima é para entender o local ou endereço (host) de quem está acessando qual banco de dados (database) e qual usuário (user) 
está fazendo essa conexão".

hostssl é para uma conexão com ssl 
o hostnossl não requisita a criptografia da conexão.

## Métodos de autenticação 

* TRUST (conexão sem requisição de senha)
* REJECT (rejeitar conexões)
* MD5 (criptografia do tipo md5)
* PASSWORD (senha sem criptografia)
* GSS (generic security service application program interface)
* SSPI (security support provider interface - somente para Windows)
* KRB5 (kerberos V5)
* IDENT (utiliza o usuário do sistema operacional do client via ident server)
* PEER (utiliza o usuário do sistema operacional do cliente)
* LDAP (ldap server)
* RADIUS (radius server)
* CERT (autenticação via certificado ssl do cliente)
* PAM (pluggable authentication modules. O usuário precisa estar no banco...)

Olhando por dentro desse documento podemos ver que na "sua" máquina você tem acesso a todos os bancos de dados, com qualquer usuário, uma
segunda configuração é sobre quem tem acesso ao recurso de backup para os bancos de dados.

## Arquivo pg_ident.conf

Arquivo responsável por mapear os usuários do sistema operacional com os usuários do banco de dados.  
Fica localizado no diretório de dados PGDATA de sua instalação.  
A opção ident deve ser utilizada no arquivo pg_ident.conf.

Esse arquivo gera identificação através de mapeamento de arquivos. com os 3 principais campo, que seguem no exemplo:  
#MAPNAME    SYSTEM-USERNAME  PG-USERNAME
diretoria   daniel           pg_diretoria
comercial   tiburcio         pg_comercial
comercial   valdeci          pg_comercial

dessa forma foi mapeado a diretoria que possui o usuário daniel, no sistema operacional, que ao acessar os bancos de dado acessa como 
usuário pg_diretoria.

Outro exemplo de mapeamento é do comercial que possui os usuários tiburcio e valdeci no sistema operacional que acessa os bancos de dados 
como pg_comercial.

## Comandos administrativo

### Ubuntu 

* pg_lsclusters
lista todos os clusters PostgreSQL

* pg_createclusters <versão> <cluster name>
cria um novo cluster PostgreSQL

* pg_dropcluster <versão> <cluster>
Apaga um cluster PostgreSQL

* pg_ctlcluster <versão> <cluster> <action>
start, stop, status, restart de cluster PostgreSQL

## CentOS

* systemctl <action> <cluster> 
Inicia o cluster PostgreSQL

 * systemctl start postgresql-11
   Inicia o cluster PostgreSQL 

 * systemctl status postgresql-11
   mostra o status do cluster PostgreSQL

 * systemctl stop postgresql-11
   Para o cluster PostgreSQL 

 * systemctl restart postgresql-11
   Restarta o cluster PostgreSQL

## Windows

Deve-se localizar a operação em serviços no Windows e clicar com o botão direito na parte de status e abrirá uma janela com diversas 
opções, todos os comandos do banco de dados pode ser selecionado através da interface gráfica.

## Binários do PostgreSQL
Quando a instalação acontece de forma compilada, os comandos binários segue abaixo, esses comandos podem ser realizados através do próprio
sistema operacional:

* createdb   
Comando que cria um banco de dados.  
* createuser  
Cria usuário  
* dropdb  
Apaga um banco de dados  
* dropuser  
Apaga um usuário  
* initdb  
Inicia um novo cluster com todos os diretórios necessários.
* pg_ctl  
Comando que controla o banco de dados com o start, status, stop, restart  
* pg_basebackup  
Inicia um backup no banco de dados  
* pg_dump / pg_dumpall
Faz um "pseudo backup", "dump não é backup", apenas gera um arquivo do momento do banco de dados, para diversos usos mas não para restaurar
banco de dados.  
* pg_restore  
Serve para restaurar os arquivos gerados com dump / dumpall  
* psql  
Comando para entrar no banco de dados via sistema operacional.  
* reindexdb  
para fazer um reindex(?).
* vacuumdb  
Para executar um vacuum no seu banco de dados, para reorganizar as tabelas.

## Arquitetura / hierarquia

### Cluster

É uma coleção de banco de dados que compartilham as mesmas configurações (arquivos de configuração) do PostgreSQL e do sistema operacional
(porta, listen_addresses, etc.)

"Quando criamos um cluster criamos uma instalação completa para dar suporte aos bancos de dados e podemos criar diversos bancos de dados 
para ser usado em diversas portas, dessa forma podemos ter diversas portas do computador executando diversos bancos de dados."

### Banco de dados (database)

Conjunto de schemas com seus objetos/relações (tabelas, funções, views, etc)."É possível ter dentro dos cluster diversos bancos de dados".

### Schema

Conjuntos de objetos/relações (tabelas, funções, views, etc.)
É necessário uma certa atenção porque o MySQL interpreta o Schema como um banco de dados, por isso é importante entender isso para não 
gerar confusão.
