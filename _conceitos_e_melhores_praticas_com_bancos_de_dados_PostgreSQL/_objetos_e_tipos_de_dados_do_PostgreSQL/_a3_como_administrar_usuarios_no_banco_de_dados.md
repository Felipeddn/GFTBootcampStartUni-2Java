# O que é o arquivo postgresql.conf - aula 1 - Daniel Robert Costa 

## Configurações do Servidor Postgree para melhor funcionamento 

## Objetivos da aula 

1. O arquivo postgresql.conf
2. O arquivo pg_hba.conf
3. O arquivo pg_ident.conf
4. Comandos administrativos

## O arquivo postgresql.conf

É o arquivo onde estão definidas e armazenadas todas as configurações do servidor PostgreSQL.  

"São configurações de como o servidor vai trabalhar com a memória, quantos usuários poderá usar..."

Alguns parâmetros só podem ser alterados com uma reinicialização do banco de dados.  

"O arquivo está dentro de diretório de dados, que costuma ser chamado de PGDATA, quando é criado o primeiro cluster é realizada a criação de diversos arquivos dentro de um diretório específico o arquivo .conf se encontra nesse local. No Ubuntu fica em outra parte do sistema operacional, caso a instalação tenha ocorrido a partir do repositório oficial."

Normalmente o caminho desse arquivo fica em:  
/etc/postgresql/[versao]/[nome_do_cluster]/postgresql.conf

A view pg_settings, acessada por dentro do banco de dados, guarda todas as configurações atuais.  

"A pg_settings é uma view muito importante que reflete as configurações do momento que o servidor está sendo executado. Com essa view poderemos ver todas as configurações do banco de dados"

A sintaxe para esse comando é:

SELECT name, settings
FROM pg_settings;

ou com a seguinte sintaxe: 

SHOW [parâmetro]

Foi possível localizar tranquilamente o postgresql.conf no Ubuntu

