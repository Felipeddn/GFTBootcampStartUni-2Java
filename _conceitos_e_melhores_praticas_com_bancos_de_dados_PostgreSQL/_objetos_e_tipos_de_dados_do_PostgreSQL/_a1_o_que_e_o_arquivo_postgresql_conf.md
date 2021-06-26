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



