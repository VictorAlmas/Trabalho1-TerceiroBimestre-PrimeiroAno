programa
{
	inclua biblioteca Texto --> txt
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat

	inteiro sanidade = 100
	real jogador_x = 0.0
	real jogador_y = 0.0

	real alien_x = 20.0
	real alien_y = 20.0
	logico andar_alien = verdadeiro

	inteiro opcao
	caracter andar
	caracter andar_teclas
	logico menu_ativo = verdadeiro

	logico item = falso
	logico sala_armamento = falso
	logico chave_armamento = falso
	logico chave_dispensa = falso

	cadeia inventario[20]
	inteiro itensNoInventario = 0

	cadeia arma_equipada = ""
	logico arma_carregada = falso
	inteiro municao_atual = 0
	inteiro municao_carregador = 0
	inteiro municao_reserva = 0

	logico chip_acesso_encontrado = falso
	logico salaEnf_explorada = falso
	inteiro sorteio

	funcao Sair()
	{
		limpa()
		para (inteiro g = 15; g > 0; g--)
		{
			limpa()
			escreva("Conexão encerrada. O último eco se apagou no vácuo")
			para (inteiro i = 0; i < g; i++)
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
		escreva("  Desenvolvedores: Ayka E., Victor H., Lucas N. \n")
		escreva("  Interface de Desenvolvimento: Portugol Studio\n")
		escreva("  Atmosfera: Suspense Sci-Fi / Sobrevivência\n\n")
		escreva("===============================================================\n")
		escreva("Pressione ENTER para retornar ao terminal...")
		AguardarEnter()
		retorne
	}

	funcao Historia()
	{
		limpa()
		escreva("===================== ARQUIVOS DE MEMÓRIA =====================\n\n")
		escreva("  O silêncio engoliu tudo. As cidades estão vazias e as estrelas\n")
		escreva("  parecem mais frias. Não há mais transmissões, não há mais vozes.\n")
		escreva("  Você capta um pulso fraco no radar. Um último eco humano.\n\n")
		escreva("  OBJETIVO: Siga o sinal. Descubra se você realmente está sozinho.\n")
		escreva("===============================================================\n")
		escreva("Pressione ENTER para retornar ao terminal...")
		AguardarEnter()
		retorne
	}

	funcao Sintonizacao()
	{
		para (inteiro i = 0; i < 5; i++)
		{
			limpa()
			escreva("Sintonizando a ultima frequencia de radio conhecida")
			para (inteiro g = 0; g < 3; g++)
			{
				u.aguarde(200)
				escreva(".")
				u.aguarde(200)
			}
		}
		escreva("\n")
		u.aguarde(500)
	}

	funcao Acordando()
	{
		para (inteiro i = 0; i < 5; i++)
		{
			limpa()
			escreva("Desativando modo de sobrevivência em estado de criogenia acordar sobrevivente\n\n")
			escreva("Buscando sinais vitais no perímetro cósmico")
			u.aguarde(600)
			escreva(".")
			u.aguarde(600)
			para (inteiro g = 0; g < 3; g++)
			{
				u.aguarde(200)
				escreva(".")
				u.aguarde(200)
			}
		}
	}

	funcao Introduzir()
	{
		limpa()
		escreva("=========================================================================\n")
		escreva("                       CONEXÃO ESTABELECIDA                             \n")
		escreva("=========================================================================\n\n")
		u.aguarde(500)
		escreva("Estática ecoa pelos alto-falantes da sua cabine.\n\n")
		escreva("O monitor pisca com uma linha de código piscando em vermelho...\n\n")
		u.aguarde(1500)
		escreva("ALERTA DE SEGURANÇA: Intruso detectado a bordo da nave.\n\n")
		u.aguarde(1000)
		escreva("Espécie não identificada.\n\n")
		u.aguarde(3000)
		escreva("Iniciando protocolo de orientação para sobrevivente.\n\n")
		u.aguarde(2000)
		escreva("Você está na sala principal de criogenia.\n\n")
		u.aguarde(1000)
		escreva("Há a sala de mantimentos, a sala de armamentos e a sala de enfermaria,\n")
		u.aguarde(1000)
		escreva("entre outras possíveis salas que podem ser descobertas .\n\n")
		u.aguarde(1000)
		escreva("Entrando em modo de suporte de vida e manutenção.\n\n")
		u.aguarde(1000)
		escreva("Ativando estufa para melhorar o fluxo e a qualidade do ar.\n\n")
		u.aguarde(1200)
		escreva("Um som metálico ecoa pelos corredores da nave.\n\n")
		u.aguarde(1000)
		escreva("Sistemas secundários voltam lentamente à atividade.\n\n")
	}

	funcao ComJog()
	{
		cadeia passar

		limpa()
		Sintonizacao()
		Acordando()
		Introduzir()
		leia(passar)
		SortearPosicoes()
		loop()
		menu_ativo = falso
		retorne
	}

	funcao Titulo()
	{
		escreva("______        __  __     __         ______   __     __    __     ______        ______     ______     ______    \n")
		escreva("/\\  __ \\      /\\ \\/\\ \\   /\\ \\       /\\__  _\\ /\\ \\   /\\ \"-./  \\   /\\  __ \\      /\\  ___\\   /\\  ___\\   /\\  __ \\   \n")
		escreva("\\ \\ \\/\\ \\     \\ \\ \\_\\ \\  \\ \\ \\____  \\/_/\\ \\/ \\ \\ \\  \\ \\ \\-./\\ \\  \\ \\ \\/\\ \\     \\ \\  __\\   \\ \\ \\____  \\ \\ \\/\\ \\  \n")
		escreva(" \\ \\_____\\     \\ \\_____\\  \\ \\_____\\    \\ \\_\\  \\ \\_\\  \\ \\_\\ \\ \\_\\  \\ \\_____\\     \\ \\_____\\  \\ \\_____\\  \\ \\_____\\ \n")
		escreva("  \\/_____/      \\/_____/   \\/_____/     \\/_/   \\/_/   \\/_/  \\/_/   \\/_____/      \\/_____/   \\/_____/   \\/_____/ \n")
		escreva("\n")
	}

	funcao Menu()
	{
		escreva("\n")
		escreva("===============================================================\n")
		escreva("                     SISTEMA DE CONTROLE                      \n")
		escreva("===============================================================\n")
		escreva("|                                                             |\n")
		escreva("|  [1] INICIAR PROTOCOLO DE BUSCA                             |\n")
		escreva("|      > Jogar                                                |\n")
		escreva("|                                                             |\n")
		escreva("|  [2] ARQUIVOS DE MEMORIA                                    |\n")
		escreva("|      > Acessar registros e historia                         |\n")
		escreva("|                                                             |\n")
		escreva("|  [3] TRANSMISSAO DE CREDITOS                                |\n")
		escreva("|      > Transferir creditos                                  |\n")
		escreva("|                                                             |\n")
		escreva("|  [4] INTERROMPER SISTEMA                                    |\n")
		escreva("|      > Encerrar sistema                                     |\n")
		escreva("|                                                             |\n")
		escreva("|  [5] PULAR INTRODUCAO                                       |\n")
		escreva("|      > Ignorar sequencia inicial                            |\n")
		escreva("|                                                             |\n")
		escreva("===============================================================\n")
		escreva(" CODIGO DE ACESSO: ")
	}

	funcao inicio()
	{
		enquanto (menu_ativo)
		{
			cadeia comecar_jogo
			limpa()
			Titulo()
			escreva("\n PRESSIONE ENTER PARA COMEÇAR: ")
			leia(comecar_jogo)
			limpa()

			Menu()
			leia(opcao)

			escolha (opcao)
			{
				caso 1:
					ComJog()
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
					ExecutarJogo()
				caso 6:
					SalaEscritorio()
				pare
				
				caso 44:
					QuartoQuarto()

				caso 444:
					QuatroBaralhos()
				caso 4444:
					QuartoFim()
				
				caso contrario:
					limpa()
					escreva("Opção errada! Rode o programa de novo.\n")
			}
		}
	}

	funcao ExecutarJogo()
	{
		escreva("\nVocê está na sala principal de criogenia, seja lá o que está a bordo, está procurando você...\n")
		SortearPosicoes()
		loop()
	}

	funcao Status()
	{
		escreva("==================================================\n")
		escreva(" SANIDADE: ", sanidade, "/100\n")
		escreva(" Posição do jogador: X:", jogador_x, " | Y:", jogador_y, "\n")
		escreva(" Posição do alien: X:", alien_x, " | Y:", alien_y, "\n")
		se (arma_equipada != "")
		{
			escreva(" Arma: ", arma_equipada, " | Municao: ", municao_atual, "/", municao_carregador, " (Reserva: ", municao_reserva, ")\n")
		}
		escreva("==================================================\n")
	}

	funcao Acao(cadeia acao)
	{
		se (acao == "W" ou acao == "w")
		{
			jogador_y++
		}
		senao se (acao == "A" ou acao == "a")
		{
			jogador_x--
		}
		senao se (acao == "S" ou acao == "s")
		{
			jogador_y--
		}
		senao se (acao == "D" ou acao == "d")
		{
			jogador_x++
		}
		senao se (acao == "F" ou acao == "f")
		{
			MostrarInventario()
		}
		senao se (acao == "6")
		{
			Recarregar()
		}
		senao se (acao == "7")
		{
			Atirar()
		}
		senao
		{
			escreva("Opção inválida!\n")
			u.aguarde(800)
		}

		LimitPosicoes()
	}

	funcao PosAlien()
	{
		se (andar_alien == verdadeiro)
		{
			
		se (alien_x < jogador_x)
		{
			alien_x = alien_x + 0.5
		}
		senao se (alien_x > jogador_x)
		{
			alien_x = alien_x - 0.5
		}

		se (alien_y < jogador_y)
		{
			alien_y = alien_y + 0.5
		}
		senao se (alien_y > jogador_y)
		{
			alien_y = alien_y - 0.5
		}
	}
}

	funcao MorteAlien()
	{
		limpa()
		escreva("\n")
		escreva("====================================\n")
		escreva("           COLAPSO MENTAL          \n")
		escreva("====================================\n")
		escreva("O Alien encurralou você no silêncio do espaço.\n")
		AguardarEnter()
	}

	funcao loop()
	{
		cadeia acao_jogador

		enquanto (sanidade > 0)
		{
			limpa()

			CalcSan()

			se (sanidade <= 0)
			{
				pare
			}

			Status()

			escreva("Use W(subir), A(esquerda), S(descer), D(direita), F(inventario), 6(recarregar), 7(atirar): ")
			leia(acao_jogador)

			Acao(acao_jogador)

			PosAlien()

			EventoSala()
		}

		MorteAlien()
	}

	funcao CalcSan()
	{
		real distancia
		real diferenca_x
		real diferenca_y

		diferenca_x = alien_x - jogador_x
		diferenca_y = alien_y - jogador_y

		distancia = mat.raiz((diferenca_x * diferenca_x + diferenca_y * diferenca_y), 2.0)

		se (distancia <= 3)
		{
			sanidade = sanidade - 10
			escreva("=====================================\n")
			escreva("| O ALIEN ESTÁ MUITO PERTO, FUJA!!! |\n")
			escreva("=====================================\n")
		}
		senao se (distancia <= 7)
		{
			sanidade = sanidade - 5
			escreva("\nVoce sente uma presenca proxima...\n")
		}
		senao se (distancia <= 12)
		{
			sanidade = sanidade - 2
			escreva("\nAlgo parece estar observando voce...\n")
		}

		se (sanidade < 0)
		{
			sanidade = 0
		}
	}

	funcao AguardarEnter()
	{
		cadeia pausa
		leia(pausa)
	}

	funcao AdicionarItem(cadeia nome)
	{
		se (itensNoInventario < 20)
		{
			inventario[itensNoInventario] = nome
			itensNoInventario++
			escreva("Item \"", nome, "\" adicionado ao inventário! (", itensNoInventario, "/20)\n")
		}
		senao
		{
			escreva("Inventário cheio! Não é possível carregar mais itens.\n")
		}
		u.aguarde(1000)
	}

	funcao RemoverItemPorIndice(inteiro indice)
	{
		para (inteiro i = indice; i < itensNoInventario - 1; i++)
		{
			inventario[i] = inventario[i + 1]
		}
		itensNoInventario--
	}

	funcao TrocarItem()
	{
		inteiro origem
		inteiro destino
		cadeia temp

		se (itensNoInventario == 0)
		{
			escreva("Inventário vazio, não há itens para trocar.\n")
			u.aguarde(1000)
			retorne
		}

		escreva("Digite o número do item que deseja mover: ")
		leia(origem)
		escreva("Digite a posição de destino: ")
		leia(destino)

		origem--
		destino--

		se (origem >= 0 e origem < itensNoInventario e destino >= 0 e destino < itensNoInventario)
		{
			temp = inventario[origem]
			inventario[origem] = inventario[destino]
			inventario[destino] = temp
			escreva("Itens trocados de posição com sucesso!\n")
		}
		senao
		{
			escreva("Posição inválida.\n")
		}
		u.aguarde(1200)
	}

	funcao UsarItem()
	{
		inteiro indice

		se (itensNoInventario == 0)
		{
			escreva("Inventário vazio, não há itens para usar.\n")
			u.aguarde(1000)
			retorne
		}

		escreva("Digite o número do item que deseja usar: ")
		leia(indice)
		indice--

		se (indice >= 0 e indice < itensNoInventario)
		{
			escreva("Você usou: ", inventario[indice], "\n")

			se (inventario[indice] == "Chave de Ferro")
			{
				chave_armamento = verdadeiro
				escreva("A chave se encaixa em uma fechadura próxima!\n")
			}

			se (inventario[indice] == "Laser de Energia" ou inventario[indice] == "Pistola Giroscopica" ou inventario[indice] == "Arma Magnetica de Pulso" ou inventario[indice] == "Lancador Flechette")
			{
				EquiparArma(inventario[indice])
			}

			RemoverItemPorIndice(indice)
		}
		senao
		{
			escreva("Posição inválida.\n")
		}
		u.aguarde(1500)
	}

	funcao RetirarItem()
	{
		inteiro indice

		se (itensNoInventario == 0)
		{
			escreva("Inventário vazio, não há itens para retirar.\n")
			u.aguarde(1000)
			retorne
		}

		escreva("Digite o número do item que deseja descartar: ")
		leia(indice)
		indice--

		se (indice >= 0 e indice < itensNoInventario)
		{
			escreva("Item \"", inventario[indice], "\" descartado.\n")
			RemoverItemPorIndice(indice)
		}
		senao
		{
			escreva("Posição inválida.\n")
		}
		u.aguarde(1000)
	}

	funcao ExibirCabecalhoInv()
	{
		escreva("=================================\n")
		escreva("            INVENTÁRIO           \n")
		escreva("=================================\n")
		escreva("Espaços livres: ", (20 - itensNoInventario), " / 20\n\n")
	}

	funcao ExibirListaInv()
	{
		se (itensNoInventario == 0)
		{
			escreva("O inventário está vazio.\n\n")
		}
		senao
		{
			para (inteiro i = 0; i < itensNoInventario; i++)
			{
				escreva(i + 1, " - ", inventario[i], "\n")
			}
			escreva("\n")
		}
	}

	funcao MostrarInventario()
	{
		andar_alien = falso
		inteiro opcaoInventario
		limpa()

		ExibirCabecalhoInv()
		ExibirListaInv()

		escreva("=================================\n")
		escreva("[1] Trocar item de posição\n")
		escreva("[2] Usar item\n")
		escreva("[3] Retirar item\n")
		escreva("[0] Voltar ao jogo\n")
		escreva("Escolha: ")
		leia(opcaoInventario)

		escolha (opcaoInventario)
		{
			caso 1:
				TrocarItem()
			pare
			caso 2:
				UsarItem()
			pare
			caso 3:
				RetirarItem()
			pare
			caso 0:
				pare
				
			caso contrario:
				escreva("Opção inválida.\n")
				u.aguarde(800)
		}
		andar_alien = verdadeiro
	}
		funcao inteiro CapacidadeDaArma(cadeia nome)
	{
		se (nome == "Laser de Energia")
		{
			retorne 8
		}
		senao se (nome == "Pistola Giroscopica")
		{
			retorne 12
		}
		senao se (nome == "Arma Magnetica de Pulso")
		{
			retorne 6
		}
		senao se (nome == "Lancador Flechette")
		{
			retorne 4
		}

		retorne 10
	}

	funcao EquiparArma(cadeia nome)
	{
		arma_equipada = nome
		municao_carregador = CapacidadeDaArma(nome)
		municao_atual = municao_carregador
		municao_reserva = municao_carregador * 3
		arma_carregada = verdadeiro

		escreva("\n[", arma_equipada, "] equipada e carregada! (", municao_atual, "/", municao_carregador, ")\n")
		escreva("Municao de reserva: ", municao_reserva, "\n")
		u.aguarde(1500)
	}

	funcao real RecuoDaArma(cadeia nome)
	{
		se (nome == "Pistola Giroscopica")
		{
			retorne 0.5
		}
		senao se (nome == "Arma Magnetica de Pulso")
		{
			retorne 2.0
		}
		senao se (nome == "Lancador Flechette")
		{
			retorne 3.0
		}
		senao se (nome == "Laser de Energia")
		{
			retorne 2.5
		}
		
		    retorne 1.5
		    
	}

	funcao AfastarAlienAoDisparar()
	{
		real r = RecuoDaArma(arma_equipada)

		se (alien_x > jogador_x)
		{
			alien_x = alien_x + r
		}
		senao
		{
			alien_x = alien_x - r
		}

		se (alien_y > jogador_y)
		{
			alien_y = alien_y + r
		}
		senao
		{
			alien_y = alien_y - r
		}
	}

	funcao Atirar()
	{
		se (arma_equipada == "")
		{
			escreva("\nVocê não tem nenhuma arma equipada!\n")
			u.aguarde(1200)
			retorne
		}

		se (municao_atual <= 0)
		{
			escreva("\n*Click* Carregador vazio! Pressione 6 para recarregar.\n")
			u.aguarde(1200)
			retorne
		}

		municao_atual--
		escreva("\nVocê disparou a ", arma_equipada, "! (", municao_atual, "/", municao_carregador, " restantes)\n")

		AfastarAlienAoDisparar()

		escreva("O alien recua com o estampido!\n")
		u.aguarde(1200)
	}

	funcao Recarregar()
	{
		inteiro necessario

		se (arma_equipada == "")
		{
			escreva("\nVocê não tem nenhuma arma para recarregar!\n")
			u.aguarde(1200)
			retorne
		}

		se (municao_atual == municao_carregador)
		{
			escreva("\nO carregador já está cheio!\n")
			u.aguarde(1000)
			retorne
		}

		se (municao_reserva <= 0)
		{
			escreva("\nVocê não tem mais munição de reserva!\n")
			u.aguarde(1200)
			retorne
		}

		necessario = municao_carregador - municao_atual

		escreva("\nRecarregando ", arma_equipada, "...\n")
		u.aguarde(1500)

		se (municao_reserva >= necessario)
		{
			municao_reserva = municao_reserva - necessario
			municao_atual = municao_carregador
		}
		senao
		{
			municao_atual = municao_atual + municao_reserva
			municao_reserva = 0
		}

		escreva("Recarregado! (", municao_atual, "/", municao_carregador, " | Reserva: ", municao_reserva, ")\n")
		u.aguarde(1200)
	}
	

	funcao EventoSala()
	{
		se (jogador_x == 6.0 e jogador_y == 3.0)
		{
			SalaEscritorio()
		}
		senao se (jogador_x == 4.0 e jogador_y == 7.0)
		{
			ChaveArm()
		}
		senao se (jogador_x == 8.0 e jogador_y == 1.0)
		{
			SalaEnfermaria()
		}
		senao se (jogador_x == 6.0 e jogador_y == 7.0)
		{
			SalaDormitorio()
		}
		senao se (jogador_x == -5.0 e jogador_y == -7.0)
		{	
		escreva("Tem uma sala aqui, quer entrar?\n")
		escreva("[S] sim ou [N] não?")
		escreva("Escolha: ")
		
		leia(andar_teclas)

		escolha(andar_teclas)
		{
			caso 'S':
			caso 's':
				para (inteiro i = 0; i < itensNoInventario; i++)
				{
					se(inventario[i]=="Chave prateada")
					{
						SalaMantimentos()
					}
					senao
					{
						escreva("A porta está trancada, você precisará de uma chave...")
						
					}
					
				}
				pare
				
				caso 'N':
				caso 'n':
					pare

		}
	}
	}

	funcao Folhas()
	{
		andar_alien = falso
		escreva("Você mexe nas folhas. São relatórios antigos cobertos de poeira e sem nexo. Uma folha em especial te chama atenção...\n")
		u.aguarde(3200)
		escreva("[E] para pegar\n")
		escreva("[Q] para retornar\n")
		leia(andar_teclas)

		escolha(andar_teclas)
		{

			caso 'E':
			caso 'e':
					ExibirLaudo()
			pare
			caso 'Q': 
			caso 'q':
					escreva("")
			pare
			caso contrario: escreva("comando inválido!")
			pare
		}
		andar_alien = verdadeiro
	}

	funcao ExibirLaudo()
	{
		limpa()
		
		escreva("=================================================================\n")
		escreva("       ESTAÇÃO ESPACIAL AURA - RELATÓRIO MÉDICO / CONFIDENCIAL   \n")
		escreva("=================================================================\n\n")
		
		u.aguarde(800) 
		
		escrevaLenta("DOCUMENTO: Laudo de Triagem Psiquiátrica e Biológica\n" , 10)
		escrevaLenta("PACIENTE: Dra. Aris Thorne (Especialista em Xenobiologia)\n" , 10)
		escrevaLenta("RESPONSÁVEL: Dr. Marcus Vance (Médico Chefe)\n" , 10)
		escrevaLenta("STATUS: QUARENTENA NÍVEL 4 [ACESSO RESTRITO]\n" , 10)
		escreva("-----------------------------------------------------------------\n\n")
		
		u.aguarde(1000)

		escreva("[OBSERVAÇÕES CLÍNICAS]:\n")
		escrevaLenta("A paciente deu entrada no setor médico apresentando quadro de paranóia severa.\n" , 10)
		escrevaLenta("Relata 'zumbidos na frequência espectral' e insistia que os colegas do módulo B\n" , 10)
		escrevaLenta("estavam 'com os olhares vazios e tomados por uma raiva invisível'.\n\n" , 10)

		u.aguarde(1200)

		escreva("[EXAMES FISIOLÓGICOS]:\n")
		escrevaLenta("- Batimentos cardíacos: Excepcionalmente estáveis (incompatível com o pânico).\n" , 10)
		escrevaLenta("- Varredura biológica: Negativa para bactérias, vírus ou toxinas conhecidas.\n" , 10)
		escrevaLenta("- Mapeamento Cerebral: Anomalia detectada. Padrões de ondas cerebrais mostram\n" , 10)
		escrevaLenta("  picos de agressividade extrema ocorrendo em microsegundos, alternados com\n" , 10)
		escrevaLenta("  períodos de aparente calma e lucidez.\n\n" , 10)

		u.aguarde(1200)

		escreva("[NOTA FINAL DO MÉDICO]:\n")
		escrevaLenta("A paranoia é contagiosa? De um dia para o outro, três auxiliares que estavam em\n" , 10)
		escrevaLenta("contato com a Dra. Aris começaram a manifestar o mesmo comportamento hostil.\n" , 10)
		escrevaLenta("O mais perturbador é que NENHUM dos exames aponta infecção física. Não há febre,\n" , 10)
		escrevaLenta("não há lesão... É como se a agressividade estivesse sendo transmitida pelo ar,\n" , 10)
		escrevaLenta("ou por algo que nossos sensores simplesmente não conseguem rastrear.\n\n" , 10)

		escreva("-----------------------------------------------------------------\n")
		escreva("              [FIM DO LAUDO - ARQUIVO SALVO]                     \n")
		escreva("=================================================================\n\n")

		
		escreva("Pressione ENTER para continuar...")
		AguardarEnter()
	}
	funcao escrevaAguarde(cadeia texto , inteiro tempo)
	{
		escreva(texto)
		u.aguarde(tempo) 
	}

	funcao Quadros()
	{
		escrevaAguarde("Os quadros mostram retratos de pessoas antigas que parecem te encarar.\n" , 3000)
	}

	funcao PegarArma(cadeia nome, cadeia numero, cadeia titulo, cadeia descricao, cadeia vantagem)
	{
		AdicionarItem(nome)
		escreva(numero, " - ", titulo, " \n")
		escreva("-------------------------------------------------------------------\n")
		escreva("Descrição: ", descricao, "\n")
		escreva(vantagem, "\n")
		u.aguarde(2500)
	}

	funcao SalaArmamento()
	{
		andar_alien = falso

		escreva("================================================================================\n")
		u.aguarde(500)
		escreva("                       	   [SALA DE ARMAMENTOS]                               \n")
		u.aguarde(500)
		escreva("================================================================================\n")
		escrevaLenta("A porta pesada se abre com um silvo hidráulico, revelando a Sala de Armamentos.\n", 50)
		escrevaLenta("Diante de você, um painel iluminado exibe fileiras de equipamentos avançados.\n", 50)
		escrevaLenta("O brilho neon reflete na superfície de Granadas de Criogênio e pistolas giroscópicas.\n", 50)
		escrevaLenta("Ao lado, descansam armas magnéticas de pulso.\n", 50)
		escreva("O arsenal está à sua disposição.\n", 50)
		escreva("[1] para pegar a Granada de Criogênio\n")
		escreva("[2] para pegar a Pistola Giroscopica\n")
		escreva("[3] para pegar a Arma Magnetica de Pulso\n")
		escreva("[Q] para retornar")
		leia(andar_teclas)

		escolha (andar_teclas)
		{
			caso '1':
				PegarArma("Granada de Criogênio", "1", "[ GRANADA DE CRIOGÊNIO ]", "Utilidade: Congela o Alien no lugar, fazendo com que dê tempo de fugir.","")
			pare
			caso '2':
				PegarArma("Pistola Giroscopica", "2", "[ PISTOLAS GIROSCOPICAS ]", "Dispara mini-foguetes que aceleram apos sairem do cano.", "Vantagem: Faz o Alien recuar 0.5 nas coordenadas X e Y.")
			pare
			caso '3':
				PegarArma("Arma Magnetica de Pulso", "3", "[ ARMAS MAGNÉTICAS DE PULSO ]", "Bobinas eletromagnéticas que aceleram um dardo metálico envenenado.", "Vantagem: Faz o Alien recuar 2.0 em X e Y.")
			pare
			caso 'Q':
			caso 'q':
				escreva("")
			pare
		}

		andar_alien = verdadeiro
		u.aguarde(1000)
	}

	funcao AbrirPortaArm()
	{
		logico tem_chave = falso

		limpa()

		para (inteiro i = 0; i < itensNoInventario; i++)
		{
			se (inventario[i] == "Chave de Ferro")
			{
				tem_chave = verdadeiro
			}
		}

		se (tem_chave == falso)
		{
			escreva("A porta esta trancada, voce precisara de uma chave.\n")
			u.aguarde(2900)
			retorne
		}
		andar_alien = falso

		escreva("Parabens! voce desbloqueou a sala de armamentos!\n")
		escreva("[E] para explorar a sala\n")
		escreva("[Q] para RETORNAR\n")
		leia(andar_teclas)
		limpa()

		escolha (andar_teclas)
		{
			caso 'E':
			caso 'e':
				SalaArmamento()
			pare
			caso 'Q':
			caso 'q':
				escreva("")
				u.aguarde(2900)
			pare
		}
		andar_alien = verdadeiro
	}

	funcao SalaEscritorio()
	{
		andar_alien = falso
		
		limpa()
		escrevaAguarde("=======================================================================\n", 500)
		escrevaAguarde("                            [SALA ESCRITÓRIO]                          \n", 500)
		escrevaAguarde("=======================================================================\n", 500)
		escrevaLenta("Você entrou em uma sala com algumas pilhas de folhas nas mesas,\n", 33)
		escreva("a iluminação do ambiente falha levemente. O local tem cheiro de coisas antigas, nas paredes há alguns quadros\n")
		escreva("Voce nota uma porta no fim desta sala, o que voce fará?\n")
		
		sala_armamento = verdadeiro
		
		escreva("===============================\n")
		escreva("|[1] para abrir a porta       |\n")
		escreva("|[2] para olhar as folhas     |\n")
		escreva("|[3] para olhar os quadros    |\n")
		escreva("|[Q] para retornar            |\n")
		escreva("===============================\n")
		escreva("Escolha: ")
		leia(andar_teclas)
		limpa()

		escolha (andar_teclas)
		{
			caso '1':
				AbrirPortaArm()
			pare
			caso '2':
				Folhas()
			pare
			caso '3':
				Quadros()
			pare
			caso 'Q':
			caso 'q':
			caso contrario:
				escreva("Comando inválido!\n")
		}
		andar_alien = verdadeiro
	}

	funcao SalaEnfermaria()
	{
		andar_alien = falso
		
		limpa()
		escreva("=====================================================\n")
		u.aguarde(500)
		escreva("                 [SALA DA ENFERMARIA]                \n")
		u.aguarde(500)
		escreva("=====================================================\n")
		u.aguarde(500)
		escreva("As portas pneumáticas se abrem com um silvo suave.\n")
		u.aguarde(500)
		escreva("O cheiro de ozônio e antisséptico invade seus pulmões.\n")
		u.aguarde(500)
		escreva("Luzes fluorescentes brancas piscam no teto, iluminando\n")
		u.aguarde(500)
		escreva("macas cirúrgicas vazias e tanques de vidro com líquido azul.\n")
		u.aguarde(500)
		escreva("-----------------------------------------------------\n")
		u.aguarde(500)
		escreva("[E] para explorar\n")
		escreva("[Q] para retornar\n")
		escreva("Escolha: ")
		u.aguarde(2500)
		leia(andar_teclas)

		limpa()

		escolha(andar_teclas)
		{
			caso 'E': 
			caso 'e':
				escreva("Você começa a revirar os armários metálicos e gavetas de\n")
				escreva("suprimentos médicos danificados...\n")
				AguardarEnter()

				sorteio = u.sorteia(1, 3)

			escolha(sorteio)
			{
				caso 1:
					escreva("\n[SUCESSO] Você encontrou um compartimento secreto!\n")
					escreva("Contém 1 Nano-Medkit, gostaria de adicionar ao seu inventário?\n")
					escreva("[S] sim ou [N] não\n")
					escreva("Escolha: ")
					leia(andar_teclas)

					escolha(andar_teclas)
					{

						caso 'S':
						caso 's':
							AdicionarItem ("Nano-Medkit")
							pare
						caso 'N':
						caso 'n':
							escreva("Você não pegou o item.")
							u.aguarde(500)
							pare
						caso contrario: escreva("contrario")
							pare
					}

				caso 2:
					escreva("\n[SUCESSO] Sob restos de vidros de um tanque de bacta quebrado,\n")
					escreva("você encontra um Chip de Acesso de Segurança Nível 2!\n")
					AguardarEnter()
					escreva("Deseja adicionar ao inventário?\n")
					escreva("[S] sim ou [N] não?")
					leia(andar_teclas)

					escolha(andar_teclas)
					{

						caso 'S': 
						caso 's':
							AdicionarItem ("Chip de Acesso Nv.2")
							pare
						caso 'N':
						caso 'n':
							escreva("Você não pegou o item")
							u.aguarde(500)
							pare
						caso contrario: escreva("comando inválido!")
							pare
					}
					
					chip_acesso_encontrado = verdadeiro
					pare

				caso 3:
					escreva("\n[FALHA] Você abre uma gaveta travada à força e uma pequena\n")
					escreva("explosão de curto-circuito acontece na sua cara!\n")
					escreva("As luzes da enfermaria piscam, mas você não encontra nada.\n")
					AguardarEnter()
					pare
			}
			
			caso 'Q':
			caso 'q':
				escreva("")
				pare
			caso contrario: 
					escreva("comando inválido!")
					pare
		}
		andar_alien = verdadeiro
	}

	funcao SalaDormitorio()
	{
		andar_alien = falso
		limpa()
		
		limpa()
		escreva("================================================================================\n")
		u.aguarde(500)
		escreva("                                 [DORMITÓRIOS]                                  \n")
		u.aguarde(500)
		escreva("================================================================================\n")
		u.aguarde(500)
		escreva("Você entra em um local repleto de cabines individuais e no meio delas tem um corredor livre.\n")
		u.aguarde(500)
		escreva("Ao que parece, são os dormitórios dos tripulantes que um dia existiram ali...\n")
		u.aguarde(500)
		escreva("--------------------------------------------------------------------------------\n")
		escreva("[E] para explorar\n")
		escreva("[Q] para retornar\n")
		escreva("Escolha: ")
		
		leia(andar_teclas)

		escolha(andar_teclas)
		{
			caso 'E':
			caso 'e':
				ExplorarDormitorio()
				pare
			caso 'Q':
			caso 'q':
				escreva("")
				pare
			caso contrario:
				escreva("Comando inválido!\n")
				u.aguarde(1500)
				SalaDormitorio()
				pare
		}		
				escolha(andar_teclas)
				{
					caso '1':
						QuartoUm()
						pare
					caso '2':
						escreva("Você adentra em um dormitório com arranhões nas paredes, um desktop em tela azul, uma cama aparentemente feita às pressas...\n")
						escreva("[A] para investigar os Arranhões\n")
						escreva("[D] para investigar Desktop\n")
						escreva("[C] para investigar Cama\n")
						escreva("Escolha: ")
						
						leia(andar_teclas)
						
						limpa()
	
						escolha(andar_teclas)
						{

							caso 'A':
							caso 'a':
								escreva("Você se aproxima das paredes e passa seus dedos pelas marcas, você nota que...são arranhões profundos, talvez um ser humano comum não fosse capaz disso.")
								u.aguarde(2000)
								pare
							caso 'D':
							caso 'd':
								escreva("Você se aproxima da mesa onde o desktop descansa, você tenta mexer mas nenhuma resposta...")
								u.aguarde(1700)
								pare
							caso 'C':
							caso 'c':
								escreva("Você começa a mexer os lençóis e travesseiros e olhar rapidamente embaixo da cama.\n")
				
								sorteio = u.sorteia(1, 2)
				
								escolha(sorteio)
								{
				
							caso 1:
								escreva("[SUCESSO]Quando você olha embaixo da cama, você encontra algo que pode ser útil: Uma CHAVE PRATEADA!\n")
								escreva("Gostaria de adicionar ao inventário?")
								escreva("[S] sim ou [N] não?\n")
								escreva("Escolha: ")
								
								leia(andar_teclas)
								
								limpa()
				
								escolha(andar_teclas)
								{
						
									caso 'S': 
									caso 's':
										AdicionarItem ("Chave prateada")
										pare
									caso 'N':
									caso 'n':
										escreva("Você não pegou o item")
										pare
									caso contrario: 
										escreva("Comando inválido!")
										pare
								}
							caso 2:
								escreva("Que pena! Você não encontrou nada:(")
								pare
								}
						}
						andar_alien = verdadeiro
				}
	}

	funcao ExplorarDormitorio()
	{
		limpa()
		escreva("-----------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Você nota que ao longo do corredor, existem quatro quartos:\n")
		u.aguarde(500)
		escreva("dois em cada lado e eles são enumerados por uma placa acima da porta.\n")
		u.aguarde(500)
		escreva("Quarto 1 e do outro lado do corredor, Quarto 2 e assim por diante.\n")
		u.aguarde(500)
		escreva("-----------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Digite o número do dormitório que deseja explorar: ")
		
		leia(andar_teclas)
		    
		escolha(andar_teclas)
		{
			 caso '1':
				QuartoUm() 
				pare
			caso '2':
				QuartoDois()
				pare
			caso '3':
				QuartoTres()
				pare
			 caso contrario:
		           escreva("Quarto inválido!\n")
		           u.aguarde(1500)
		           ExplorarDormitorio()
		           pare
		}
	}

	funcao QuartoUm()
	{
		limpa()

		escreva("=======================================================================\n")
		escrevaAguarde("Você se vira em direção ao primeiro quarto à sua esquerda e,\n" , 500)
		escrevaAguarde("ao abrir a porta que range suavemente, você encontra um quarto\n" , 500)
		escrevaAguarde("com uma aparência comum devido ao sistema de controle de gravidade e oxigênio que envolve toda a estação...\n" , 500)
		
		limpa()

		escreva("-------------------------------------------------------------------------------------------------------------------\n")
		escrevaAguarde("No pequeno quarto há uma cama com edredons marrons, intocada.\n" , 500)
		escrevaAguarde("Acima desta cama, acoplado ao teto há uma máscara de oxigênio para emergência, como todos os dormitórios...\n" , 500)
		escrevaAguarde("Na mesinha de canto, ao lado da cama, há uma moldura de madeira com a foto de um homem e ao que parece, sua esposa.\n" , 500)
		escreva("-------------------------------------------------------------------------------------------------------------------\n")
		escreva("[E] para interagir\n")
		escreva("[Q] para continuar explorando\n")
		escreva("Escolha: ")
				
		leia(andar_teclas)

		escolha(andar_teclas)
		{
	
			caso 'E':
			caso 'e':
				escrevaAguarde("Você pega a pequena moldura de mesa nas mãos, passa a mão pela foto, tentando reconhecer aquelas pessoas...\n" , 300)
				escrevaAguarde("Então, o seu foco muda repentinamente," , 300)
				escrevaAguarde("uma forte dor de cabeça toma suas têmporas,\n" , 300)
				escrevaAguarde("você fecha os olhos com força diante dessa situação.\n" , 300)
				escrevaAguarde("Sua mente te tortura com flashs de pessoas correndo desordenadamente,\n" , 300)
				escrevaAguarde("umas tentando se esconder e outras tentando atacar agressivamente o ser humanoide que você não consegue identificar.\n" , 300)
				escrevaAguarde("Sua mente é tomada por confusão, você pensa:\n" , 300)
				escrevaLenta("Mas oque ta acontecendo?\n" , 400)
				escrevaAguarde("Assim que você se recompõe deste sentimento estranho e mal-estar, você devolve a moldura e continua investigando o quarto." , 4000)
				pare
						
			caso 'Q':
			caso 'q':
				escrevaAguarde("Você ignora a moldura e olha mais uma vez ao redor, esse quarto está tão...perfeito que chega a ser esquisito pensar que alguém \ncom uma vida, família e nome um dia dormiu ali.\n" , 3000)
				ExplorarDormitorio()
				pare
			}
	}

	funcao QuartoDois()
	{
		escreva("----------------------------------------------------------------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Você adentra em um dormitório com arranhões nas paredes, um desktop em tela azul, uma cama aparentemente feita às pressas...\n")
		u.aguarde(500)
		escreva("----------------------------------------------------------------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("[A] para investigar os Arranhões\n")
		escreva("[D] para investigar Desktop\n")
		escreva("[C] para investigar Cama\n")
		escreva("Escolha: ")
						
		leia(andar_teclas)
						
		limpa()
	
		escolha(andar_teclas)
		{
			caso 'A':
			caso 'a':
				escreva("Você se aproxima das paredes e passa seus dedos pelas marcas, você nota que...são arranhões profundos, talvez um ser humano comum não fosse capaz disso.")
				u.aguarde(3000)
				pare
			caso 'D':
			caso 'd':
				escreva("Você se aproxima da mesa onde o desktop descansa, você tenta mexer mas nenhuma resposta...")
				u.aguarde(3000)
				pare
			caso 'C':
			caso 'c':
				escreva("Você começa a mexer os lençóis e travesseiros e olhar rapidamente embaixo da cama.\n")
				u.aguarde(3000)
				
				sorteio = u.sorteia(1, 2)
				
					escolha(sorteio)
					{
						caso 1:
						escreva("[SUCESSO]Quando você olha embaixo da cama, você encontra algo que pode ser útil: Uma CHAVE PRATEADA!\n")
						escreva("Gostaria de adicionar ao inventário?")
						escreva("[S] sim ou [N] não?\n")
						escreva("Escolha: ")
								
						leia(andar_teclas)
								
						limpa()
				
						escolha(andar_teclas)
						{
							caso 'S': 
							caso 's':
								AdicionarItem ("Chave prateada")
								pare
							caso 'N':
							caso 'n':
								escreva("Você não pegou o item")
								pare
							caso contrario: 
								escreva("Comando inválido!")
								pare
								}
							caso 2:
								escreva("Que pena! Você não encontrou nada:(")
								pare
					}
		}
						
	}

	funcao QuartoTres()
	{
		escreva("-------------------------------------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Você vai para o terceiro quarto e, olhando ao redor, voce percebe que esse quarto é menos neutro,\n")
		u.aguarde(500)
		escreva("alguns posteres sobre musica nas paredes, fotos de familia e luzes amarelas baixas.\n")
		u.aguarde(500)
		escreva("Esse quarto te faz sentir um sentimento de nostalgia por algum motivo...\n")
		u.aguarde(500)
		escreva("-------------------------------------------------------------------------------------------------\n")
		escreva("[E] para dormir\n")
		escreva("[Q] para retornar\n")
		escreva("Escolha: ")

		leia(andar_teclas)

		escolha(andar_teclas)
		{
			caso 'E':
			caso 'e':
				MorteSono()
		}
	}

	funcao QuartoQuarto()
	{
		logico StoppedExploration = falso
		limpa() limpa() limpa() limpa()
		Quatros()
		u.aguarde(444)
		escrevaLenta("Voce se aproxima do ultimo quarto a sua direita e entra nele, o Quarto Quarto.\n\n" , 4)
		u.aguarde(44*44+444)
		Quatros()
		limpa() limpa() limpa() limpa()
		escrevaLenta("Ao analisar, parece 4 quartetos de diferentes objetos estranhos.\n\n" , 4)
		escrevaLenta("Deseja olhar qual?\n 4/4. Cartazes\n 4/4+4/4. Beliches\n 4-4/4. Livros\n 4. Baralhos\n\n", 4)
		QuatroQuestionamento()
		leia(andar_teclas)
		escreva("\n")
		Quatros()
		limpa() limpa() limpa() limpa()
		escolha(andar_teclas)
		{
			caso '1':
				QuatroCartazes()
			caso '2':
				QuatroBeliches()
			caso '3':
				QuatroLivros()
			caso '4':
				QuatroBaralhos()
		}
		
	}

	funcao QuatroCartazes()
	{
		limpa() limpa() limpa() limpa()
		Quatros()
		escrevaLenta("Ao analisar, parece ter 4 cartazes de 4 famosos de 4 continentes diferentes na parede.\n\n" , 4)
		u.aguarde(444)
		escrevaLenta(" - Neymar Junior. Grande Futebolista Brasileiro com 4 filhos, 4 Copas do mundo disputadas e 4 assistencias numa partida da  Champions.\n\n" , 4)
		u.aguarde(444)
		escrevaLenta(" - Hirohiko Araki. Famoso Mangaka Japones, contendo o seu Zodiaco Chines como o Rato (1) e o Ocidental como Gemeos (3) e assim tendo o 4 como numero da sorte.\n\n" , 4)
		u.aguarde(444)
		escrevaLenta(" - Adele. Talentosa Cantora Britânica, tendo 4 albuns de estudio, '25' ganhou 4 Brit Awards e 'Make You Feel My Love', quarto single de divulgação de '19', chegou a 4 posição no UK Singles Chart.\n\n" , 4)
		u.aguarde(444)
		escrevaLenta(" - Wangari Maathai. Inteligente Cientista Queniana, tendo ganho o Nobel da Paz em 2004 e no mesmo ano mais 4 diferentes premios, publicou 4 livros e recebeu 4 diplomas honorarios.\n\n" , 4)
		escrevaLenta("Após isso, tu se locomove as Beliches.\n\n" , 4)
		u.aguarde(44*44)
		AguardarEnter()
	}
	funcao QuatroBeliches()
	{
		// escrevaLenta("\n" , 4)
		limpa() limpa() limpa() limpa()
		Quatros()
		escrevaLenta("Percebes que possui 4 beliches, 4 andares com 4 metros de altura cada, além de cada um ter 4 colchoes de 4cm cada, 4 lencois e 4 travesseiros.\n" , 4)
		u.aguarde(444)
		escrevaLenta("Após isso, tu se locomove aos Livros.\n\n" , 4)
		u.aguarde(44*44)
		AguardarEnter()
	}

	funcao QuatroLivros()
	{
		limpa() limpa() limpa() limpa()
		Quatros()
		escrevaLenta("Observa que todos os 4 livros estão cheios de 4, possuindo 44 paginas dividas em 4 capitulos e possui 4 autores\nSendo eles: \n\n" , 4)
		u.aguarde(444)
		escrevaLenta(" - Paul IV\n\n" , 4)
		escrevaLenta(" - Hugo Fourcade \n\n" , 4)
		escrevaLenta(" - Vlad Patru\n\n" , 4)
		escrevaLenta(" - Hans Vier\n\n" , 4)
		escrevaLenta("Após isso, tu se locomove aos Baralhos.\n\n" , 4)
		u.aguarde(44*44)
		AguardarEnter()
	}
	funcao QuatroBaralhos()
	{
		limpa() limpa() limpa() limpa()
		Quatros()
		escrevaLenta("Viersualiza que cada um dos 4 baralhos possui temas diferentes, um sendo tema das 4 estaçoes do ano, outro sendo das 4 semanas do ano, outrem sendo 4 periodos do dia e o ultimo sendo dos 4 pontos cardeais \n" , 4)
		escrevaLenta("\nCada carta possui suas 4 vieriacoes, Copas, Paus, Espadas e Ouros, por ser uma sala com muita coincidencia com o 4, olha para as cartas 4, mas qual? \n"  , 4)
		escrevaLenta("\n 4/4. Copas\n 4/4+4/4. Paus\n 4-4/4. Espadas\n 4. Ouros\n\n ", 4)
		QuatroQuestionamento()
		leia(andar_teclas)
		escreva("\n")
		Quatros()
		limpa() limpa() limpa() limpa()
		escolha(andar_teclas)
		{
			caso '1':
			caso '2':
			caso '3':
				se (QuatroMorte() == verdadeiro)
				{
					pare
				}
				senao
				{
					QuatroBaralhos()
				}
			caso '4':
				Quatros()
				escrevaLenta("\n\nRepare-se que a Carta Sul (ouro) 4 aponta para a Carta Noite (ouro) 4 que possui uma lua desenhada que aponta para a Carta Quarta Semana (ouro) 4 que nao aponta pra lugar nenhum.\n\n" , 4)
				u.aguarde(44*44+444)
				escrevaLenta("Percebe que nao havia nada e fica muito triste e recolhe as cartas 4 de ouro, ate que elas se fundem e" , 4)
				escrevaLenta("....\n\n" , 44*44)
				u.aguarde(44*44)
				limpa() limpa() limpa() limpa()
				u.aguarde(44*44)
				escrevaLenta("SOMEM!!!!\n\n" , 44*4+44)
				escrevaLenta("Quatro portas se abre em meio a quarta parede do quarto quarto\n\n" , 4)
				u.aguarde(44*44+444)
				escrevaLenta("Qual voce entra\n 4/4 Porta \n 4/4+4/4 Porta \n 4-4/4 Porta\n 4 Porta\n\n" , 4)
				QuatroQuestionamento()
				leia(andar_teclas)
				escreva("\n")
				Quatros()
				limpa() limpa() limpa() limpa()
				escolha(andar_teclas)
				{
					caso '1':
					caso '2':
					caso '3':
						se (QuatroMorte() == verdadeiro)
						{
							pare
						}
							senao
						{
							QuatroBaralhos()
						}
					
					caso '4':
						u.aguarde(4444)
						QuartoFim()
				
			}
		}
	}
	
	funcao QuartoFim()
	{
		limpa() limpa() limpa() limpa()
		escrevaLenta("Voce eh evoluido a um ser de quatro dimensoes.\n" , 444)
		escrevaLenta("Aqui as coisas sao diferentes, se sente estranho pela mudança.\n" , 44)
		escrevaLenta("Eh como se fosse" , 444)
		u.aguarde((4444-444)/4)
		escrevaLenta("...." , (4444-444)/4)
		limpa() limpa() limpa() limpa()
		escreva("Voce eehh uumm seer ddee quat dime....\n")
		escreva("Aqui aass cois saoo dife sese sent estr pela muda....\n")
		escreva("Eehh como sese foss....\n\n")
		u.aguarde(4444-444)
		escrevaLenta("Fimm" , 444)
		escrevaLenta("...." , 44)
		
		enquanto(4==4)
		{
			
		}
		
	}

	funcao Quatros()
	{
		escrevaLenta("4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444\n\n" , 4/4)
	}

	funcao logico QuatroMorte()
	{
		escrevaLenta("Na proxima pense no 4, agora a força do 4 vai te matar numa chance de 1/4.\n" , 4)
		u.aguarde(44*44)
		
		limpa() limpa() limpa() limpa()
		se(sorteia(1 , 4) == 4)
		{
			escrevaLenta("Foi divido em 4 partes e got fired four times.    (Fire = 4 em Noruegues e Dinamarques)\n" , 4)
			u.aguarde(44*44+44)
			
			para(inteiro q=0; q < 44; q++)
			{
				escreva("\n")
				para(inteiro u=0; u < 4; u++)
				{
					escreva("Died    ")
				}
				
			}
			retorne(verdadeiro)
		}
		senao
		{
			escrevaLenta("Ficou vivo miseravier, tente denovo" , 4)
			u.aguarde(44*44)
			retorne(falso)
		}
	}

	funcao QuatroQuestionamento()
	{
		escrevaLenta("????    :    " , 4)
	}
	
	funcao SalaMantimentos()
	{
		andar_alien = falso

		limpa()
		escreva("==============================================================\n")
		u.aguarde(500)
		escreva("                    [SALA DE MANTIMENTOS]                     \n")
		u.aguarde(500)
		escreva("==============================================================\n")
		u.aguarde(500)
		escreva("Você abre a escotilha hidráulica e entra na sala.\n")
		u.aguarde(500)
		escreva("O ar aqui é gelado e cheira a metal estéril. Prateleiras\n")
		u.aguarde(500)
		escreva("Magnéticas cobrem as paredes com fileiras de pacotes.\n")
		u.aguarde(500)
		escreva("No centro, as luzes azuis de um terminal piscam.\n")
		u.aguarde(500)
		escreva("--------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Este lugar pode ter itens essenciais para restauração de sanidade.\n")
		escreva("[E] para explorar\n")
		escreva("[Q] para retornar\n")
		escreva("Escolha: ")
		leia(andar_teclas)
		limpa()
		escolha(andar_teclas)
		{
			caso 'E':
			caso 'e':
				explorarMantimentos()
				pare
			caso 'Q':
			caso 'q':
				escreva("")
				pare					
		}
	}

	funcao explorarMantimentos()
	{
		escreva("---------------------------------------------------------------------------------------------------\n")
		u.aguarde(500)
		escrevaLenta("Você anda e olha ao redor do enorme espaço cheio de corredores frios com prateleiras,\n", 33)
		u.aguarde(500)
		escrevaLenta("de um lado, centenas de pacotes aluminizados contendo 'Pasta Nutritiva Sabor Alface'.\n", 33)
		u.aguarde(500)
		escrevaLenta("Do outro, través do vidro embaçado, você vê pequenas plantas crescendo em gel nutritivo.\n", 33)
		u.aguarde(500)
		escrevaLenta("Tomates espaciais geneticamente modificados brilham sob uma luz ultravioleta.\n", 33)
		u.aguarde(500)
		escreva("---------------------------------------------------------------------------------------------------\n")
		escreva("[I] para investigar Pasta Nutritiva Sabor Alface\n")
		escreva("[E] para examinar a estufa de Tomates\n")
		escreva("[Q] para retornar")

		leia(andar_teclas)
		limpa()

		se (andar_teclas == 'I' ou andar_teclas == 'i')
		{
        		escrevaLenta("Você pega um pacote de Pasta Nutritiva. A embalagem está fria.\n", 33)
        		escrevaLenta("O rótulo diz: 'Nutrição 100% sintética. Sabor Alface de Júpiter'.\n", 33)
        		escrevaLenta("Lembrar que o chefe Jacquin não pôde vir saborear isso te dá um aperto no peito.\n", 33)
        		u.aguarde(500)
		}
		senao se (andar_teclas == 'E' ou andar_teclas == 'e')
		{
       		escrevaLenta("Você limpa o embaçado do vidro com a manga do traje.\n", 33)
        		escrevaLenta("Os tomates parecem quase vivos sob a luz UV pulsante.\n", 33)
        		escrevaLenta("O painel hidropônico indica: 'Pronto para colheita em 48 horas cósmicas'.\n", 33)
        		u.aguarde(500)
        	 }
    		senao 
    		{
        		escreva("Você decide apenas observar e manter os suprimentos intactos por enquanto.\n")
        		u.aguarde(500)
        		SalaMantimentos()
   		}
	}

	funcao PegChave()
	{
		// B(r,eᵃᵈ) > keʸ.
		
		se (chave_armamento == falso)
		{
			chave_armamento = verdadeiro
			AdicionarItem("Chave de Ferro")
			escreva("Voce pegou a chave! Faca a escolha certa (essa acao tera consequencias...)\n")
			u.aguarde(4000)
			se (sala_armamento == verdadeiro)
			{
				escreva("Se quiser voltar até a porta, mova-se ate X:6 | Y:3\n")
				u.aguarde(2500)
			}
		}
		senao
		{
			escreva("Você já pegou essa chave.\n")
			u.aguarde(1700)
		}
	}

	funcao ChaveArm()
	{
		andar_alien = falso
		
		limpa()
		escreva("Voce entra numa sala escura e esbarra numa mesa, em cima desta mesa tem uma chave de ferro um pouco desgastada...o que voce fara?\n")
		escreva("[w] para pegar a chave\n")
		escreva("[a] para explorar a sala novamente\n")
		escreva("[s] para sair da sala\n")
		escreva("Escolha: ")
		leia(andar_teclas)

		escolha (andar_teclas)
		{
			caso 'W':
			caso 'w':
				PegChave()
			pare
			caso 'A':
			caso 'a':
				escreva("Você observa a sala novamente, mas não encontra nada de novo.\n")
				u.aguarde(2600)
			pare
			caso 'S':
			caso 's':
				escreva("Você sai da sala.\n")
				u.aguarde(1300)
			pare
			caso contrario:
				escreva("Comando inválido!\n")
				u.aguarde(1300)
		}
		andar_alien = verdadeiro
	}

	funcao LimitPosicoes()
	{
		se (jogador_x > 10.0)
		{
			jogador_x = 10.0
		}
		senao se (jogador_x < -10.0)
		{
			jogador_x = -10.0
		}
	
		se (jogador_y > 10.0)
		{
			jogador_y = 10.0
		}
		senao se (jogador_y < -10.0)
		{
			jogador_y = -10.0
		}
	
		se (alien_x > 10.0)
		{
			alien_x = 10.0
		}
		senao se (alien_x < -10.0)
		{
			alien_x = -10.0
		}
	
		se (alien_y > 10.0)
		{
			alien_y = 10.0
		}
		senao se (alien_y < -10.0)
		{
			alien_y = -10.0
		}
	}	

	funcao MorteSono()
	{

		inteiro enrraboFeito = sorteia(0 , 1000)
		inteiro aposta = sorteia(0 , 1000)
		
		escreva("----------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Voce se deita na cama, sente a tensao dos seus musculos se esvairem...\n")
		u.aguarde(500)
		escreva("a quanto tempo voce nao descansava?..\n")
		u.aguarde(500)
		escreva("O edredom te envolve como um abraço quente e macio \n")
		u.aguarde(500)
		escreva("que te lembra fortemente o quao solitario voce e na sua especie.\n")
		u.aguarde(500)
		escreva("Entao, voce deixa o sono e o cansaço te tomarem e voce adormece profundamente.\n")
		escreva("\n")
		escreva("Aperte ENTER para continuar: ")
		AguardarEnter()
		limpa()
		
		escreva("Durante o seu sono, infelizmente o alien te encontra e ")
		
		se (enrraboFeito == aposta)
		{
			escreva("enrraba")
		}
		senao
		{
			escreva("estraçalha")
		}
		
		escreva(" voce ate a morte.")
		
		se (enrraboFeito == aposta)
		{
			escreva("(FINAL RARO! PABENS)")
		}
		
		u.aguarde(2000)
		escreva("\n========================================\n")
		escreva("         SONO FATAL, FIM DE JOGO        \n")
		escreva("==========================================")
		AguardarEnter()
		Menu()
	}
	funcao SortearPosicoes()
	{
		inteiro nova_x
		inteiro nova_y
		logico posicao_valida = falso
	
		enquanto (posicao_valida == falso)
		{
			nova_x = u.sorteia(-10, 10)
			nova_y = u.sorteia(-10, 10)
	
			se (PosicaoSalaEspecial(nova_x, nova_y) == falso)
			{
				jogador_x = nova_x
				jogador_y = nova_y
				posicao_valida = verdadeiro
			}
		}
	
		posicao_valida = falso
	
		enquanto (posicao_valida == falso)
		{
			nova_x = u.sorteia(-10, 10)
			nova_y = u.sorteia(-10, 10)
	
			se (PosicaoSalaEspecial(nova_x, nova_y) == falso)
			{
				alien_x = nova_x
				alien_y = nova_y
				posicao_valida = verdadeiro
			}
		}
	}

	funcao logico PosicaoSalaEspecial(real x, real y)
	{
	se (x == 6.0 e y == 3.0)
	{
		retorne verdadeiro
	}
	senao se (x == 4.0 e y == 7.0)
	{
		retorne verdadeiro
	}
	senao se (x == 6.0 e y == 7.0)
	{
		retorne verdadeiro
	}
	senao se (x == -5.0 e y == -7.0)
	{
		retorne verdadeiro
	}

	retorne falso

	}
	
	funcao escrevaLenta(cadeia texto , inteiro vel)
    	{
        inteiro tamanho
        caracter letra

        tamanho = txt.numero_caracteres(texto)

        para(inteiro i = 0; i < tamanho; i++)
        {
            letra = txt.obter_caracter(texto, i)
            escreva(letra)
            u.aguarde(vel)
        }
    }
}
