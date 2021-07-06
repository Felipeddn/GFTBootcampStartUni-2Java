# Como administrar usuários no banco de dados - aula 3 - Daniel Robert Costa 

`anotações realizadas no CentOS` 

## Objetivos da aula 

1. Conceitos users/roles/groups
2. AdministraNdo users/roles/groups
3. Administrando acessos (GRANT)

## Conceitos 

### Users/roles/groups

Definição: </br>
Roles (papéis ou funções), users (usuários) e grupo de usuários são "contas", perfis de atuação em um banco de dados, que possuem permissões em 
comum ou específicas.

Nas versões anteriores do PostgreSQL 8.1, usuários e roles tinham comportamentos diferentes.

Atualmente, roles e users são alias (apelidos).

É possível que roles pertençam a outros roles;

"Quanto falamos de users e roles o conceito é o mesmo".

Imaginemos os seguintes exemplos é criado uma role em um banco de dados nomeada administradores com permissões ilimitadas para criar, atualizar, 
inserir e excluir tabelas. </br>
Agora é criada uma nova role chamada professores porem com permissões mais restritas onde pode modificar duas tabelas e ler todas as demais. </br>
E por fim uma nova role alunos que pode apenas ler as tabelas. </br>

Agora são criados duas roles uma chamada Daniel outra chamada de Robert, porém sem nenhuma permissão. Mas quando são inseridas na role professores 
passam a ter as permissões de professores.

Se criado uma terceira role chamada Gumercindo e ele é inserido na role dos alunos ela passa a ter as mesmas permissões dos alunos. De ler diversas 
tabelas.

Assim que fazemos a gestão de roles de permissões e de usuários em cada permissão.

## Administrando users/roles/groups

CREATE ROLE name [[WITH]option[...]]  </br>
definimos um nome e as opções nesse comando.

where options can be (tradução: onde as opções podem ser): 

SUPERUSER | NOSUPERUSER  </br>
Aqui definimos se a role permitirá ser superusuária ou não superusuária, ser superusuário concede permissões bastante poderosas, por conta disso essa 
opção deve ser usada com cautela, só quando for necessário crie um perfil com essa opção, o padrão costuma ser NOSUPERUSER.  </br>

|CREATEDB | NOCREATEDB   </br>
A role pode criar um banco de dados ou ela não pode criar.  </br>

|CREATEROLE | NOCREATEROLE   </br>
Se a role pode criar nova roles ou não pode, por padrão ela deve ser NOCREATEROLE.   </br>

|INHERIT | NOINHERIT   </br>
Isso é sobre a herança de roles, se ela pode herdar as permissões uma role INHERIT herda as permissões do grupo que ela foi inserida, ja roles 
que tem a opção NOINHERIT pode ser até inserida em um grupo mas ela não herda as permissões.

|LOGIN | NOLOGIN   </br>
Essa opção é sobre a permissão de se conectar no banco de dados.

|REPLICATION | NOREPLICATION   </br>
Trata das possibilidades de replicar ou não os bancos de dados.

|BYPASSRLS | NOBYPASSRLS   </br>
Trata sobre a segurança.

|CONNECTION LIMIT connlimit  </br>
Define quantas conexões simultâneas a role pode ter no banco de dados.

|[ENCRYPTED] PASSWORD 'password' | PASSWORD NULL  </br>
Define se o password pode ou não ser encriptográfado. Ele é mais usado quando fazemos operações do banco de dados via terminal.

|VALID UNTIL 'timestamp'  </br>
Isso é para controlar até que data a role tem acesso ao banco de dados. 

|IN ROLE role_name [...]   </br>
In role insere um usuário em um grupo já existentes de papéis. então ele insere o novo usuário em uma hieraquia que já existe.

|IN GROUP role_name [...]   </br>
essa opção está depreciada. atualmente é usado IN ROLE.

|ROLE role_name [...]   </br>
Role define um novo grupo para um grupo que já existe. Cria uma nova hierarquia para um grupo que já existe.

|ADMIN role_name [...]   </br>
Ela determina que as roles existentes serão adicionadas as novas roles com acessos administrativos, ou seja, pode incluir e excluir novas roles.

|USER role_name [...]   </br>
Está depreciada e usamos In role para ela.

