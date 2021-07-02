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

No CentOS está um pouco dificil achar o local do arquivo postgresql.conf no diretório PGDATA. </br>
https://www.google.com/search?q=onde+fica+o+arquivo+postgresql.conf+do+postgresql+no+centos+8&client=firefox-b-e&ei=90rWYIXxIcfU1sQPp-m8uA8&oq=onde+fica+o+arquivo+postgresql.conf+do+postgresql+no+centos+8&gs_lcp=Cgdnd3Mtd2l6EAM6BwgAEEcQsAM6BAghEApKBAhBGABQ6XRYo-gBYKSVAmgJcAJ4AIABhwOIAbsvkgEINC4zOS4xLjKYAQCgAQGqAQdnd3Mtd2l6yAEIwAEB&sclient=gws-wiz&ved=0ahUKEwjFyJ_L3bPxAhVHqpUCHac0D_cQ4dUDCA0&uact=5

O link acima me ajudou a achar a resposta e segue o caminho do arquivo postgresql.conf no Cent0S, a aula 1 também fala do caminho.

NO CentOS o caminho do arquivo fica var/lib/pgsql/versao/data/postgresql.conf essa localização é mostrada na aula 1 o que é o arquivo 
postgresql.conf. Para abrir o arquivo e edita-lo basta usar o comando: </br>
**sudo nano var/lib/pgsql/versao/data/postgresql.conf**

iremos editar esse arquivo no tópico connections e authentication

Na configuração listen_addresses mudando a valor 'localhost' para '*', lembrando que esse comando libera o banco de dados para qualquer 
pessoa acessar, isso em produção é totalmente inseguro e nunca deve ser feito, fazemos isso apenas em ambiente de desenvolvimento ou para
fins de aprendizado.

Após a edição o orientador Daniel executou o comando: </br>
**pg_ctlcluster versão_do_postgresql nome_do_cluster start** 

Não sei qual o equivalente a esse comando no CentOS então continuei acompanhando o vídeo.

No Ubuntu o comando executado no vídeo para verificar a situação dos clusters foi: </br>
**pg_lsclusters**

No CentOS não sei dizer qual o equivalente então fiz uma pesquisa na internet e mesmo assim não consegui encontrar nada parecido, o máximo que 
consegui foi o comando abaixo onde sei que o banco de dados está executando.

Para verificar o status do banco de dados no CentOS devemos usar o comando: </br>
**systemctl status postgresql-versao**

Agora podemos fazer no Ubuntu a conexão com o banco de dados através dos comandos:  
**psql**  

O comando psql não funcionou no Linux CentOS.

Para fazer o comando psql é necessário logar com o usuário postgres e para isso use o comando: </br>
**sudo -u postgres -i**

assim o comando psql passa a funcionar e assim conseguimos usar o comando psql.

No Windows basta usar o prompt do comando para o caminho do binário ou adicionar o diretório ao path para usar o comando como no linux.

O comando psql aceita alguns argumentos como:  
-h (endereço host do banco de dados) 127.0.0.1 
-p (porta) 5432
-U postgres 

Esses parametros são padrões e serão subententidos caso não seja digitado  
o ultimo parametro é o banco de dados que se for ocultado será conectado ao banco de dados do usuário.

Agora podemos executar o comando SELECT 1; (precisa ser em maiúsculo senão retorna erro).

Executei o comando acima no CentOS e tudo certo.

No Windows durante a instalação ele solicita uma senha para o usuario master. No demais sistemas operacionais podemos fazer isso com o 
comando abaixo:  </br>
**ALTER USER nome_de_usuario PASSWORD 'senha';**

Se tudo tiver ocorrido ok retorna ALTER ROLE.

Executei o comando no CentOS e ele não retornou nada então acreditava estar tudo ok, afinal ele gritaria algum erro, porém eu havia esquecido o 
ponto e vírgula (;) depois de executar o comando retornou um erro de sintaxe, assim tentei novamente com ponto e vírgula e tudo certo tive o 
retorno ALTER ROLE.

Após a configuração da senha precisamos editar o arquivo pg_hba.conf

Agora iremos configurar os campos nas seguintes linhas:

'#' Database administrative login by Unix domain socket </br>
local   all             postgres                        </br>   peer

'#' TYPE  DATABASE        USER            ADDRESS                 METHOD

'#' "local" is for Unix domain socket connections only
local   all             all                                     peer

'#' replication privilege.
local   replication     all                                     peer

Como estamos usando a conexão local iremos modificar apenas as linhas local mudando o valor peer para md5: 

