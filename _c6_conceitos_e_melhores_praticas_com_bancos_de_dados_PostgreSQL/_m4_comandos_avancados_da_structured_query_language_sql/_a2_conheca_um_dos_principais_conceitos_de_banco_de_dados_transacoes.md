# Aula 2 módulo 4 - Conheça um dos principais conceitos de banco de dados: transações - Daniel Robert Costa

## Objetivo da aula

Abordar sobre transações

Trasações é um conceito fundamental de todo sistema de banco de dados.   
Conceito de múltiplas etapas/códigos reunidos em apenas uma transação, onde o resultado precisa ser **tudo ou nada**.

Exemplos práticos   
```sql
UPDATE conta SET valor = valor - 100.00 WHERE nome = 'Alice';

UPDATE conta SET valor = valor + 100.00 WHERE nome = 'Bob';
```

Veja esses dois comandos pode representar a lógica de uma transação porem observe que cada comando age de forma separada, ou seja, pode ocorrer o 
erro de da primeiro comando funcionar e o segundo não, falta de energia, conexão, qualquer coisa do tipo, dessa forma o valor retirado da conta de a
alice simplesmente some no meio da "transação".

Por isso esse conceito assume na prática a sintaxe abaixo essa sim uma operação de transação.

```sql   

Begin;

    UPDATE conta SET valor = valor - 100.00    
    WHERE nome = 'Alice';

    UPDATE conta SET valor = valor + 100.00    
    WHERE nome = 'Bob';

COMMIT;
``` 
No caso de transações se o comando falhar no meio de sua execução ou retornar algum erro ocorre um rollback ou seja nada é modificado, garantindo 
a qualidade de operações e problemas como relatado no exemplo acima.


```sql   

Begin;

    UPDATE conta SET valor = valor - 100.00    
    WHERE nome = 'Alice';

    UPDATE conta SET valor = valor + 100.00    
    WHERE nome = 'Bob';

ROLLBACK;
``` 
O comando rollback pode ser realizado propositalmente usando-o no fim da transação.


```sql   

Begin;

    UPDATE conta SET valor = valor - 100.00    
    WHERE nome = 'Alice';

SAVEPOINT my_savepoint;

    UPDATE conta SET valor = valor + 100.00    
    WHERE nome = 'Bob';   
    -- oops... não é para o Bob, é para o Wally!!!

ROLLBACK TO my_savepoint;

    UPDATE conta SET valor = valor + 100.00
    WHERE nome = 'Wally';

COMMIT;
``` 
O SAVEPOINT é um comando que pode ser realizado mas caso esteja equivocado ele é ignorado, evitando a execução do comando iniciado antes do savepoint 
mas executando o comando após o ROLLBACK TO e finalizando no COMMIT.

Agora o momento mais feliz mão na massa para praticar todos os conceitos abordados!!!

Como sempre os comandos estão em um arquivo separado chamado `_aula2_modulo4_comandos_praticado_na_aula.sql`

Finalizado aula, confira os comandos no arquivo evidênciado acima.
