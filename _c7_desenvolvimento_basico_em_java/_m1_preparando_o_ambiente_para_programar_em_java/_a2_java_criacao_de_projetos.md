# Aula 2 modulo 1 - Java - criação de projetos - André Luis Gomes 

Podemos iniciar um projeto ou contribuir para um projeto com git clone.

Para criar uma aplicação Spring Boot inicializamos o projeto no site Spring Initializr   
https://start.spring.io/ 

Acessando o site precisamos colocar algumas configurações 

O projeto em    
Maven

A linguagem que será   
Java

A versão do Spring Boot   
2.5.2

Group é onde costumamos colocar o nome da empresa que estamos trabalhando.

Artifact é o projeto que estamos trabalhando

Uma descrição para o projeto

Packaging   
Jar

Versão do Java   
11 

As dependências   
Spring Web  

Fazemos o download desse documento

https://qastack.com.br/programming/2374772/unzip-all-files-in-a-directory

O link acima me ajudou a descompactar o arquivo baixado do Spring Initializr

Agora basta adaptar o mesmo projeto para atender as configurações Gradle 

Mudamos o Projeto para   
Gradle  

O artifact para   
exemplo-gradle

fazemos o download desse projeto e descompactamos 

unzip exemplo-gradle.zip 

ele irá descompactar o projeto no diretório que ele está, recomendo que mova do diretório download para um diretório de sua preferência.

Com ambos os projetos descompactados agora abrimos ele no intellij.

Selecionamos o arquivo Pom.xml e abrimos como projeto. 

O intellej irá configurar todo o ambiente e buscar as dependências do mesmo.

No lado esquerdo temos alguns arquivos

No lado direito tem uma aba chamada Maven que será explicado pelo André futuramente.

Na pasta src 

Tem o arquivo mvnw - mavem wrapper, que cuida da questão de versões para não gerar conflitos com diversos profissionais atuando no projeto.

O arquivo pom.xml arquivo que descreve as dependencias do projeto e também algumas informações do projeto como o groupId, o nome do projeto 
a descrição e entre as tags parent informações do spring boot.

Na aba Maven dentro do diretório Lifecycle, existem todas as tarefas (Task) que o mavem pode executar no projeto as tarefas no momento 
disponíveis são:   
* clean   
* validate   
* compile   
* test   
* package   
* verify   
* install   
* site   
* deploy   

No diretório Plugin tem outras tarefas disponíveis para o projeto 

run - que inicia a aplicação 

voltando para o diretório do src existe o documento .gitignore que ignora alguns arquivos para não sobrecarregar o projeto no github e 
que podem ser obtidos aos interessados do projeto, ou que muda de ambiente para ambiente

Para iniciar o projeto vamos no diretório Maven ,do lado direito da tela, abrimos o diretório Lifecycle e executamos a tarefa (Task) 
install com dois cliques.

Já deu ruim (rs) esta dizendo que o JDK não foi específicado, a gente configura facil escolhendo configurar e escolhe o java, no meu caso 
o 11 sem dor e sem sofrimento, cliquei duas vezes novamente e ele mandou bala, sem dor programar é só alegria, eu amo isso!!

Está baixando uma série de dependências.

Segundo o André vai gerar o "jarzinho", após executar ele gerou um diretório target

O exemplo-maven-0.0.1-SNAPSHOT.jar é o arquivo executavel.

Podemos executar o arquivo abrindo a pasta Plugin, a dependência spring-boot spring-boot:run, com dois clique nesse arquivo rodamos nossa 
aplicação.

Parece que executou já que na IDE intellij apareceu as mensagens próximo ao exemplo no vídeo da DIO 

Para parar basta apertar o botão stop 'quadrado vermelho' no canto superior direito da IDE. ou ctrl+f2

Provavelmente deu certo porque abri uma janela no navegador para verificar e o resultado foi próximo ao do André.

Agora vamos executar via linha de comando.

Para isso acessamos a pasta do projeto, exemplo-maven no caso e haverá uma pasta chamada target que foi produzido na compilação. e vamos 
executar via linha de comando o arquivo.

`exemplo-maven-0.0.1-SNAPSHOT.jar` 

Para executar esse arquivo primeiro verificamos a instalação do Java com o comando   
java -version 

Agora o comando para executar o arquivo via linha de comando   
java -jar target/exemplo-maven-0.0.1-SNAPSHOT.jar

O comando foi executado ele deu um conflito porque a porta estava sendo usada pelo intellij dei um stop na aplicação no intellij executei o 
comando novamente pela linha de comando e tudo ok inclusive verifiquei isso no navegador, tudo ok e programar é só felicidade!

Agora um crtl + c para parar o projeto na linha de comando. 

Agora vamos verificar essas tarefas: abrir um projeto, compilar, executar e para com o gradle.

De volta no intellij abrimos outro projeto selecionando o arquivo build.gradle e abrindo ele como projeto.

Do lado direito da dela agora está presente o Gradle. Antes onde era o Maven Projects agora é Gradle projects. 

O build.grade tem um papel semelhante ao pom.xml, esse arquivo também trata de detalhes do projeto sua dependências e construções (build) 

No build script está a descrição da utilização do spring boot

O plugin de construção do gradle é o springboot gradle.

ainda no build script estão presente as configurações de group a versão do arquivo e a compatibilidade de java.

Na parte de repositórios do build.gradle está a informação de onde vem as dependências do projeto.

e nas dependências as dependencias do projeto, desculpa a redundância.

Algumas coisas similares são as pastas de testes, a presença do arquivo principal build.gradle, o gitignore.

O Gradle tem um ciclo de vida diferente do Maven mas carregam alguns conceitos similares. 

No Gradle o equivalente ao install do Maven seria a tarefa (Task) build que fica no diretório Task > build > build, vamos executa-lo.

A execução ocorreu numa boa sinalizado pela mensagem: BUILD SUCCESSFUL in 44s

No maven o install gera o diretório target e no Gradle o build gera o diretório build e dentro do diretório lib fica o arquivo executavel.

`exemplo-gradle-0.0.1-SNAPSHOT.jar` 

Agora vamos "rodar" essa aplicação na IDE e na linha de comando para demonstrar sua funcionalidade e desenvolver esse aprendizado.

vamos começar pela linha de comando.

acessamos o diretório exemplo-gradle e executamos o comando 

**java -jar build/libs/exemplo-gradle-0.0.1-SNAPSHOT.jar**

tudo ok, parece executar bem no terminal e responde no navegador.

ctrl + c para sair 

Pela IDE usamos o plugin e selecionamos o run o gradle já gera uma tarefa (task) para essa função o bootrun que fica dentro do diretório 
application

Basta dar dois cliques nessa tarefa e bora ser feliz. subiu o tomcat tudo certo e no navegador tudo ok também.

Aprendemos a criar o projeto e tambem compilamos e executamos, também encerramos sua execução.

Nossa aplicação funcionou!


















