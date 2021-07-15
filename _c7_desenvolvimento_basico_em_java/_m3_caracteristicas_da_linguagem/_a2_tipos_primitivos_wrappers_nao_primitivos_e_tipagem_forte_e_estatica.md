# Aula 2 modulo 3 - Tipos primitivos, wrappers, não primitivos e tipagem forte e estática. - André Luis Gomes

## Tipos 

* Primitivos   
* Wrappers   
* Não primitivos   
* Tipagem forte e estática

Poxa os conteúdos de códigos já estão todos programados seria incrível poder fazer essa etapa junto com o André, mas vamos seguir com o 
aprendizado teórico dos conceitos.

### Tipos primitivos 

Um tipo primitivo nunca pode ser nulo (null), esse link abaixo é a documentação oficial sobre tipos no Java.

Um tipo primitivo recebe valores por padrões se não forem definidos. o valores de padrão podem ser consultados no link abaixo.

https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html

byte é um tipo que pode armazenar valores entre -128 até 127, numéricos, seu tamanho é de 8 bits.

char é um tipo alfanumérico de tamanho 16 bits, sua característica é de armazenar apenas um caractere 'a' ou até dois números números 
representados por mais de "duas casas" não podem ser armazenados.

short é um tipo numérico de tamanho 16 bits, que pode armazenar valores de -32768 até 32767.

int é um tipo numérico de tamanho 32 bits, que pode armazenar valores de -2147483648 até 2147483647.

long é um tipo numérico de tamanho 64 bits, que pode armazenar valores de -9223372036854775808 até 9223372036854775807 ele precisa de um 
l também para sinalizar para o compilador que se trata de um número long.

float que é para números de ponto flutuande (valores decimais) com tamanho de 32 bits, é necessário colocar um f no fim do valor para 
sinalizar para o compilador que se trata de um valor do tipo ponto flutuante.

double que seria um ponto flutuante de 64 bits.

boolean que pode assumir true or false e não devemos atribuir esses valores com aspas, eles sempre devem ser escritos sem aspas.

void é uma palavra reservada e não representa um tipo, apenas sinaliza que um método não tem um valor de retorno.

### Wrappers 

São objetos que representam os primitivos, Auto-boxing e unboxing.

Existe um objeto para cada tipo, veja: 

O objeto que representa o tipo **byte** é **Byte** note que ele inicia com letra maiúscula.

O objeto que representa o tipo **char** é **Character** note que ele inicia com letra maiúscula.

O objeto que representa o tipo **short** é **Short** note que ele inicia com letra maiúscula.

O objeto que representa o tipo **int** é **Integer** note que ele inicia com letra maiúscula.
 
O objeto que representa o tipo **long** é **Long** note que ele inicia com letra maiúscula.

O objeto que representa o tipo **float** é **Float** note que ele inicia com letra maiúscula.

O objeto que representa o tipo **double** é **Double** note que ele inicia com letra maiúscula.

O objeto que representa o tipo **boolean** é **Boolean** note que ele inicia com letra maiúscula.

Todos os wrappers possuem métodos, além disso todos eles recebem valores nulos diferente de variaveis criados com tipos para definir seus 
conteúdos.

A questão do autoboxing e unboxing não ficou muito clara mas deve ser muito útil na mudança de tipos das variáveis.

Maneiro!!! por curiosidade fiz uma consulta na IDE e saquei como construir algo parecido com o que o professor tem na aula.

vou reproduzir os exemplos e estarão salvos nos arquivos gerados pela IDE. Inclusive vou retomar os exemplos da aula 1.

### Tipos não primitivos 

* String   
* Numbers   
* Object   
* Qualquer outro objeto.

### Tipagem forte e estática

Forte e estática 

O Java é de tipagem estática porque os tipos de variáveis são verificados em tempo de compilação.

O Java é de tipagem forte porque seu tipo não muda conforme o valor que é atribuído e após definido um tipo não podemos altera-lo.

var - inferência de tipo (novidade que chegaram a partir do Java 10)

No primeiro momento de atribuição de valor a uma variável ela "compreende" o valor inserido e define aquele tipo baseado no valor atribuido 
para a variável, a partir desse momento a variável passa a não aceitar valores de tipo diferentes.

Essa forma de criar uma variavel será muito usada durante o curso porque facilita muito a programação e a leitura do código.
