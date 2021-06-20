* Introdução ao Git e GitHub - Otávio Reis

# GitHub

Para usar o git e github o ideal é algumas configurações de email e usuário serem parecidas na plataforma Git e Github. 

para verificar suas configurações use o comando:  
**git config** `--list`

comando para reiniciar as configurações do Git:  
**git config** `--global --unset` propriedade_que_deve_ser_reconfigurada

Quando usamos o comando acima ele retira as configurações que fizemos e para os atributos email e usuário ele não mostra mais quando usamos o comando **git config** `--list`. 

comando para configurar email do usuario:  
**git config** `--global user.email` "email_do_usuario", sempre entre aspas.

comando para configurar apelido do usuario:  
**git config** `--global user.nickname`  "apelido", sempre entre aspas.

O Github é o local onde armazenamos nossos códigos remotamente.

Arquivos Readme normalmente são usados para explicar do que se trata o projeto hospedado no GitHub, é uma convenção não uma regra. Para quem está iniciando é excelente praticar bastante texto nesse modelo de arquivo para compreender todas as   funcionalidades.

comando para enviar arquivos armazenados localmente (no seu computador) para um servidor (computadores que são usados com o objetivo de armazenar e fornecer dados, se for localmente servidor se for na web servidor na nuvem). Na primeira vez que fazemos isso precisamos usar o comando abaixo.

**git remote add** `origin`    url_do_site_do_github_com_seu_repositório
origin é um apelido que damos ao nosso repositorio remoto, esse nome é comumente atribuido a um repositório remoto por convenção.

para listar os repositorios remotos cadastrado em um projeto usamos:  
**git remote** `-v` 

normalmente esse comando acima retorna algo assim   
origin https://github.com/seu_nome_de_usuario/o_nome_do_seu_repositorio.git  

origin é apenas um apelido para digitir ao invés do link.

comando para enviar nossos arquivos localmente para um servidor  
**git push** `origin` `master`  
 (a microsoft está recomendando `main`, o github foi comprado pela microsoft)


