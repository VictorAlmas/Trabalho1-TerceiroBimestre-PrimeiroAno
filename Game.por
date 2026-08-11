programa
{
	inclua biblioteca Util --> u
	
	inteiro CoorX = 0 // Coordenada
	inteiro CoorY = 0

	funcao inicio()
	{
		inteiro opcao
		logico menu_ativo = verdadeiro

		enquanto (menu_ativo)
		{
			limpa()

		// Tela de Início Simples
		escreva("=================================\n")
		escreva("          O ULTIMO ECO           \n")
		escreva("=================================\n")
		escreva(" 1 - INICIAR PROTOCOLO DE BUSCA(JOGAR)\n")
		escreva(" 2 - ARQUIVOS DE MEMORIA(HISTORIA)\n")
		escreva(" 3 - TRANSMISSAO DE CREDITOS\n")
		escreva(" 4 - INTERROMPER SISTEMA(SAIR)\n")
		escreva("=================================\n")
		escreva("Digite o codigo de acesso: ")
		leia(opcao)

	
		se (opcao == 1) // Lore
		{
			limpa()
			para(inteiro i=0; i < 5; i++)
			{
			limpa()
			escreva("Sintonizando a ultima frequencia de radio conhecida")
			para(inteiro g=0; g < 3; g++)
			{
				u.aguarde(200)
				escreva(".")
				u.aguarde(200)
			}
			}
			escreva("\n")
			u.aguarde(500)
			para(inteiro i=0; i < 5; i++)
			{
			limpa()
			escreva("Buscando sinais vitais no perímetro cósmico")
			para(inteiro g=0; g < 3; g++)
			{
				u.aguarde(200)
				escreva(".")
				u.aguarde(200)
			}
			}
			escreva("\n")
			executarjogo()
			menu_ativo = falso
			pare
			
		}
		senao se (opcao == 2)
		{
			limpa()
			escreva("===================== ARQUIVOS DE MEMÓRIA =====================\n\n")
					escreva(" O silêncio engoliu tudo. As cidades estão vazias e as estrelas\n")
					escreva(" parecem mais frias. Não há mais transmissões, não há mais vozes.\n")
					escreva(" Você capta um pulso fraco no radar. Um último eco humano.\n\n")
					escreva(" OBJETIVO: Siga o sinal. Descubra se você realmente está sozinho.\n")
					escreva("===============================================================\n")
					escreva("Pressione ENTER para retornar ao terminal...")
					aguardarEnter()
					pare

		}
		senao se (opcao == 3)
		{
			limpa()
			escreva("=================== TRANSMISSÃO DE CRÉDITOS ===================\n\n")
					escreva(" Desenvolvedores: Ayka E., Victor H., Lucas G. \n")
					escreva(" Interface de Desenvolvimento: Portugol Studio\n")
					escreva(" Atmosfera: Suspense Sci-Fi / Sobrevivência\n\n")
					escreva("===============================================================\n")
					escreva("Pressione ENTER para retornar ao terminal...")
					aguardarEnter()
					pare

		}
		senao se (opcao == 4)
		{
			limpa()
			para(inteiro g=15; g > 0; g--)
			{
				limpa()
				escreva("Conexão encerrada. O último eco se apagou no vácuo")

			para(inteiro i=0; i < g; i++)
			{
				escreva(".")
				u.aguarde((i*10)+20)
			}
			}
			escreva("\n")
			limpa()
			escreva("Conexão encerrada. O último eco se apagou no vácuo")
			menu_ativo = falso
			pare
			//Conexão encerrada. O último eco se apagou no vácuo
		
		}
		senao
		{
			limpa()
			escreva("Opção errada! Rode o programa de novo.\n")
		}
	}
}


	// Inicio do joguinhozinho
	funcao executarjogo()
	{
		limpa()
		escreva("=========================================================================\n")
		escreva("                           CONEXÃO ESTABELECIDA                          \n")
		escreva("=========================================================================\n\n")
		u.aguarde(500)
		escreva("Estática ecoa pelos alto-falantes da sua cabine.\n")
		escreva("O monitor pisca com uma linha de código piscando em verde...\n\n")

		CoorX = sorteia(0 , 10)	// Coor = Coordenada
		CoorY = sorteia(0 , 10)

		u.aguarde(5000)
	}

	// Função p segurar o menu e evitar que ele feche direto
	funcao aguardarEnter()
	{
		cadeia pausa
		leia(pausa)
	}
}

	