|SYSID uid   </br>
Está depreciada. mas existe por conta de compatibilidade.

Agora baseado nos exemplos do início do vídeo se fossemos criar os perfis usado como exemplos eles assumiriam as seguintes características no 
momento de sua criação.

CREATE ROLE administradores </br>
CREATE DB </br>
CREATE ROLE  </br>
INHERIT  </br>
NOLOGIN  </br>
REPLICATION  </br>
BYPASSRLS  </br>
CONNECTION LIMIT -1;

Esse perfil pode, criar banco de dados, criar perfis, herda características de grupo que fizer parte, não pode se conectar ao banco de dados pode 
replicar o banco de dados, "vai fazer um bypass no row leve security"(?) e poderá fazer conexão ilimitadas (podemos colocar 1 ao invés de -1)


CREATE ROLE professores
NOCREATE DB
NOCREATE ROLE 
INHERIT
NOLOGIN
NOBYPASSRLS
CONNECTION LIMIT 10;

Esse perfil não pode criar banco de dados, não pode criar perfis, herda características de grupo que fizer parte, não pode se conectar ao banco de dados 
"vai fazer um bypass no row level sercurity"(?) e poderá fazer até 10 conexões.

CREATE ROLE alunos
NOCREATE DB
NOCREATE ROLE 
INHERIT
NOLOGIN
NOBYPASSRLS
CONNECTION LIMIT 90;

Esse perfil não pode criar banco de dados, não pode criar perfis, herda características de grupo que fizer parte, não pode se conectar ao banco de dados 
"vai fazer um bypass no row level sercurity"(?) e poderá fazer até 90 conexões.

Associação entre roles </br>
É quando uma role assume as permissões de outra role.  </br>
Para poder realizar essas associações é necessário a opção INHERIT. Sem isso elas não passam a receber as características.

No momento da criação da role:  </br>
* **IN ROLE** (passa a pertencer a role informada)  </br>
* **ROLE** (a role informada passa a pertencer a nova role)  </br>


OU após a criação da ROLE:  </br>
* GRANT [role a ser concedida] TO [role a assumir as permissões]  </br>
para usar esse comando pense na seguinte situação, é criado um usuário Daniel porém ele não foi inserido no grupo professores por distração para 
inserir ele no grupo professores fazemos o comando `GRANT professores TO daniel`. caso seja feito o comando `GRANT daniel TO professores` os 
grupo professores passará a fazer parte do grupo daniel.

Um exemplo de comando para fazer associações entre roles. 

CREATE ROLE professores   </br>
 NOCREATEDB    </br>
 NOCREATEROLE   </br>
 INHERIT   </br> 
 NOLOGIN   </br>
 NOBYPASSRLS   </br>
 CONNECTIONS LIMITS -1;

CREATE ROLE daniel LOGIN CONNECTIONS LIMIT 1 PASSWORD '123' **IN ROLE** professores;  </br>
A role daniel passa a assumir as permissões da role professores.

CREATE ROLE daniel LOGIN CONNECTIONS LIMIT 1 PASSWORD '123' **ROLE** professores;  </br>
A role professores passa a fazer parte da role daniel assumindo suas permissões 

CREATE ROLE daniel LOGIN CONNECTIONS LIMIT 1 PASSWORD '123'   </br>
GRANT professores TO daniel;

Desassociar membros entre roles

REVOKE [role que será revogada] FROM [role que terá suas permissões revogadas]

REVOKE professores FROM daniel;

Nesse caso o daniel não fará mais parte de professores e perderá as permissões de professores.

Alterando uma role

ALTER ROLE role_specification [[WITH] options [...]]

where option can be (tradução: onde a opção pode ser):


SUPERUSER | NOSUPERUSER  </br>
Aqui definimos se a role permitirá ser superusuária ou não superusuária, ser superusuário concede permissões bastante poderosas, por conta disso essa 
opção deve ser usada com cautela, só quando for necessário crie um perfil com essa opção, o padrão costuma ser NOSUPERUSER.  </br>

|CREATEDB | NOCREATEDB   </br>
A role pode criar um banco de dados ou ela não pode criar.  </br>

