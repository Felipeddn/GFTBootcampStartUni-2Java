# Intalação do PostgreSQL no CentOS - aula 3 - Daniel Robert Costa

Antes da aula em si foi necessário um pequeno aprendizado de Linux CentOS

Achei essa playlist linda muito top sobre Linux que tem o propósito de ajudar a obter o certificado Linux Essentials e tem muito conteúdo incrível por isso vou deixar o link e super recomendar esse curso.  
https://www.youtube.com/watch?v=Vz92ycqn9wk&list=PLucm8g_ezqNqz-DVT9n_z-XjRkQ03m7U5

Link para download da imagem CentOS 8:  
https://centos.org/download/

Na imagem `_aula_download_do_centos.png` é possível ver a parte que acessa as mirror para download do sistema operacional , na mirror cliquei no link destacado na imagem `_aula3_mirror_do_download.png`, escolhi o arquivo que está destacado na imagem `_aula3_arquivo_do_download.png`. Esses passos levou um tempo para ser compreendido, mas a parte mais demorada foi o download, em uma internet boa provavelmente não levará muito tempo para fazer esses passos.

Além disso existe um processo necessário para fazer o sistema operacional CentOS ficar com a tela cheia na Virtualização e essa foi a melhor solução que encontrei para isso:  
https://www.tecmint.com/install-virtualbox-guest-additions-on-centos-8/

Agora com a máquina virtual preparada com o sistema operacional acredito que a aula da instalação do postgree poderá ser realizado tranquilamente.

Para o download do Postgree o link provavelmente é esse:  
https://www.postgresql.org/download/linux/redhat/

Instalação a partir do CentOS. As etapas abaixo foram realizadas em uma máquina virtual com CentOS 8.

Para dar continuidade no projeto de instalações em sistemas operacionais foi necessário clonar o Repositório porém o github dos sistemas operacionais das maquinas virtuais e do meu sistema operacional principal são diferentes por esse motivo tive que consultar algo externo a solução da aula em si mas que me ajudou muito.  
https://medium.com/@gabrielgelado/git-adicionando-um-reposit%C3%B3rio-remoto-ao-seu-projeto-5d5a2cacff0b
https://pt.stackoverflow.com/questions/39806/alterando-caminho-remoto-no-git

Agora possuo os repositórios atualizados para dar continuidade do passo a passo realizado para a instalação, vou usar o link da DigitalOcean já que o meu sistema operacional é o CentOS 8  
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-centos-8-pt

Esse foi o primeiro comando que o tutorial recomendou:  
**dnf module list postgresql**

Diferente do recomendado no tutorial o retorno foi:  
Erro: Sem módulos compatíveis pra listar

Vou seguir a recomendação do site mesmo:  
https://www.postgresql.org/download/linux/redhat/

segui esses comandos:  
# Install the repository RPM:
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Disable the built-in PostgreSQL module:
sudo dnf -qy module disable postgresql

# Install PostgreSQL:
sudo dnf install -y postgresql13-server

# Optionally initialize the database and enable automatic start:
sudo /usr/pgsql-13/bin/postgresql-13-setup initdb
sudo systemctl enable postgresql-13
sudo systemctl start postgresql-13

No vídeo existe esse comando super interessante:  
**cat /etc/*release**

CentOS Linux release 8.4.2105
NAME="CentOS Linux"
VERSION="8"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="8"
PLATFORM_ID="platform:el8"
PRETTY_NAME="CentOS Linux 8"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:8"
HOME_URL="https://centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"
CENTOS_MANTISBT_PROJECT="CentOS-8"
CENTOS_MANTISBT_PROJECT_VERSION="8"
CentOS Linux release 8.4.2105
CentOS Linux release 8.4.2105

No CentOS 8 yum foi substituído por dnf.

quando executei o comando:  
**sudo systemctl status postgresql-13**

Obtive a seguinte reposta:  
● postgresql-13.service - PostgreSQL 13 database server
   Loaded: loaded (/usr/lib/systemd/system/postgresql-13.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2021-06-21 16:00:31 -03; 4min 29s ago
     Docs: https://www.postgresql.org/docs/13/static/
 Main PID: 7684 (postmaster)
    Tasks: 8 (limit: 23546)
   Memory: 16.8M
   CGroup: /system.slice/postgresql-13.service
           ├─7684 /usr/pgsql-13/bin/postmaster -D /var/lib/pgsql/13/data/
           ├─7686 postgres: logger 
           ├─7688 postgres: checkpointer 
           ├─7689 postgres: background writer 
           ├─7690 postgres: walwriter 
           ├─7691 postgres: autovacuum launcher 
           ├─7692 postgres: stats collector 
           └─7693 postgres: logical replication launcher 


Na etapa de acessar o postgre executei o seguinte comando que aprendi na internet sobre:
**sudo -u postgres -i**

No comando **psql** ele retornou o seguinte:  
psql (13.3)
Type "help" for help.

O que no meu entender diz que está tudo ok.

mais uma etapa que parece ok foi no comando select 1; que retornou:  
postgres=# select 1;
 ?column? 
----------
        1
(1 row)

Agora é a etapa da configuração do pgadmin que pode ser feito seguindo esse link, vou tentar seguir os passos do link primeiro:  
https://www.pgadmin.org/download/pgadmin-4-rpm/

sudo rpm -e pgadmin4-redhat-repo  
erro: o pacote pgadmin4-redhat-repo não está instalado

sudo rpm -e pgadmin4-fedora-repo  
erro: o pacote pgadmin4-fedora-repo não está instalado

Ambos os comandos acima retornou uma mensagem de erro. 

digitei o comando:  
**sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-redhat-repo-2-1.noarch.rpm**

não funcionou muito quando executei o comando: 
sudo /usr/pgadmin4/bin/setup-web.sh

Por conta disso segui os passos desse tutorial:  
https://www.tecmint.com/install-postgressql-and-pgadmin-in-centos-8/

Segui o tutorial e consegui executar o pgadmin4 no navegador.

resumindo acredito ter finalizado as instalações.

Por fim assisti a aula e agora sigo com as instalações Linux realizadas.