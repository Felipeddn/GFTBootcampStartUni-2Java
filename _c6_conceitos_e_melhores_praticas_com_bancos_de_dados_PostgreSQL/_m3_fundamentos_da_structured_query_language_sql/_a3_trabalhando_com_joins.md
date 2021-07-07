# aula 3 modulo 3 - Trabalhando com Joins - Daniel Robert Costa

# Relacionamentos entre tabelas.

## Objetivo da aula

* Tratar sobre Joins

Tipos de Joins que podemos usar

* JOIN (INNER JOIN)   
* LEFT JOIN   
* RIGHT JOIN  
* FULL JOIN   
* CROSS JOIN   

INNER JOIN   
conceito gráfico do INNER JOIN no arquivo `_aula3_inner_join.png`

COMANDO (INNER) JOIN
SELECT tabela_1.campos, tabela_2.campos 
FROM tabela_1
JOIN tabela_2
 ON tabela_2.campo = tabela_1.campo;

Uma boa prática na parte do ON é usar campos que são foreign keys ou primary keys para melhorar a performance. Podemos fazer sem as FK e as PK 
mas será usado um maior recurso do banco de dados.

Exemplo visual do INNER JOIN no arquivo `_aula3_retorno_de_duas_tabelas_com_join.png`

LEFT JOIN    
conceito gráfico do LEFT JOIN no arquivo `_aula3_left_join`

Durante a relação de tabelas temos tabelas a direita e a esquerda, o left join retorna os valores da tabela da esquerda por completo e retorna da 
tabela a direita os valores que tiverem relação, caso contrario ele retorna da tabela da direita valores nulos.

Suponha que ao lado esquerdo temos uma tabela A com 10 registros e a direita uma tabela B com 20 registros, nesse tipo de consulta os registros 
(linhas) da tabela A são todas retornadas e os registros(linhas) da tabela B só serão retornadas para o caso de existir uma relação com os dados da 
tabela A, ou seja, nesse tipo de consulta o retorno dos registros da tabela A seriam 10 registros e se existe apenas dois registro na tabela B 
seriam retornados e os demais seriam nulos.

COMANDO LEFT (OUTER) JOIN

SELECT tabela_1.campos, tabela_2.campos
FROM tabela_1
LEFT JOIN tabela_2
 ON tabela_2.campo = tabela_1.campo;

* Nesse exemplo a tabela a esquerda seria a tabela_1 e a tabela a direita seria a tabela_2.

Exemplo visual do LEFT JOIN no arquivo `_aula3_retorno_de_duas_tabelas_com_left_join.png`

RIGHT JOIN   
Conceito gráfico do RIGHT JOIN no arquivo `_aula3_right_join`

Segue o conceito do LEFT JOIN porem o resultado que tem toda sua tabela contemplada é a tabela considerada do lado direito da consulta.

COMANDO RIGHT (OUTER) JOIN

SELECT tabela_1.campos, tabela_2.campos
FROM tabela_1
RIGHT JOIN tabela_2
 ON tabela_2.campo = tabela_1.campo;

Exemplo visual do RIGHT JOIN no arquivo `_aula3_retorno_de_duas_tabelas_com_right_join.png`

FULL JOIN   
Conceito gráfico do FULL JOIN no arquivo `_aula3_full_join.png`

Não é recomendado seu uso no ambiente de produção, seu uso é específico para alguns relatórios, ele é usado para retornar todos os registros de 
ambas as tabelas "juntadas".

COMANDO FULL JOIN

SELECT tabela_1.campos, tabela_2.campos
FROM tabela_1
FULL JOIN tabela_2
 ON tabela_2.campo = tabela_1.campo;

Exemplo visual do FULL JOIN no arquivo `_aula3_retorno_de_duas_tabelas_com_full_join.png`


CROSS JOIN   


Não é recomendado seu uso porque exige muito recurso, ele cruza todos os dados de duas tabelas e cria uma matriz, é um recurso que existe mas para 
um uso muito específico e pouco recorrente. Usar esse comando em produção usará muito recursos mesmo, não a necessidade de executar um comando 
desses apenas em casos extremos.

COMANDO CROSS JOIN

SELECT tabela_1.campos, tabela_2.campos
FROM tabela_1
CROSS JOIN tabela_2;

Exemplo visual do CROSS JOIN no arquivo `_aula3_retorno_de_duas_tabelas_com_cross_join.png`

Agora vamos executar alguns comandos abordados nessa explicação teorica no PGAdmin4 e esses comandos podem ser visualizados no arquivo 
`_aula3_modulo3_comandos_praticados_na_aula.sql`

Desafio pedido na aula presente no fim do arquivo.
