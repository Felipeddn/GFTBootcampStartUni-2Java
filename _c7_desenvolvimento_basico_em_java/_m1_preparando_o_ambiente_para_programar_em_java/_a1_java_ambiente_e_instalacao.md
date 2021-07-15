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

A partir daqui a instalação será realizada no Ubuntu vou tentar seguir os comandos da aula 

apesar que ele está instalando a versão 10 do Java e eu prefiro a versão onze então vou buscar um recurso externo para tal instalação.

Esse tutorial tem passos bem parecido 

https://www.vivaolinux.com.br/dica/Como-instalar-o-Oracle-Java-11-no-Debian-Ubuntu-e-derivados

como eu recebi essa mensagem e sou bastante curioso vou deixar anotado aqui nela também tem links importantes:

Oracle Java 11 (LTS) and 16 installer for Ubuntu (21.04, 20.10, 20.04, 18.04, 16.04 and 14.04), Pop!_OS, Linux Mint and Debian.

Java binaries are not hosted in this PPA due to licensing. The packages in this PPA download and install Oracle Java, so a working Internet connection is required.

The packages in this PPA are based on the WebUpd8 Oracle Java PPA packages: https://launchpad.net/~webupd8team/+archive/ubuntu/java

Created for users of https://www.linuxuprising.com/

Installation instructions (with some tips), feedback, suggestions, bug reports etc.:

Oracle Java 11: https://www.linuxuprising.com/2019/06/new-oracle-java-11-installer-for-ubuntu.html
Oracle Java 16: https://www.linuxuprising.com/2021/03/how-to-install-oracle-java-16-on-debian.html

Important notice regarding Oracle Java 11 and newer: the Oracle JDK license has changed starting April 16, 2019. The new license permits certain uses, such as personal use and development use, at no cost -- but other uses authorized under prior Oracle JDK licenses may no longer be available. A FAQ is available here: https://www.oracle.com/technetwork/java/javase/overview/oracle-jdk-faqs.html . After this change, new Oracle Java 11 releases (11.0.3 and newer) require signing in using an Oracle account to download the binaries. This PPA has a new installer that requires the user to download the Oracle JDK 11 .tar.gz and place it in a folder, and only then install the "oracle-java11-installer-local" package. Details here:  https://www.linuxuprising.com/2019/06/new-oracle-java-11-installer-for-ubuntu.html

About Oracle Java 10, 12, 13, 14 and 15: These versions have reached the end of public updates, therefore they are longer available for download. The Oracle Java 10/12/13/14/15 packages in this PPA no longer worked due to this, so I have removed them. Switch to Oracle Java 11 or OpenJDK 11 instead, which is long term support, or the latest Oracle Java 16.
 Mais informações: https://launchpad.net/~linuxuprising/+archive/ubuntu/java

O comando para instalar é diferente do vídeo eu vou instalar o Java 11

Para o Java 11 parece que tem uma opção que não pode ser usada algo do tipo ou uma condição de uso, então a instalação segue um caminho um 
pouco diferente.

esse link está ajudando nesse processo de instalação

https://www.edivaldobrito.com.br/oracle-java-11-no-ubuntu/


Para instalar o Java no Ubuntu só consegui através desse vídeo 

https://www.youtube.com/watch?v=eCjDjMBNn3Y

Porque existe algum problema relacionado a uma conta Oracle que deve ser realizado o login.

Enfim consegui instalar!!

Realizando o download de todas as ferramentas 

Download do Gradle

acessar o site  
https://gradle.org/

Na página procurar pelo botão "1. install gradle" 

fazer o download no "step 1. Download..." 

Escolher a opção "Download: binary-only..."

Download do Maven 

https://maven.apache.org/

Na opção use no site selecione "Download"

Na página de download selecione a opção "Binary zip archive" selecione o arquivo na coluna link.

Download do Intellij

https://www.jetbrains.com/pt-br/idea/download/#section=linux

Selecione o botão download da versão "Community" que é gratuita.

Após os downloads podemos começar as instalações

Instalando o Gradle no Linux Ubuntu

Selecionar a instalação manual e seguir os passos do site:   
$ mkdir /opt/gradle

supondo que você faça o comando da pasta onde o gradle foi salvo do download   
$ unzip -d /opt/gradle gradle-7.1.1-bin.zip

Para verificar o download   
$ ls /opt/gradle/gradle-7.1.1
LICENSE  NOTICE  bin  getting-started.html  init.d  lib  media

