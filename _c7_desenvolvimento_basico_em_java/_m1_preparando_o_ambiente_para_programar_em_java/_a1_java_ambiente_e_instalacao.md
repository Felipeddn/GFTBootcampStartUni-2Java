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
