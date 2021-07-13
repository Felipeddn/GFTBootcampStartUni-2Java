# Aula 1 - Java instalação e ambiente - André Luis Gomes 

André Luis Gomes

Especialista em desenvolvimento de software - Invillia 

A instalação ocorreu no ubuntu vou verificar se consigo fazer no CentOS 8

mas vou fazer no Linux também para fins de aprendizado

Vou tentar seguir esse passo a passo para instalar o Java (JDK 11) no CentOS 8

https://computingforgeeks.com/how-to-install-java-11-openjdk-11-on-rhel-8/

https://pt.joecomp.com/how-install-java-centos-8

Esse é um bom link também mas em todos eles estou com problemas para seguir na etapa de configuração da variável de ambiente
estou preso nessa etapa.

Consegui configurar a variável de ambiente através desse tutorial    
https://www.linode.com/docs/guides/how-to-install-openjdk-on-centos-8/

consegui dar prosseguimento no desenvolvimento do projeto mas tive um problema na hora de testar o java até compilei o arquivo mas tive problema na execução parece que está desatualizado.

Error: A JNI error has occurred, please check your installation and try again
Exception in thread "main" java.lang.UnsupportedClassVersionError: HelloWorld has been compiled by a more recent version of the Java Runtime (class file version 55.0), this version of the Java Runtime only recognizes class file versions up to 52.0

tentei resolver o erro acima com um comando para atualizar que eu vi nesse tutorial 

https://computingforgeeks.com/how-to-install-java-11-openjdk-11-on-rhel-8/

eu não estou conseguindo executar mesmo assim, porém no vs code consegui executar tranquilamente, talvez no intellij tudo ocorra ok também, vou tentar instalar tudo no ubuntu mesmo e depois eu tento no CentOS 8. Pelo menos imagino que o Java está instalado e que a variável de ambiente está configurada. 

Instalando Gradle no CentOS 8 

https://gradle.org/

Vou iniciar a partir desse tutorial caso eu obtenha alguma dificuldade eu sinalizo e coloco outros links necessários, também vou seguir alguns passos do vídeo.

https://linuxize.com/post/how-to-install-gradle-on-centos-8/

download do maven

https://maven.apache.org/

Segui os passos e comandos do curso no CentOS 8 e instalei numa boa, só precisei fazer algumas adaptações por conta da versão do Gradle e do Maven. tudo instalado no CentOS 8.

Os comandos para verificar se ocorreu tudo bem com a instalação é :

`gradle -v` e `mvn -v` 

Gradle é uma ferramenta mais nova e Maven é uma ferramenta mais antiga, pelo que observei do comando `mvn -v` é que parece que eu não configurei a variavel path do java e verificando no diretório /usr/lib/jvm tem um monte de pasta e dentro delas arquivos bin então estou pensando em configurar o bin da pasta java-11! vou retomar a etapa de configurar a variável de ambiente e tentar fazer isso. Feito qualquer coisa acho importante consultar essa etapa para mudar para um jdkopen ou algo do tipo. eu percebi que ele estava configurado de outra forma agora não sei qual deixar

antes:

Apache Maven 3.8.1 (05c21c65bdfed0f71a2f2ada8b84da59348c4c5d)
Maven home: /opt/maven/apache-maven-3.8.1
Java version: 1.8.0_292, vendor: Red Hat, Inc., runtime: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el8_4.x86_64/jre
Default locale: pt_BR, platform encoding: UTF-8
OS name: "linux", version: "4.18.0-305.7.1.el8_4.x86_64", arch: "amd64", family: "unix"

depois: 

Apache Maven 3.8.1 (05c21c65bdfed0f71a2f2ada8b84da59348c4c5d)
Maven home: /opt/maven/apache-maven-3.8.1
Java version: 11.0.11, vendor: Red Hat, Inc., runtime: /usr/lib/jvm/java-11-openjdk-11.0.11.0.9-2.el8_4.x86_64
Default locale: pt_BR, platform encoding: UTF-8
OS name: "linux", version: "4.18.0-305.7.1.el8_4.x86_64", arch: "amd64", family: "unix"


Não curti muito não rs acho que vou modificar para voltar o que era antes. Parece que consegui mas foi preocupante rs.

O Maven trabalha com XML - foi criado por pessoas que estavam incomodadas de usar ent.

O gradle - é uma ferramenta nova que usa o grove para descrever a build (construção) e as tasks do build (tarefas de construção) 

Um problema que enfrentamos no dia a dia de projetos.

Instalamos duas ferramentas de build, Gradle e Maven, isso pode gerar incompatibilidade de versões e para resolver isso foram criados wrapper para ferramentas de construção. vou tentar seguir os comandos no CentOS 8.

Retornou um erro, acho que vai dar ruim 

Starting a Gradle Daemon (subsequent builds will be faster)

FAILURE: Build failed with an exception.

* What went wrong:
Executing Gradle tasks as part of a build without a settings file is not supported. Make sure that you are executing Gradle from a directory within your Gradle project. Your project should have a 'settings.gradle(.kts)' file in the root directory.

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

* Get more help at https://help.gradle.org

BUILD FAILED in 18s

vou tentar o comando com isso:

gradle wrapper --stacktrace

falhou também.

Consegui resolver meu problema fazendo isso

fui ao direitório que está o curso da GFT crie uma diretório com o nome projeto_gradle   
**mkdir projeto_gradle** 

depois fiz um arquivo como recomendado nesse tutorial https://stackoverflow.com/questions/60928739/executing-gradle-without-a-settings-file-has-been-deprecated-how-to-write-a-se

**touch build.gradle** 

executei o comando:   
**gradle wrapper**

e funcionou.

Segui o comando da aula:   
**./gradlew -v** 

E ele começou a fazer um download, e depois mostrou a versão.

Essa parte de mesmo arquivo de Build não ficou tão clara. Mas consegui visualizar.

Agora o comando para o Maven   
**mvn -N io.takari:maven:wrapper**

tudo ok com o comando.

Iremos usar os wrappers para não depender da versão instalada. Bem legal isso agora ficou mais claro, todo mundo fica na mesma página com esse comando.

download do intellij

https://www.jetbrains.com/pt-br/idea/

Segui os passos do video da DIO.

Enfim finalizado a aula e tudo certo. No CentOS 8 no Linux Ubuntu o download ainda está em andamento.