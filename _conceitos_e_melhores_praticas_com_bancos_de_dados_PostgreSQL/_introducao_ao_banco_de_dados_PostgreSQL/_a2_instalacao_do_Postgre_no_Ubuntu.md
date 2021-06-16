![_aula2_postgre](https://user-images.githubusercontent.com/86016603/122281878-2930b500-cec1-11eb-955f-74b83ec67e48.png)
# Intalação do PostgreSQL no Ubuntu - aula 2 - Daniel Robert Costa

## Continuando o Projeto a Partir de uma máquina Virtual Ubuntu

## Instalação no Linux (Ubuntu)

**Como root, criar o arquivo:** </br>
/etc/apt/sources.list.d/pgdg.list </br>
**Adicionar o conteúdo:** </br>
deb http://apt.postgresql.org/pub/repos/apt/bionic-pgdg main </br>
**Importar a chave do repositório oficial:** </br>
wget -quiet -O -https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add- </br>
**Atualizar os repositórios:** </br>
sudo apt-get update </br>
**Instalar o PostgreSQL:**
apt-get installl postgresql-11

Site para download: </br>
https://www.postgresql.org/download/linux/ubuntu/

Passo que eu segui 

copiei no terminal </br>
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

copiei no terminal </br>
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - </br>
recebi um ok 

copiei no terminal
sudo apt-get update

copiei no terminal
sudo apt-get -y install postgresql

após esse comando ele retornou diversas mensagens vou destacar uma em especifico: </br>

Sucesso. Você pode iniciar o servidor de banco de dados utilizando: 

&nbsp;&nbsp;&nbsp;&nbsp;pg_ctlcluster 13 main start

Então imagino estar tudo ok com a instalação e vou considerar instalado!

O Postgree possui alguns comandos facilitados exclusivo do Linux.

digitei os comandos para acessar meu diretório de usuario

**cd /** </br>
**cd home/felipe**

agora no diretório correto digitei o comando orientado na aula para criar um cluster </br>
pg_createcluster -d /home/postgres/aula 13 aula --start

após esse comando recebi o retorno do terminal dizendo o diversas mensagens vou destacar essa:

Sucesso. Você pode iniciar o servidor de banco de dados utilizando:

  pg_ctlcluster 13 aula start
  
Apenas digitei o comando orientado na aula </br>
pg_lsclusters

ele retornou essas duas linhas: </br>
13  aula    5433 online postgres /home/postgres/aula         /var/log/postgresql/postgresql-13-aula.log </br>
13  main    5432 online postgres /var/lib/postgresql/13/main /var/log/postgresql/postgresql-13-main.log

Seguindo os passos da aula executei os seguintes comandos: </br>
**su - postgres** </br>
Ele pediu uma senha coisa que não aconteceu no vídeo, apertei enter e a resposta foi: **su: falha de autenticação** </br>
resolvi com esse link </br>
https://qastack.com.br/server/601140/whats-the-difference-between-sudo-su-postgres-and-sudo-u-postgres </br>
Executei o comando: </br>
**sudo -u postgres -i**

Usei o comando:
**psql** </br>

Por fim fiz o comando:
**select 1;**

O retorno foi: </br>
?column? 
----------
        1
(1 row)

para sair do banco usamos o comando: </br>
**\q**

e para sair do usuario usamos </br>
**logout**

Tudo ok ;)

pgAdmin

Interface gráfica para interagir com o banco de dados. </br>
https://www.pgadmin.org

Versão 4 para Ubuntu </br>
https://www.pgadmin.org/download/pgadmin-4-apt/

no site tinha um passo a passo segui ele:

primeiro executei a seguinte linha: </br>
**sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add**

Esse comando retornou dois erros: </br>
sudo: curl: comando não encontrado </br>
gpg: nenhum dado OpenPGP válido encontrado.

Então uma sugestão procurando na internet é que eu não tinha a ferramenta curl: </br>
https://www.cyberciti.biz/faq/how-to-install-curl-command-on-a-ubuntu-linux/

segui os passos do site acima: </br>
**sudo apt upgrade && sudo apt update** </br>
**sudo apt install curl**

após esses comandos executei os comandos do link para instalar o pgAdmin </br>
https://www.pgadmin.org/download/pgadmin-4-apt/ </br>
**sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add**

e tudo certo ;) então só prossegui com os demais comandos para instalar o pgAdmin </br>
**sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'**

**sudo apt install pgadmin4-desktop**

**sudo apt install pgadmin4**

**sudo /usr/pgadmin4/bin/setup-web.sh**

após as instalações não foi possível usar o comando </br>
**pgadmin4**

Ele retornava: </br>
sudo: pgadmin4: comando não encontrado

Executei novamente o comando

**sudo /usr/pgadmin4/bin/setup-web.sh** </br>
tirei a ideia de executar de novo nesse link porque em alguma parte desse tutorial estava escrito para configurar email e senha </br>
https://www.tecmint.com/install-postgresql-and-pgadmin-in-ubuntu/

configurei email e senha

e executei o comando:
**pgadmin4**

e funcionou, abri o link que apareceu na linha de comando do terminal.

Tudo certo novamente ;) só alegria nessa aula apesar dos desafios.