'#' Database administrative login by Unix domain socket
local   all             postgres                                <span style="color: red;">md5</span>

'#' TYPE  DATABASE        USER            ADDRESS                 METHOD

'#' "local" is for Unix domain socket connections only
local   all             all                                     <span style="color: red;">md5</span>

local   replication     all                                     <span style="color: red;">md5</span>

Após essas configurações podemos usar o comando reload para atualizar as configurações:  
**pg_ctlcluster versão nome_do_cluster reload**

dessa forma o down time é minímo, down time é o tempo que o banco de dados não está dísponível.

Assim as configurações realizadas serão aplicadas e agora para acessar os bancos de dados precisamos usar a senha do usuário.

No caso do CentOS alguns dados estão diferentes então ao invés de md5 vou usar scram-sha-256

como estava:

'#' TYPE  DATABASE        USER            ADDRESS                 METHOD

'#' "local" is for Unix domain socket connections only
local   all             all                                     peer

'#' Allow replication connections from localhost, by a user with the
'#' replication privilege.
local   replication     all                                     peer

como ficou:

'#' TYPE  DATABASE        USER            ADDRESS                 METHOD

'#' "local" is for Unix domain socket connections only
local   all             all                                     scram-sha-256

'#' Allow replication connections from localhost, by a user with the
'#' replication privilege.
local   replication     all                                     scram-sha-256

Após essas configurações podemos usar o comando reload para atualizar as configurações:  
**pg_ctlcluster versão nome_do_cluster reload**

Porém no CentOS esse comando não funciona e não sei qual o comando equivalente.

Baseado na aula 1 executei o seguinte comando: </br>
**systemctl restart postgresql-versao**

Executei no CentOS e o terminal não retornou nada então acredito estar tudo ok.

## Trabalhando com o PGAdmin4

A interface do PGAdmin4 Tem diversas opções disponíveis:

Dashboard (painel de controle) -> Um painel onde podemos verificar diversas informações do que está ocorrendo em nosso banco de dados.

Properties -> Informa sobre as propriedades dos objetos selecionados no menu do lado esquerdo.

SQL -> uma área que podemos digitar nossos comandos de structured query language (SQL), para fazer todo tipo de controle no banco de dados.

Statistics -> informações estatísticas dos objetos selecionados no menu do lado esquerdo.

Dependencies -> dependências do objeto.

Dependente -> objetos dependente do objeto selecionado.

No menu do programa temos as opções:

File </br>
* Preferências -> São opções para trabalhar com o PGAdmin.  </br>
Em query tools podemos deixar o auto completion ligado para facilitar nosso trabalho.
* Reset layout  - para trabalhar com a aparência do PGAdmin
* Lock layout   - para trabalhar com a aparência do PGAdmin

`Como o linux ubuntu não salvou o arquivo vou aproveitar para rever a aula práticando no CentOS`

Objects  </br>
* Create  </br>
 * Server Group...  </br>
 * Server  </br>
* Refresh  </br>
* Properties  </br>

Tools   </br>
* Query tools   </br>
Abre uma aba para digitar os comandos sql.  </br>
* Reload Configuration   </br>
Faz o mesmo que o comando systemctl restart postgresql-versao  </br>
* Pause Replay of WAL   </br>
* Resume Replay of WAL   </br>
* Add Named Restore Point...   </br>
Para Adicionar um Point Recovery, um tipo de backup para restaurar os dados caso algo ocorro, daí ele tenta recuperar um ultimo estado do banco.</br>
* Import/Export   </br>
* Maintenance...   </br> 
* Backup...   </br>
* Backup Global...   </br>
* Backup Server   </br>
* Restore...  </br>
* Grant Wizard   </br>
Essa opção é para trabalhar com configurações de acesso e permissões de acesso.

Help  </br>
São diversas opção de ajuda com links para acessar e tirar alguma dúvida.

## Agora o momento mais feliz colocar a mão na massa!

Selecione "Servers" no lado esquerdo do PGAdmin4 

Escolha Objects -> create -> server group   </br>
Essa ação abrirá uma janela onde devemos inserir um nome do server group

Um server group é um servidor de diversos banco de dados, que podem ser agrupados, dessa forma, bancos de dados de produção podem ser agrupados 
em um server group de produção e os bancos de dados de desenvolvimento podem ser agrupados em um server group de desenvolvimento e assim por diante.
</br>

Após nomear o server group e digitar em save abrirá do lado esquerdo um grupo de banco de dados com o nome inserido.

Agora selecionamos o server group criado e selecionamos Object -> Server... 

