# aula 4 modulo 4 - CTE - Daniel Robert Costa

## Objetivos da aula

1. Common Table Expressions - CTE 

O Common Table Expressions é uma forma auxiliar de organizar "statements" (declarações em português), ou seja, bloco de códigos, para consultas 
muito grandes, gerando tabelas temporárias e criando relacionamentos entre elas.

Dentro dos statements podem ter SELECTs, INSERTs, UPDATEs, DELETEs.

WITH STATEMENTS 

WITH [nome1] AS (
    SELECT (campos,...)
    FROM tabela_A
    [WHERE]
),[nome2] AS (
    SELECT (campos,)
    FROM tabela_B
    [WHERE]
)
SELECT [nome1].(campos,...), [nome2].(campos,...)
FROM [nome1]
JOIN [nome2]...

WITH STATEMENTS é muito mais organizado que um subselect**(?)**

Aquela aula mão na massa!! 

Os comandos da aula está no arquivo `_aula4_modulo3_comandos_praticados_na_aula.sql`