configurando a variável de ambiente   
export PATH=$PATH:/opt/gradle/gradle-7.1.1/bin

comando para verificar instalação do gradle    
gradle -v

Durante a verificação da instalação não foi encontrado o java e quando executo o comando java -version ou java -v diz que o java não está 
instalado, então vou ter que voltar para o passo da instalação. Ou seja do início.

vou tentar seguir os passos desse tutorial imagino que faltou uma chave de instalação, mas achei estranho porque segui os passos do vídeo 
e imaginei que havia conseguido instalar o java.    
https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04-pt

Inclusive vou instalar o openjdk11 

no momento da instalação da jre padrão retornou esse erro

problemas de dependência - deixando desconfigurado   
Erros foram encontrados durante o processamento de:   
 oracle-java11-installer-local   
 default-jre-headless   
 default-jre   
E: Sub-process /usr/bin/dpkg returned an error code (1)   



consultei esse forum por conta desse erro   
https://www.guj.com.br/t/configurando-java-no-ubuntu-pacotes-nao-totalmente-instalados-ou-removidos/402901/11

https://stackoverflow.com/questions/57208665/oracle-jdk-11-error-occuring-every-time-i-install-anything-in-terminal

Segui todos os passos desse tutorial novamente para configurar ambiente e tudo mais e estava tudo certo. Vamos ver agora. com o gradle -v

https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04-pt

agora está dizendo que o gradle não está instalado.

vou seguir o passo a passo do vídeo da DIO para a instalação do gradle

comando gradle -v e tudo ok

Agora foi! 

Agora o passo a passo para o Maven 

comando mvn -v e tudo ok

Aplicando os wrappers para evitar conflitos de ferramentas de build.

gradle wrapper 

A construção falhou mas a gente sabe porque vamos tentar a solução do CentOS 8

isso mesmo é necessário criar um arquivo vazio como dito no stackoverflow, fiz isso com o comando   
touch build.gradle

agora o ./gradlew -v funciona

Temos que usar isso para que os envolvidos no projeto possa usar a mesma versão do glade.

ele faz o download também.

agora o wrapper do maven 

mvn -N io.takari:maven:wrapper 

daí para ver a versão é so usar o comando    
./mvnw -v 

tudo ok.

agora instalação do intellij

primeiro "descompactar" o arquivo 

sudo tar -xzf ideaIC-2021.1.3.tar.gz

Dessa forma ele cria uma pasta com esse conteúdo 

podemos ver essa pasta com o comando **ll** ou **ls** e acessamos com **cd** **nome_da_pasta**   
cd pasta_criada   
cd bin

pronto dentro da pasta bin podemos executar o comando   
./idea.sh

Aceitamos os termos de uso. De uma lida antes.

E já podemos criar um projeto ou abrir um projeto. 

Fim da aula e os ambientes todos configurados o Linux Ubuntu deu trabalho rs.

Eu resolvi instalar essa aplicação direto no windows pois acredito que vou ganhar uma produtividade, não havia feito antes porque quero deixar meu windows limpo e usar máquinas 
virtuais acho que é uma estratégia valida já que muito do que vou fazer é no ambito de aprendizado, dessa forma eu não sobre carrego meu sistema operacional com diversas 
ferramentas, mas no caso do Java achei interessante então vou instalar

Estou me guiando por esse vídeo 

https://www.youtube.com/watch?v=A76YPtMcMHY, contribuição de um colega chamado Kaique, dessa forma fica registrado aqui meu agradecimento por esse auxilio valioso.

A instalação do Java foi fácil e rapida o download foi realizado pelo site:

https://www.oracle.com/java/technologies/javase-jdk11-downloads.html

A instalação é realmente simples dois next e ele já instalou e deixou um link para informações mais aprofundadas

https://docs.oracle.com/en/java/javase/11/

Após a instalação configuramos as variaveis de ambiente 

Na barra de pesquisa do windows digite variaveis de ambiente, caso apareça antes mesmo de terminar escolha **Editar as variáveis de ambiente do sistema**

abrirá uma janela escolha a aba avançado e aperte o botão variáveis de ambiente

Em **Variáveis de usuário para ...** aperte o botão novo

abrirá uma janela pedindo o nome da variável (JAVA_HOME) e o valor da variável (o caminho da instalação do java, quando você está clicando em next tem lá anota em um papel se tiver dificuldades com essa etapa.)