|CREATEROLE | NOCREATEROLE   </br>
Se a role pode criar nova roles ou não pode, por padrão ela deve ser NOCREATEROLE.   </br>

|INHERIT | NOINHERIT   </br>
Isso é sobre a herança de roles, se ela pode herdar as permissões uma role INHERIT herda as permissões do grupo que ela foi inserida, ja roles 
que tem a opção NOINHERIT pode ser até inserida em um grupo mas ela não herda as permissões.

|LOGIN | NOLOGIN   </br>
Essa opção é sobre a permissão de se conectar no banco de dados.

|REPLICATION | NOREPLICATION   </br>
Trata das possibilidades de replicar ou não os bancos de dados.

|BYPASSRLS | NOBYPASSRLS   </br>
Trata sobre a segurança.

|CONNECTION LIMIT connlimit  </br>
Define quantas conexões simultâneas a role pode ter no banco de dados.

|[ENCRYPTED] PASSWORD 'password' | PASSWORD NULL  </br>
Define se o password pode ou não ser encriptográfado. Ele é mais usado quando fazemos operações do banco de dados via terminal.

|VALID UNTIL 'timestamp'  </br>
Isso é para controlar até que data a role tem acesso ao banco de dados.

Excluíndo uma role.
DROP ROLE role_specifications;

Por exemplo: </br>
DROP ROLE daniel;

Isso excluíra esse perfil.

Mão na massa.

Usamos o PGAdmin4 para criar nossa ROLE.

agora vamos verificar se o ROLE foi criado através do terminal com os comandos:  </br>

acessamos o usuário postgres com o comando:  </br>
**sudo -u postgres -i**

**psql**  </br>
para se conectar ao banco de dados, no meu caso não solicitou a senha então precisamos verificar a aula 2 para entender o que houve com a 
configuração de senhas.

existe duas formas de ver as roles após conectado no banco de dados são elas:  </br>
**\du**  </br>
ou  </br>
**SELECT * FROM pg_roles;**

Agora voltamos para o PGAdmin4 e fizemos alterações nas roles.  </br>

depois voltamos para o terminal e tentamos logar com o perfil do professor  </br>
**psql -U role database_name**  </br>
**psql -U professores auladb** 

além de ter retornado por 3 vezes essa mensagem estranha ao qual pretendo resolver com o link abaixo nem perguntou a senha:  </br>
psql: /usr/pgsql-13/lib/libpq.so.5: no version information available (required by psql)

https://dba.stackexchange.com/questions/269473/what-does-psql-usr-pgsql-11-lib-libpq-so-5-no-version-information-available

porém ele retornou a mensagem:  </br>
psql: error: FATAL:  role "professores" is not permitted to log in

Acessamos com o postgres e executamos o comando:  </br>
**\du**

Voltamos para o PGAdmin e criamos uma nova role.

voltamos para o terminal e verificamos a criação dessa nova role:  </br>
**\du**

No PGAdmin excluímos o role daniel e criamos ele com o comando IN ROLE associando ao professores.

No terminal fizemos o comando para verificar a relação dos roles:  </br>
**\du**

O comando acima retornou:  </br>
Role name  |                         Attributes                         |   Member of   
-------------+------------------------------------------------------------+---------------
 daniel      |                                                            | {professores}


No PGAdmin4 excluímos mais uma vez o role daniel e criamos ele com o comando ROLE associando ao professores.

No terminal executamos o comando para verificar a relação dos roles:  </br>
**\du** 

O comando acima retornou a relação de roles:  </br>

                                    List of roles
  Role name  |                         Attributes                         | Member of 

 professores | Cannot login                                              +| {daniel}
             | 10 connections                                             | 


## Administrando acessos (GRANT)

GRANT são os privilégios de acesso aos objetos do banco de dados.

Todos os privilégios que podemos atribuir em nossa roles, privilégio de acesso:  </br>
-- **Tabela**
-- Coluna
-- sequence
-- **Database**
-- domain
-- foreign data wrapper
-- foreing server 
-- **function**
-- language
-- large object
-- **schema**
-- table space
-- type

Em negrito quais iremos abordar.

