* Introdução ao Git e GitHub - Otávio Reis

# Primeiros comandos com Git

* Iniciar o Git
**git init** - inicia o monitoramento de arquivos pelo Git

Quando iniciamos o monitoramento podemos verificar isso com o comando **ls -a** para verificar o arquivo oculto `.git`

* configurando o usuario e o email de usuario

**git config --global user.email** "o email que você deseja usar"  
**git config --global user.name** "o nome de usuário que você deseja usar para ser identificado"

* Iniciar o versionamento
**git add** - adiciona um arquivo para além de ser monitorado ser armazenado seu estado

* Criar um commit
**git commit** - confirma o estado do arquivo e registra esse estado que pode ser recuperado!

**git commit** `-m` - Registra o estado e relaciona uma mensagem a esse objeto git para facilitar sua identificação entre os objetos commitados criados.  
commit é comprometer-se em português.

Criando repositorio

comando para criar uma pasta:
**mkdir** nome_do_diretorio

comando para ver arquivos ocultos no bash do git:
**ls** `-a`

o diretorio do Git possui algumas estruturas referente ao gerenciamento de versionamento.

* Adicionando uma arquivo
**touch** nome_do_arquivo

Iremos utilizar um arquivo markdown 

níveis de titulos no markdown
# Titulos de nível 1
## Titulos de nível 2
### Titulos de nível 3
#### Titulos de nível 4
##### Titulos de nível 5
###### Titulos de nível 6

Markdown pode deixar nossos textos mais sofisticado visualmente.  
Um editor de texto markdown é o Typora que pode ser obtido nesse link: https://typora.io/#windows

Veja como usar alguns recursos para mudar visualmente seu markdown.

**Negrito**
*Italico*
:chicken: uma galinha

- círculo de tópico
- outro círculo de tópico

O typora possui uma referência de markdown

## listas sem ordenação no markdown
* essa
* lista não é 
* ordenada

## essa lista é ordenada
1. pokemon red
2. pokemon green
3. pokemon blue

## lista de tarefas
- [x] nascer
- [x] crescer
- [x] viver
- [x] codar
- [] morrer - não está nos meus planos de vida rs

site para emoji: 
https://emojipedia.org/