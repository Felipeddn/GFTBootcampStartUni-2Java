# O que são listas - aula 2 - Bruno Dias

## Listas

Estrutura de dados do tipo lista, armazena dados de um determinado tipo em uma ordem específica.

A diferença entre listas e arrays é a de que as listas possuem tamanho ajustável, enquanto arrays possuem tamanho fixo. 

Existem dois tipos de listas: 

### Ligadas 

Na estrutura de lista do tipo existem os nós onde cada um dos nós conhece o valor que está sendo armazenado em seu interior além de conhecer o elemento posterior a ele: por isso ela é chamada de "lista ligada", pois os nós são amarrados com essa indicação de qual é o próximo nó.

### Duplamente ligadas

As listas duplamente ligadas constituem uma variação das listas ligadas.

A grande diferença das listas duplamente ligadas para as listas ligadas é que elas são bidirecionais. Vimos que, naturalmente, não conseguimos "andar para trás" em listas ligadas, pois os nós de uma lista ligada sabem somente quem é o proximo elemento. Nas listas duplamente ligadas, os nós sabem quem é o próximo elemento e quem é o elemento anterior, o que permite a navegação reversa.