Comandos de GRANT no nível de DATABASE:  </br>
GRANT {{CREATE | CONNECTION | TEMPORARY | TEMP} [...] | ALL [PRIVILEGES]}  </br>
 ON DATABASE database_name [...]  </br>
 TO role_specification [...] [WITH GRANT OPTION]

A estrutura do comando é GRANT o tipo de privilégio ou all para todos em qual database e para qual perfil.
 
Comandos de GRANT no nível de SCHEMA:  </br>
GRANT {{CREATE | USAGE} [...] | ALL [PRIVILEGES]}  </br>
 ON SCHEMA schema_name [...]  </br>
 TO role_specification [...] [WITH GRANT OPTION]

A estrutura do comando é GRANT o tipo de privilégio ou all para todos o nome do schema e para qual perfil, lembrando que no schema public o acesso
está definido por padrão para todos.

Comandos de GRANT no nível de TABLE:  </br>
GRANT {{SELECT | INSERT | UPDATE | DELETE | TRUNCATE | REFERENCES | TRIGGER} [...] | ALL [PRIVILEGES]}  </br>
 ON {[TABLE] table_name [...]| ALL TABLE IN SCHEMA schema_name [...]}  </br>
 TO role_specification [...] [WITH GRANT OPTION]

E por fim a estrutura de comando GRANT com o tipo de privilégio ou all para todos o nome da tabela e o nome do perfil.


Revoke </br>
Comando para retirar as permissões abaixo segue a sintaxe dos comandos

No nível de DATABASE:  </br>
REVOKE [GRANT OPTION FOR]   </br>
{{CREATE | CONNECTION | TEMPORARY | TEMP} [...] | ALL [PRIVILEGES]}  </br>
 ON DATABASE database_name [...]  </br>
 FROM {[GROUP] role_name | PUBLIC} [...] </br>
 [CASCADE | RESTRICT]


No nível dos SCHEMA:  </br>
REVOKE [GRANT OPTION FOR]   </br>
{{CREATE | USAGE} [...] | ALL [PRIVILEGES]}  </br>
 ON SCHEMA schema_name [...]  </br>
 FROM {[GROUP] role_name | PUBLIC} [...] </br>
 [CASCADE | RESTRICT]

Veja a sintaxe em um formato simplificado, cortesia do professor Daniel.

para tirar todos os acessos de tabelas em um schema especifíco para um perfil específico.  </br>
REVOKE ALL ON ALL TABLES IN SCHEMA [schema] FROM [role]; 

para tirar todos os acessos dos schemas de um banco de dados de um perfil específico.  </br>
REVOKE ALL ON SCHEMA [schema] FROM [role]; 

para retirar todos os acessos aos bancos de dados em um servidor específico para um perfil específico.  </br>
REVOKE ALL ON DATABASE [database] FROM [role]; 

Em casos especificos de DROP DE ROLES onde existem muitas permissões para essa role impedindo seu "drop" usamos os 3 comandos acima que limpa todas
todas as permissões desse role e enfim conseguimos "dropar" essa role.

Agora vamos no mão na massa!!

No PGAdmin4  </br>
criamos uma tabela, garantimos permissões ao grupo professores, e criamos o perfil daniel.

No terminal  </br>
acessamos o banco de dados auladb com o usuário daniel.  </br>
**psql -U daniel auladb**

em seguida executamos o comando:  </br>
SELECT nome FROM teste;

e o retorno desse comando é:  </br>
ERROR:  permission denied for table teste

Logo esse perfil não pode usar o select.

Agora vamos excluir o perfil daniel para cria-lo novamente dentro da role (grupo) professores, no PGAdmin4.

após isso seguimos para o terminal e conectamos com o perfil daniel novamente:  </br>
**psql -U daniel auladb**

Executamos o mesmo comando para acessar a tabela:  </br>
**SELECT nome FROM teste;**

e o retorno é:  </br>
nome 
------
(0 rows)

Agora no PGAdmin4 vamos revogar permissões.

voltamos para o terminal e fazemos o teste com o comando:  </br>
**SELECT nome FROM teste;

e o retorno é  </br>
ERROR:  permission denied for table teste

Dessa forma práticamos permissões e outros comandos do PostgreSQL.

Esses comandos são importantes na parte de segurança dos bancos de dados.

Aula finalizada!
