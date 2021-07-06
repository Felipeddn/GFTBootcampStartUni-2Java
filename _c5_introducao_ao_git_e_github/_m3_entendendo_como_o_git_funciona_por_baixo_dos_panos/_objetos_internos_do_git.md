* Introdução ao Git e GitHub - Otávio Reis

# Objetos git

* Blobs (Bolhas)

um comando com uma função git
**echo** 'conteudo' | git hash-object `--stdin`
fc31e91b26cf85a55e072476de7f263c89260eb1

um comando para gerar um sha1
**echo** `-e` 'conteudo' | openssl sha1
(stdin)= 65b0d0dda479cc03cce59528e28961e498155f5c

o que é a flag `-e`?

o blob (bolha) é um outro tipo de sha1 (hash) os arquivos ficam guardados dentro do objeto blob com metadados.

$ echo -e 'blob 9\0conteudo' | openssl sha1
(stdin)= fc31e91b26cf85a55e072476de7f263c89260eb1

o git salva arquivos dentro de um sha com metadados dentro do objeto blob

* Tree (Árvores)  
https://git-scm.com/book/en/v2/Git-Internals-Git-Objects

As trees (arvores) armazenam blobs, o nome do arquivo e um código sha1.   
parece que mudanças de sha1 informa para o git mudanças em arquivos, explicando a capacidade do git de sempre sinalizar mudanças.

* Commits

Commit é o objeto que aponta para uma tree, parente, autor, mensagem e timestamp
esse objeto carrega informações úteis para compreender sobre o projeto.

* Git - Sistema Distribuído Seguro

Porque o Git é um Sistema Distribuido Seguro? 
Porque qualquer mudança é monitorada e o Git informa o que mudou, quem mudou e em qual momento ocorreu essa mudança. Isso garante a segurança, por isso o git é **seguro**.

Como o código pode ser trabalhado por diversas pessoas contendo os códigos em suas máquinas, esse código está localizado em diversas máquinas ao mesmo tempo garantido uma tipo de backup, cópia segura, por isso ele é **distribuído**.

Pense no Git como uma camera de segurança que está olhando para os arquivos 24 horas por dia 7 dias por semana, e se alguém entrar lá e escrever algo ou fazer algo em alguma coisa nesse local monitorado a camera poderá pegar. Isso para trabalho em equipe é importante para compreender quem são os responsáveis por mudanças no código.