# O que são registros - aula 4 - Bruno Dias

## Registros

Um Registro é uma estrutura que fornece um formato especializado para armazenar informações em memória.

Enquanto arrays nos permitem armazenar vários dados de um único tipo de dados, o recurso Registro nos permite armazenar mais de um tipo de dado.

Um registro pode possuir um dado do tipo inteiro, outro do tipo real, outro do tipo caractere, outro do tipo lógico e assim em diante.

Na programação podemos usar registros para as mais variadas areas de conhecimento humano como em recursos humanos para armazenar dados de funcionários, no marketing para controle de produtos e suas características, em fábricas e assim em diante.

Abaixo podemos ver alguns campos de exemplo que constituem o registro de um cliente:

CPF:
Nome:
Endereço:
Contato:

Toda estrutura de registro tem um nome (ex: Livro), e seus campos podem ser acessados por meio do uso do operador ponto (.). Por exemplo, para acessar o preço de um livro, poderíamos utilizar a seguinte declaração:

livro.preço

## Exemplo em algoritmo

Programa que declara registro e armazena informações de três livros.

ALGORITMO </br>
//declaração do tipo de dado </br>
tipo </br>
&nbsp;&nbsp;estrutura_livro = registro </br>
&nbsp;&nbsp;&nbsp;&nbsp;nome   :caracter </br>
&nbsp;&nbsp;&nbsp;&nbsp;preco  :real </br>
&nbsp;&nbsp;&nbsp;&nbsp;pagina :inteiro </br>
fim registro

//declaração das variáveis

    i inteiro // i para representar index
    livro array[1..3] de estrutura_livro

Escreva(*Entre com os nomes, preços e número de páginas de três livros)  
para i de 1 ate 3 faca  
&nbsp;&nbsp;&nbsp;&nbsp;Leia(livro[i].nome, livro[i].preco, livro[i].pagina*)  
fimpara  
Escreva(*Esses foram os dados digitados*)  
para i de 1 ate 3 faca  
&nbsp;&nbsp;&nbsp;&nbsp;Escreva(livro[i].nome, livro[i].preco, livro[i].pagina)  
fimpara  


FIMALGORITMO

