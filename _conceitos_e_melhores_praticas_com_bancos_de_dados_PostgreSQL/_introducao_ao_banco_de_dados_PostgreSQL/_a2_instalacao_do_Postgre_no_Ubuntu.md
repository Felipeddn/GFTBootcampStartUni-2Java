# Continuando o Projeto a Partir de uma máquina Virtual Ubuntu

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
