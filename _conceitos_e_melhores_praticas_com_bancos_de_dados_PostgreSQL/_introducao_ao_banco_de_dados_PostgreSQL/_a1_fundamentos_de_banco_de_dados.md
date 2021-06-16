# Conceitos e melhores práticas com banco de dados PostgreSQL - aula 1 - Daniel Robert Costa

Curso destinado para todos que não trabalha com banco de dados e deseja conhecer sobre.

Daniel Robert Costa 

Database Engineer 
Trabalha na Quinto andar
Especialista em MySQL e PostgreSQL
Trabalhou com diversos bancos de dados relacionais e não relacionais.

## Objetivos da aula

1. Fundamentos de banco de dados
2. Modelo relacional
3. Introdução ao PostgreSQL

## Requisitos básicos

Um Sistema operacional (Windows, Linux, OSX)

Noção em lógica de programação

Noções básicas de modelos de dados

Noções básicas em Linux

## Parte 1: Fundamentos de banco de dados

O que são dados? 
Valores brutos, fatos brutos, observações documentadas, registros soltos, que são recolhidos e armazenados sem sofrer qualquer tratamento.

exemplos:

11987475587  </br>
81966480021 </br>
519887440255 </br>
1589632579 </br>
6277685920 </br>
Emengarda </br>
Rogério </br>
Daniel </br>
Cleonice </br>
Divanildo

Dados sem sentidos, como no exemplo são números e nomes mas isso só diz respeito aos tipos de dados e nada além disso. Quanto dados ganham sentido eles se tornam informações.

O que são informações?

Estruturação de dados, organização de dados. Conjunto de dados relacionados entre si que geram valor, que criam sentidos aos dados. Material do conhecimento.

exemplo:

se o ano de 2002 for armazenado ele fica sem sentido

se o ano de 2002 for armazenado e for relacionado aos campeões de uma copa esse dado começa a ganhar significado, ou seja gera-se informações.

As diversas informações podem se tornar conhecimento.

Veja outro exemplo de dados que agrupados podem gerar informações

Números de Telefones  Proprietarios do número

11987475587 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Emengarda </br>

81966480021 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rogério </br>

519887440255 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Daniel </br>

1589632579 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cleonice </br>

6277685920 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Divanildo </br>

## Parte 2 Modelos Relacionais

Modelar é o ato de criar um modelo, esse modelo pode explicar as características de funcionamento ou o comportamento de um software.

Modelo de dados são ferramentas que vão permitir, que vão demonstrar como as estruturas de dados estão organizadas e como se relacionam entre si.

O modelo relacional é o modelo de dados representativo que se baseia no principio que todos esses dados serão armazenados em tabelas com linhas e colunas.

## Modelo Relacional

Modelo mais comum, que classifica e organiza as informações em tabelas com linhas e colunas.
As linhas, tuplas, são os dados organizados, são os valores das tabelas, e as colunas são os atributos destes dados.

Linhas são também conhecidas como tuplas.
Colunas também são conhecidas como atributos.

Quando temos tabelas começamos a organizar essas tabelas para os dados poderem se relacionar.

11987475587 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&rarr;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Emengarda </br>

81966480021 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&rarr;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rogério </br>

519887440255 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&rarr;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Daniel </br>

1589632579 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&rarr;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cleonice </br>

6277685920 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&rarr;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Divanildo </br>

Essas setas simboliza que esses dados estão relacionados.

Nem sempre a relação dos dados se dá de um para um.

Nós seres humanos conseguimos relacionar bem a ideia de um número de telefone pertencer a uma pessoa e para o computador realizar a mesma relação precisamos dar um significado lógico.

Então para simbolizar a relação realizada no exemplo acima devemos usar uma relação lógica como feito abaixo:

telefone.1 = proprietario.1
telefone.2 = proprietario.2
telefone.3 = proprietario.3
telefone.4 = proprietario.4
telefone.5 = proprietario.5

O que é uma tabela?

Tabela são conjuntos de dados dispostos em colunas e linhas referentes a um objeto comum.

As colunas são consideradas como "campos da tabela", como atributos da tabela.

As linhas de uma tabela são chamadas também de tuplas, e é onde estão contidos os valores, os dados.

Regras Básicas para criar uma boa tabela

O que pode ser definido como tabela?

* Coisas tangíveis </br>
Elementos físicos (carro, produto, animal).

* Funções </br>
Perfis de usuário, status de compra.

* Eventos e ocorrências </br>
Produtos de um pedido, histórico de dados.

Quais colunas devo usar?

A escolha de boas colunas garante a qualidade de significado da tabela o que garante uma boa estruturação de dados.

Duas colunas são muito importantes.

* Chave primária / Primary key / PK </br>
    * Conjunto de um ou mais campos que nunca se repetem. Identidade da tabela. São utilizados como índice de referência da criação de relacionamentos entre tabelas.

* Chave estrangeira / Foreign Key / FK
    * Valor de referência a uma PK de outra tabela da mesma tabela para criar um relacionamento.

Chaves Primárias e chaves estrangeiras ajuda a garantir a integridade de dados.

**Sistemas de gerenciamento de banco de dados** ou Sistemas de gestão de base de dados são chamados pela sigla SGBD.

São conjuntos de programas ou software responsáveis pelo gerenciamento de um banco de dados.

São programas que facilitam a administração de um banco de dados.

Exemplos de SGBD podem ser visualizados na imagem `_aula1_exemplos_de_banco_de_dados.png`

## Parte 3 Introdução ao PostgreSQL

O que é o PostegreSQL ?

Sistema de gerenciamento de banco de dados objeto relacional.

Teve início no departamento de ciência da computação na universidade da California em Berkeley em 1986.

SGBD Opensource. 

É um banco de dados que pode ser distribuído, ter seu código fonte editado.

Arquitetura de multiprocessos 

Na instalação do PostgreSQL diversos processos ocorre 

Modelo Cliente/Servidor

Principais características
* OpenSource 
* Point time recovery
* Liguagem procedural com suporte a várias linguagens de programação (perl, python, etc).
* Views, functions, procedures, triggers]
* Consultas complexas e Common table expressions (CTE)
* Suporte a dados geográficos (PostGIS)
* Controle de concorrência multi-versão

Instalação de documentação do PostgreSQL

Site oficial:
https://www.postgresql.org/

Download com instruções passo a passo:
https://www.postgresql.org/download

Documentação completa:
https://www.postgresql.org/docs/manuals/
