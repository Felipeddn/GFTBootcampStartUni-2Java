* Introdução ao Git e GitHub - Otávio Reis

# Navegação  básica no terminal 

GUI x CLI

**GUI** (graphic user interface) - tela visual com os diversos comandos possíveis disponíveis por cliques em botões ou check em caixas vazias, etc.

**CLI** (command line interface) - comandos escritos em uma tela onde o visual não foi elaborado para agradar e tornar tudo tão responsivo, em um ambiente de servidor recursos computacionais são otimizados para melhorar o desempenho da aplicação uma gui consome mais recurso o que não é interessante para computadores com proprositos de servidor. 

* Diferenças entre Windows e Unix-like

O terminal do windows é chamado de bash e dos sistemas unix-like é shell.
Podemos inserir flags (bandeiras?), argumentos na frente dos comandos, para trazer uma funcionalidade específica ao comando.

- Windows - Terminal Shell

**comando** + `flags` - explicação do comando.

**cd** `nome_do_diretório` (change directory) - comando para navegar entre os diretórios (pastas) do sistema operacional.  

**cd** `/` - comando que vai para a pasta do disco C: sistema, a raiz do sistema windows não é acessível.  

**cd** `..` - comando com atalho (..) que muda para o diretório acima do ponto atual.

**cls** - comando que "limpa" o terminal, para melhorar a visualização no terminal.

**dir** () - comando para listar conteúdo de uma diretório (pasta).

**mkdir** (make a directory) - comando para criar um diretório (pasta).

**del / rmdir** (delete / remove a directory) - comando para excluir (delete) apenas arquivos, comando para  remover diretórios(rmdir).

**rmdir**  nome_do_diretorio `S/ Q/` - comando para remover diretório com arquivo.

Site que explica as flags s/ e q/  
https://docs.microsoft.com/pt-br/windows-server/administration/windows-commands/rmdir  

`s/` - Exclui uma árvore de diretórios (o diretório especificado e todos os seus subdiretórios, incluindo todos os arquivos).  

`q/` - Especifica o modo silencioso. Não solicita confirmação ao excluir uma árvore de diretórios. O parâmetro /q só funcionará se /s também for especificado.  
Cuidado: Quando você executa no modo silencioso, toda a árvore de diretórios é excluída sem confirmação. Certifique-se de que arquivos importantes sejam movidos ou submetidos a backup antes de usar a opção de linha de comando /q .

**&uparrow;** - atalho para visualizar os comandos já executados. (mesmo comando em unix-like)

**echo** - comando para repetir no terminal um texto

**echo >** nome_do_arquivo - comando para salvar um texto em um arquivo, se o arquivo não existir ele cria um.


- Unix-like (sistemas operacionais derivados do unix como MacOS ou as distribuições de Linux) - Terminal Bash

**cd** *nome_do_diretório* (change directory) - comando para navegar entre os diretórios (pastas) do sistema operacional.

**cd** `/` - comando que vai para a pasta raiz do sistema.  

**cd** `..` - comando com atalho (..) que muda para o diretório acima do ponto atual.

**clear** ou **ctrl + l** (atalho) - comando que "limpa" o terminal, muito útil para evitar alguns erros de digitação e melhorar a visualização da tela no terminal.

**Tab** - alto completa nomes de arquivos e diretórios.(mesmo comando no Windows)

**ls** (list) - comando para listar conteúdo de uma diretório (pasta).

**mkdir** (make a directory) - comando para criar um diretório (pasta).

**rm / -rf** (remove / remove a file) - comando para excluir (rm) um diretório vazio ou arquivo (-rf).

**rm** `-rf` - (rf = recursive force) - rf é a flag onde r é (recursive) para excluir toda a arvore de diretório e arquivos ,diretório dentro de diretório e arquivo dentro de diretório, e f (force) para não exibir confirmações para o comando.

Tenha em mente que os terminais não parabeniza :laughing: por comandos que deram certo mas que ele sempre alerta :confounded: para comandos errados.