Na aba general nomeamos o servidor, selecionamos o grupo de servidor que ele pertence, marcar a opção de conectar agora e colocar um comentário que foi 
recomendado pelo instrutor, afinal ajuda demais os demais profissionais que trabalhar com isso como DBA e DATA Engineer e é uma boa prática.

Na Connections preenchemos o campo 'Host name/address', a porta, Maintenance database que é o banco de dados que desejamos dar manutenção, o nome 
do usuário, a senha do usuário, podemos marcar a opção para salvar a senha dispensando a necessidade de ficar digitando.

No momento de salvar, houve um problema.

Unable to connect to server:

FATAL: password authentication failed for user "postgres"

Resolvi o conflito entrando no usuário postgres: </br>
**sudo -u postgres -i**

Acessando o banco de dados: </br>
**psql**

Alterando a senha do usuario: </br>
**ALTER USER nome_do_usuário PASSWORD 'senha_desejada';**

tentei novamente no PGAdmin4 e a conexão foi bem sucedida.

Agora no lado esquerdo é criado um icone com o desenho de um elefante para representar o servidor aula com todos os bancos de dados esse banco fica 
informado que há apenas um banco de dados. Esse banco está nomeado como postgres e com diversas opções: 

* Casts </br>
Casts são as formas como podemos trabalhar com conversões de tipos.  </br>
* Catalogs   </br>
Catalogs são os catalogos dos próprios bancos onde ficam armazenados as tabelas.  </br>
* Event Triggers   </br>
Event triggers são eventos que são ativados baseados em eventos dos bancos.  </br>
* Extensions   </br>

* Foreign Data Wrappes   </br>
É a possibilidade de se conectar a outras fontes de dados como MySQL, Oracle, planilhas do tipo csv, esse é o local que configuramos essas conexões.
 </br>
* Languages   </br>
Configurações de linguagens.  </br>
* Publications  </br>
* Schemas  </br>
Dentro do banco de dados podemos ter um ou mais schemas que são grupos de objetos. Ele já vem com o schema publics onde quem tem acesso pode ver. 
 </br>
abaixo os objetos dos schemas  </br>
 * Collations  </br>
 * Domains  </br>
 * FTS Configurations  </br>
 * FTS Dictionaries  </br>
 * FTS Parsers  </br>
 * FTS Templates  </br>
 * Foreigns Tables  </br>
  São tabelas de uma outra fonte de dados.  </br>
 * Functions  </br>
 * Materialized Views   </br>
 * Procedures  </br>
 * Sequences  </br>
 * Tables   </br>
 * Triggers Functions  </br>
 * Types  </br>
 * Views  </br>
Muitos desses objetos serão tratados ao longo do curso.
* Subscriptions  </br>

Agora que temos o banco de dados o Dashboard traz algumas informações vamos entender elas:  </br>
* Database sessions  </br>
Gráficos com as conexões dos bancos de dados.

* Transactions per seconds  </br>
Gráficos que mostram todas as transações do banco de dados.

* Tuples in  </br>
A quantidade de tuplas que estão sendo inseridas no banco de dados, quantidade de inserts, updates, deletes.

* Tuples out  </br>
a quantidade de tuplas que estão sendo usadas como resultado, saindo do banco de dados, quantidade de retorno de comandos sql.

* Block I/O  </br>


Ainda no Dashboard podemos ver as sessions no Server activity para verificar a quantidade de conexões, locks que são conexões que podem bloquear 
outras conexões e os prepared transactions que são comandos que podem estar preparados para estarem disponíveis.

Enfim vamos criar nosso banco de dados.

Podemos fazer isso pela interface gráfica selecionando databases com o botão direito create -> Database...  </br>
Isso abrirá uma janela onde podemos nomear esse banco, escolher um proprietario (owner) e colocar um comentário.

Mas vamos fazer isso através de linha de códigos sql clicando no postgres depois no menu do PGAdmin4 em Tools -> Query tools ->   </br>

Dessa forma uma janela onde podemos digitar o código sql abrirá e podemos digitar o comando para criar o banco de dados: </br>
**CREATE DATABASE auladb;**

executamos o código com o icone de play ou apertando F5.

Agora já podemos fechar a janela selecionar o banco de dados auladb e fazer o mesmo caminho Tools -> Query tools para acessar a janelas de comandos 
sql desse banco de dados.

e para finalizar podemos usar o comando:  </br>
**SELECT 1;** 

executamos o código com o icone de play ou apertando F5.
para testar nosso banco de dados

`Assim a aula foi finalizada com tranquilidade no CentOS 8`

