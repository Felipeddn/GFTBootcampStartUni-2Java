programa
{
	
	funcao inicio()
	{
		inteiro vetor[] = {1, 3, 5, 7, 9}
		inteiro numero
		logico achou = falso

		escreva("Digite um número e verificaremos se ele está no vetor: ")
		leia(numero)

		para (inteiro posicao = 0; posicao < 5; posicao++){

			se(vetor[posicao] == numero){
				escreva("Encontrado na posição: ", posicao, "\n")
				achou = verdadeiro
			} 
		}

		se (nao achou)
		{
			escreva("O número não está presente no vetor")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 400; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */