programa
{
	
	funcao inicio()
	{
		cadeia nomes[] = { "André", "Thiago", "Bruno", "Carlos", "Cassio" }
		real alturas[] = { 1.71, 1.78, 1.75, 1.87, 1.71 }

		escreva("------------------\n")
		escreva("      Tabela      \n")
		escreva("------------------\n")

		para(inteiro posicao = 0; posicao < 5; posicao++)
		{
			escreva (nomes[posicao], "\t\t", alturas[posicao], "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 219; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */