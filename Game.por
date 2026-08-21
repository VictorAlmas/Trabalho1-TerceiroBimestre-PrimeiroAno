programa 
{
	inclua biblioteca Util --> u
	
	inteiro CoorX = 0 // = Coordenada
	inteiro CoorY = 0
	inteiro CoorXAlien = 0 
	inteiro CoorYAlien = 0	
	inteiro opcao
	caracter andar
	logico menu_ativo = verdadeiro
	
	funcao Sair()
	{
		limpa()
		para(inteiro g=15; g > 0; g--)
		{
			limpa()
			escreva("Conexão encerrada. O último eco se apagou no vácuo")
			
			para(inteiro i=0; i < g; i++)
			{
				escreva(".")
			}
			
			u.aguarde(500)
		}
		escreva("\n")
		limpa()
		escreva("Conexão encerrada. O último eco se apagou no vácuo")
		u.aguarde(1000)
		limpa()
		menu_ativo = falso
		retorne
	}
	
	funcao Creditos()
	{
		limpa()
		escreva("=================== TRANSMISSÃO DE CRÉDITOS ===================\n\n")
		escreva(" Desenvolvedores: Ayka E., Victor H., Lucas N. \n")
		escreva(" Interface de Desenvolvimento: Portugol Studio\n")
		escreva(" Atmosfera: Suspense Sci-Fi / Sobrevivência\n\n")
		escreva("===============================================================\n")
		escreva("Pressione ENTER para retornar ao terminal...")
		aguardarEnter()
		retorne
	}
	
	funcao Jogunho()
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
			escreva("Desativando modo de sobrevivência em estado de criogenia acordar sobrevivente\n\n")
			escreva("Buscando sinais vitais no perímetro cósmico")
			
			para(inteiro g=0; g < 3; g++)
			{
				u.aguarde(200)
				escreva(".")
				u.aguarde(200)
			}
		}
		
		limpa()
		escreva("=========================================================================\n")
		escreva("                           CONEXÃO ESTABELECIDA                          \n")
		escreva("=========================================================================\n\n")
		u.aguarde(500)
		escreva("Estática ecoa pelos alto-falantes da sua cabine.\n\n")
		escreva("O monitor pisca com uma linha de código piscando em vermelho...\n\n")
		u.aguarde(1500)
		escreva("Há mais um passageiro a bordo dessa nave.\n\n")
		u.aguarde(4500)
		escreva("ALERTA DE SEGURANÇA: Intruso detectado a bordo da nave.\n\n")
		u.aguarde(1000)
		escreva("Espécie não identificada.\n\n")
		u.aguarde(3000)
		escreva("Iniciando protocolo de orientação para sobrevivente.\n\n")
		u.aguarde(2000)
		escreva("Você está na sala principal de criogenia.\n\n")
		u.aguarde(2500)
		escreva("Há outras salas que poderão ajudá-lo a sobreviver.\n\n")
		u.aguarde(1000)
		escreva("Há a sala de mantimentos, a sala de armamentos e a sala de auxílio médico.\n\n")
		u.aguarde(1000)
		escreva("Elas correspondem às três últimas portas do corredor principal, respectivamente.\n\n")
		u.aguarde(1000)
		escreva("Entrando em modo de suporte de vida e manutenção.\n\n")
		u.aguarde(1000)
		escreva("Ativando estufa para melhorar o fluxo e a qualidade do ar.\n\n")
		u.aguarde(1200)
		escreva("Um som metálico ecoa pelos corredores da nave.\n\n")
		u.aguarde(1000)
		escreva("Sistemas secundários voltam lentamente à atividade.\n\n")
		Executarjogo()
		menu_ativo = falso
		retorne
	}
	
	funcao Historia()
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
		retorne
	}
	
	funcao inicio()
	{
		
		enquanto (menu_ativo)
		{
			limpa()
			
			// Menu
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
			
			
			escolha(opcao)
			{
				caso 1:
					Jogunho()
					pare

				caso 2:
					Historia()
					pare

				caso 3:
					Creditos()
					pare

				caso 4:
					Sair()
					pare

				caso 5:
					Executarjogo()
					pare

				caso contrario:
					limpa()
					escreva("Opção errada! Rode o programa de novo.\n")
			}
		}
	}
	
	// Inicio do joguinhozinho
	funcao Executarjogo()
	{
	
	CoorX = sorteia(0 , 10)        // Coor = Coordenada
	CoorY = sorteia(0 , 10)
	enquanto((CoorX == CoorXAlien) ou (CoorY == CoorYAlien))
	{
	CoorXAlien = sorteia(0 , 10)
	CoorYAlien = sorteia(0 , 10)
	}
	escreva(CoorX , " - " , CoorY , "\n" , CoorXAlien , " - " , CoorYAlien)
	escreva("\nVocê está na sala principal de criogenia, seja lá o que está a bordo, está procurando você...\n")
	Move()
	
	u.aguarde(5000)
	}
	
	// Função p segurar o menu e evitar que ele feche direto
	funcao aguardarEnter()
	{
	cadeia pausa
	leia(pausa)
	}

	//logico jogo_rodando = verdadeiro
	//logico encontrou_objetivo = falso

	//enquanto (jogo_rodando == verdadeiro e encontrou_objetivo == falso)
	//{

	funcao Move()
	//verificar eventos()
	{
	escreva("Posição Atual -> X: ", CoorX, " | Y: ", CoorY, "\n")
    escreva("Use W, A, S, D para se mover (ou Q para sair): ")
	leia(andar
	
	escolha(andar)
	{
	
	caso 'W':
	caso 'w':
		CoorY++
		pare
	
	caso 'A':
	caso 'a':
		CoorX--
		pare
	
	caso 'S':
	caso 's':
		CoorY--
		pare
	
	caso 'D':
	caso 'd':
		CoorX++
		pare
	caso 'Q':
	caso 'q':
		Sair()
	
	caso contrario:

	se (CoorX == 6 e CoorY == 3)
	{

		caracter opcao
		logico continuar = verdadeiro

		enquanto (continuar == verdadeiro)
		{
			limpa()

			escreva("Você entrou em uma sala com algumas pilhas de folhas nas mesas,\n a iluminação do ambiente falha levemente. O local tem cheiro de coisas antigas, nas paredes há alguns quadros\n")
			escreva("Voce nota uma porta no fim desta sala, o que voce fará?")

			escreva("[w] para abrir a porta\n")
			escreva("[a] para olhar as folhas\n")
			escreva("[s] para olhar os quadros\n")
			escreva("Escolha: ")

			leia(opcao)
			limpa()

			escolha(opcao)
			{
				caso 'w':
				caso 'W':
						escreva("A porta esta trancada, voce precisara de uma chave.\n")
					continuar = falso
					pare
					
				caso 'a':
				caso 'A':
					escreva("Você mexe nas folhas. São relatórios antigos cobertos de poeira e sem nexo.\n")
					escreva("\nPressione ENTER para continuar...")
					leia(opcao) 
					pare
					
				caso 's':
				caso 'S':
					escreva("Os quadros mostram retratos de pessoas antigas que parecem te encarar.\n")
					escreva("\nPressione ENTER para continuar...")
					leia(opcao) 
					pare
					
				caso contrario:
					escreva("Comando inválido! Escolha uma opção válida (w, a ou s).\n")
					escreva("\nPressione ENTER para tentar novamente...")
					leia(opcao)
			}
		}

	}
}
 
			}
			
	}



