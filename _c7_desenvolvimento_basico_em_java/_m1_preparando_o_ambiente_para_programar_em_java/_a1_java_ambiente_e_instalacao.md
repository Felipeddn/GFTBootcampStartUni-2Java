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