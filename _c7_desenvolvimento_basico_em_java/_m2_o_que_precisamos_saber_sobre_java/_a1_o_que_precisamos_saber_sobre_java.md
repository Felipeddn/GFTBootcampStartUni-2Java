# aula 1 módulo 2 - O que precisamos saber sobre Java - André Luis Gomes  

A siglas e seus significados em Java 

O que é Java? 

Uma linguagem de programação e plataforma computacional lançada em 1995 pela **Sun Microsystem**, por um time comandado por James Gosling. 
Anos depois foi adquirida pela **Oracle**.

Diferente de outras linguagens de programação, que são **compiladas** para código **nativo**, o Java é um compilado para **bytecode** que é 
interpretado por uma **máquina virtual**.

O que é compilador?

Um **compilador** é um programa que, a partir de um **código fonte**, cria um programa semanticamente equivalente, porém escrito em outra 
linguagem, **código objeto**. Um compilador traduz um programa de uma linguagem textual para uma linguagem de máquina, específica para um 
processador e sistema operacional. 

O nome **compilador** é usado principalmente para os programas que **traduzem** o **código fonte** de uma **linguagem de programação de 
alto nível** para uma **linguagem de programação de baixo nível** (por exemplo, **Assembly** ou **código de máquina**).

O que é bytecode? 

É o **código originado** da compilação de programas **Java**.

O **bytecode** é o programa interpretado e executado pela **máquina Virtual Java**, **JVM**.

Antes de explicar o que é uma JVM, o que é uma VM?

Uma **Máquina Virtual**, ou Virtual Machine, é um software que simula uma máquina física e consegue executar vários programas, gerenciar 
processos, memória e arquivos. Tudo isso faz parte de uma plataforma com memória, processador e outros recursos totalmente virtuais, sem 
dependência do hardware.

O que é JVM? 

A **JVM** é máquina virtual que executa programas Java, executando os **bytecodes** em linguagem de máquina para cada sistema operacional. 

Em linguagens compiladas diretamente para um sistema operacional (**SO**) específico, esse programa não irá executar em outro SO, havendo a 
necessidade de compilar uma versão do software para cada SO. 

Com o Java, compilamos para a JVM, o bytecode será executado pela máquina virtual, e não diretamente pelo SO, assim, o software escrito 
em Java possui portabilidade para qualquer sistema operacional, porém, cada JVM deve ser construída para um SO específico. 

O que é JRE? 

**JRE** significa **Java Runtime Environment, ou Ambiente de Execução do Java, é composto pela Java Virutal Machine (**JVM**), bibliotecas 
e APIs da linguagem Java e outros componentes para suporte da plataforma Java.

comando para instalar esse ambiente (exemplo para o Java 8 no Linux)   
sudo apt-get install openjdk-8-jre

O que é JDK? 

**Java Development Kit (JDK)**, **Kit de Desenvolvimento Java**, é um conjunto de utilitários que permitem criar software para a 
**plataforma Java**. É composto pelo **compilador** Java, **biblioteca** da linguagem, ferramentas e **JRE**.

comando para instalar esse kit (exemplo para o Java 8 no sistema Linux)   
sudo apt-get install openjdk-8-jdk

O que é Java SE? 

Java **Standard Edition** (SE), é a distribuição mínima da plataforma de desenvolvimento de aplicações Java.  

OpenJDK é a implementação de referência opensource da Plataforma Java, Java Se, que ainda é mantida pela Oracle.

https://openjdk.java.net/

O que é Java EE? 

Java **Enterprise Edition**, é uma extensão da Java **SE** que possui suporte a desenvolvimento de sistemas corporativos.

Além do mínimo da plataforma, o Java EE possui diversas especificações de partes da infraestrutura de aplicações, como acesso a banco de 
dados, mensageria, serviço web, parser de arquivo e outras.

Servidores de aplicação Java EE, sabem seguir essas especificações e implementar esses recursos para usuários. 

Ex.: JBoss (RedHat), Weblogic (Oracle), WebSphere (IBM) e Glassfish = Implementação de referência opensource : 
https://javaee.github.io/glassfish

O que é Jakarta EE?

Com a falta de investimento da Oracle no Java, ela cedeu todo o código, implementações e especificações do **Java EE** para a **Eclipse 
Foundation**, mas como o nome Java EE é uma marca registrada, foi escolhido o nome **Jakarta EE**.

Agora a evolução das específicações e padrões do Java será feito sob o nome Jakarta EE, com compatibilidade com o Java EE.

Agora um pouco de prática Java na "unha", mas no dia a dia profissional não tem porque fazer dessa forma. Fica para conhecimento.

basta fazer um arquivo .java, no caso foi o Hello.java feito com o comando touch mesmo

verificamos se temos o java com    
java -version

Para compilar esse código basta usar o comando   
javac Hello.java

com isso ele irá gerar um Hello.class que pode ser consultado (verificado) usando um ls ou ll.

para executar basta usar o comando   
java Hello  

podemos verificar a diferença dos arquivos com o comando cat

cat Hello.java

e

cat Hello.class

irão retornar coisas extremamente diferentes.

assim encerramos a aula! 