Apos inserir as informações e digitar ok agora é hora de selecionar **Path** nas **Variáveis do sistema** apertar o botão **editar**, abrirá uma janela selecione **novo** e colocar o caminho da instalação mais **\bin** no fim do nome.

Se tudo der certo basta abrir o Prompt de comando e digitar **java --version**

se o retorno for algo assim:

java 11.0.11 2021-04-20 LTS
Java(TM) SE Runtime Environment 18.9 (build 11.0.11+9-LTS-194)
Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.11+9-LTS-194, mixed mode)

está tudo ok.

Instalando o Gradle

No site https://gradle.org/ aperte o botão **1. install gradle** e na página que abrir escolha a opção Installing manually, no step 1 clique em download abrirá mais um página

Nessa página haverá diversas versões eu escolhi a mais recente 7.1.1 mas vai da sua necessidade e projeto que está trabalhando, no vídeo a Beatriz sugere a versão completa vou 
baixar essa versão por segurança mas acredito que o binario (binary) seria o suficiente.

Baixado ele virá zipado (compactado) no processo de descompactação você pode escolher o caminho selecione na pasta Java dentro de arquivos e programas, ou antes de descompactar recorte esse arquivo e descompacte ele na pasta Java, talvez seja necessário dar autorização de administrador para esse processo, leia com atenção e conceda.

Copie o caminho do gradle mas da pasta bin 

e abre a variável de ambiente novamente selecione path nas variaveis de usuario, esse processo já foi realizado então se for necessário leia ele acima, clique em editar, depois em novo, cole o caminho que foi copiado. digite ok até sair das janelas.

Para verificar se funcionou digite o comando no prompt de comando   
gradle --version

se aparecer algo parecido com isso tudo ocorreu certo

Welcome to Gradle 7.1.1!

Here are the highlights of this release:
 - Faster incremental Java compilation
 - Easier source set configuration in the Kotlin DSL

For more details see https://docs.gradle.org/7.1.1/release-notes.html


------------------------------------------------------------
Gradle 7.1.1
------------------------------------------------------------

Build time:   2021-07-02 12:16:43 UTC
Revision:     774525a055494e0ece39f522ac7ad17498ce032c

Kotlin:       1.4.31
Groovy:       3.0.7
Ant:          Apache Ant(TM) version 1.10.9 compiled on September 27 2020
JVM:          11.0.11 (Oracle Corporation 11.0.11+9-LTS-194)
OS:           Windows 10 10.0 amd64

Agora vou instalar o Maven

Acessei o site https://maven.apache.org/

aperte no download em use, abrirá uma nova janela selecione o arquivo na parte debaixo do site selecione a opção binary zip arquive na coluna do link, ele iniciará o download automáticamente.

Após o download extraia o arquivo na pasta Java.

Copie o caminho da pasta maven, abra as variaveis de ambiente, em variaveis de usuario selecione o botão novo, digite no nome da variável M2_HOME e coloque o caminho da pasta na opção valor de variável

Selecione Path e aperte editar, cole o caminho nele também mas adicione o \bin

Para verificar abra o prompt de comando e digite o comando    
mvn -version 

se aparecer o seguinte resultado estará tudo ok

Maven home: C:\Program Files\Java\apache-maven-3.8.1\bin\..
Java version: 11.0.11, vendor: Oracle Corporation, runtime: C:\Program Files\Java\jdk-11.0.11
Default locale: pt_BR, platform encoding: Cp1252
OS name: "windows 10", version: "10.0", arch: "amd64", family: "windows"

tudo ok com as ferramentas agora é instalar o IDE intellij.

acessei o link https://www.jetbrains.com/pt-br/idea/download/#section=windows apertei no botão baixar da versão community

Depois de baixar basta dois cliques next, escolha onde salvar recomendo deixar o local sugerido clique next, ele vai perguntar se deseja criar um shortcut ou atalho na area de trabalho fique a vontade para escolher, na mesma tela se deseja criar uma variavel no path, e quais arquivos você deseja associar, escolhi java e groovy a opção de contexto de menu eu marquei por um detalhe do curso que eu acredito que tem a ver e cliquei next, cliquei install e agora só ser feliz.

Ele perguntou se eu desejava reiniciar eu escolhi depois porque estava com outras tarefas abertas e pronto ambiente configurado super fácil, maravilha de ambiente.

