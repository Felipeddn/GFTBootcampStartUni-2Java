programa
{
	inclua biblioteca Util --> u //--> talvez esse simbolo cria um apelido para a biblioteca útil.
	
	funcao inicio()
	{
		const inteiro TAMANHO = 	5
		

		inteiro matriz[TAMANHO][TAMANHO]

		para(inteiro linha = 0; linha < TAMANHO; linha++ )
		{
			para(inteiro coluna = 0; coluna < TAMANHO; coluna++ )
			{
				matriz[linha][coluna] = u.sorteia(1, 9)

				escreva("[", matriz[linha][coluna], "]")
			}

			escreva("\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 109; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */