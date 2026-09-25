programa
{
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
				pare
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
			escreva("\nVocê então vê...")
			u.aguarde(500)
			escreva("vultos de algo humanoide passando perto o suficiente para te dar calafrios,\n")
			u.aguarde(600)
			escreva(" você sabe que essa coisa-não humana esteve perseguindo você na solidão desta nave\ne agora, !!!VOCÊ ESTÁ PRESTES A SER ENCURRALADO!!!\n")
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

	funcao AfastarAlienAoDisparar()
	{
		se (alien_x > jogador_x)
		{
			alien_x = alien_x + 1.5
		}
		senao
		{
			alien_x = alien_x - 1.5
		}

		se (alien_y > jogador_y)
		{
			alien_y = alien_y + 1.5
		}
		senao
		{
			alien_y = alien_y - 1.5
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
			escreva("\n*Click* Carregador vazio! Pressione R para recarregar.\n")
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
			SalaChave()
		}
		senao se (jogador_x == 8.0 e jogador_y == 1.0)
		{
			SalaEnfermaria()
		}
		senao se (jogador_x == 6.0 e jogador_y == 7.0)
		{
			SalaDormitorio()
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
		
		escrever_devagar("DOCUMENTO: Laudo de Triagem Psiquiátrica e Biológica\n")
		escrever_devagar("PACIENTE: Dra. Aris Thorne (Especialista em Xenobiologia)\n")
		escrever_devagar("RESPONSÁVEL: Dr. Marcus Vance (Médico Chefe)\n")
		escrever_devagar("STATUS: QUARENTENA NÍVEL 4 [ACESSO RESTRITO]\n")
		escreva("-----------------------------------------------------------------\n\n")
		
		u.aguarde(1000)

		escrever_devagar("[OBSERVAÇÕES CLÍNICAS]:\n")
		escrever_devagar("A paciente deu entrada no setor médico apresentando quadro de paranóia severa.\n")
		escrever_devagar("Relata 'zumbidos na frequência espectral' e insistia que os colegas do módulo B\n")
		escrever_devagar("estavam 'com os olhares vazios e tomados por uma raiva invisível'.\n\n")

		u.aguarde(1200)

		escrever_devagar("[EXAMES FISIOLÓGICOS]:\n")
		escrever_devagar("- Batimentos cardíacos: Excepcionalmente estáveis (incompatível com o pânico).\n")
		escrever_devagar("- Varredura biológica: Negativa para bactérias, vírus ou toxinas conhecidas.\n")
		escrever_devagar("- Mapeamento Cerebral: Anomalia detectada. Padrões de ondas cerebrais mostram\n")
		escrever_devagar("  picos de agressividade extrema ocorrendo em microsegundos, alternados com\n")
		escrever_devagar("  períodos de aparente calma e lucidez.\n\n")

		u.aguarde(1200)

		escrever_devagar("[NOTA FINAL DO MÉDICO]:\n")
		escrever_devagar("A paranoia é contagiosa? De um dia para o outro, três auxiliares que estavam em\n")
		escrever_devagar("contato com a Dra. Aris começaram a manifestar o mesmo comportamento hostil.\n")
		escrever_devagar("O mais perturbador é que NENHUM dos exames aponta infecção física. Não há febre,\n")
		escrever_devagar("não há lesão... É como se a agressividade estivesse sendo transmitida pelo ar,\n")
		escrever_devagar("ou por algo que nossos sensores simplesmente não conseguem rastrear.\n\n")

		escreva("-----------------------------------------------------------------\n")
		escreva("              [FIM DO LAUDO - ARQUIVO SALVO]                     \n")
		escreva("=================================================================\n\n")

		
		escreva("Pressione ENTER para continuar...")
		AguardarEnter()
	}
	funcao escrever_devagar(cadeia texto)
	{
		escreva(texto)
		u.aguarde(300) 
	}

	funcao Quadros()
	{
		escreva("Os quadros mostram retratos de pessoas antigas que parecem te encarar.\n")
		u.aguarde(3000)
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
		
		escreva("A porta pesada se abre com um silvo hidráulico, revelando a Sala de Armamentos.\n")
		escreva("Diante de você, um painel iluminado exibe fileiras de equipamentos avançados.\n")
		escreva("O brilho neon reflete na superfície polida de lasers de energia direcionada e pistolas giroscópicas.\n")
		escreva("Ao lado, descansam armas magnéticas de pulso, lançadores de agulha Flechette e imponentes armas de micro-ondas.\n")
		escreva("O arsenal está à sua disposição.\n")
		escreva("[1] para pegar a Granada de Criogênio\n")
		escreva("[2] para pegar a Pistola Giroscopica\n")
		escreva("[3] para pegar a Arma Magnetica de Pulso\n")
		escreva("[4] para pegar o Injetor de Adrnalina Sintética\n")
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
			caso '4':
				PegarArma("Injetor de Adrenalina", "4", "[ INJETOR DE ADRENALINA SINTÉTICA ]", "Aumenta a velocidade (chance de esquiva).","")
				u.aguarde(2500)
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
		escreva("Você entrou em uma sala com algumas pilhas de folhas nas mesas,\n a iluminação do ambiente falha levemente. O local tem cheiro de coisas antigas, nas paredes há alguns quadros\n")
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
					escreva("[S] sim ou [N] não")
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
		escreva("Você entra em um local repleto de cabines individuais e no meio delas tem um corredor livre. Ao que parece, são os dormitórios dos tripulantes que um dia existiram ali...\n")
		escreva("[E] para explorar\n")
		escreva("[Q] para retornar\n")

		escolha(andar_teclas)
		{
			caso 'E':
			caso 'e':
				escreva("Você nota que ao longo do corredor, existem oito quartos, quatro em cada lado e eles são enumerados por uma placa acima da porta:Quarto 1 e do outro lado do corredor Quarto 2 e assim sucessivamente\n.")
				escreva("Digite o número do dormitório que deseja explorar: ")
				leia(andar_teclas)

				limpa()
				
				escolha(andar_teclas)
				{
			caso '1':
				escreva("Você se vira em direção ao primeiro quarto à sua esquerda e ao abrir a porta que range suavemente você encontra um quarto com uma aparência comum devido ao sistema de controle de gravidade e oxigênio que envolve toda a estação...\n")
				u.aguarde(2300)
				escreva("No pequeno quarto há uma cama com edredons marrons, intocada. Acima desta cama, acoplado ao teto há uma máscara de oxigênio para emergência...\n")
				u.aguarde(2000)
				escreva("Na mesinha de canto, ao lado da cama, há uma moldura de madeira com a foto de um homem e ao que parece, sua esposa.\n")
				escreva("[E] para interagir")
				escreva("[Q] para continuar explorando")
				leia(andar_teclas)

				limpa()

				
			escolha(andar_teclas)
			{

			caso 'E':
			caso 'e':
				escreva("Você pega a pequena moldura de mesa nas mãos, passa a mão pela foto, tentando reconhecer aquelas pessoas...\n")
				u.aguarde(1000)
				escreva("Então o seu foco muda repentinamente,")
				u.aguarde(500) 
				escreva("uma forte dor de cabeça toma suas têmporas,")
				u.aguarde(500)
				escreva(" você fecha os olhos com força diante dessa situação.\n")
				escreva("Sua mente te tortura com flashs de pessoas correndo desordenadamente, umas tentando se esconder e outras tentando atacar agressivamente o ser humanoide que você não consegue identificar.\n")
				escreva("Sua mente é tomada por confusão, você pensa:\n")
				escreva("M")
				u.aguarde(500)
				escreva("a")
				u.aguarde(500)
				escreva("s")
				u.aguarde(500)
				escreva(" ")
				u.aguarde(500)
				escreva("o")
				u.aguarde(500)
				escreva(" ")
				u.aguarde(500)
				escreva("q")
				u.aguarde(500)
				escreva("u")
				u.aguarde(500)
				escreva("e")
				u.aguarde(500)
				escreva(" ")
				u.aguarde(500)
				escreva("e")
				u.aguarde(500)
				escreva("s")
				u.aguarde(500)
				escreva("t")
				u.aguarde(500)
				escreva("á")
				u.aguarde(500)
				escreva(" ")
				u.aguarde(500)
				escreva("a")
				u.aguarde(500)
				escreva("c")
				u.aguarde(500)
				escreva("o")
				u.aguarde(500)
				escreva("n")
				u.aguarde(500)
				escreva("t")
				u.aguarde(500)
				escreva("e")
				u.aguarde(500)
				escreva("c")
				u.aguarde(500)
				escreva("e")
				u.aguarde(500)
				escreva("n")
				u.aguarde(500)
				escreva("d")
				u.aguarde(500)
				escreva("o")
				u.aguarde(500)
				escreva("?\n")
				u.aguarde(500)
				escreva("Assim que você se recompõe, você devolve a moldura e continua investigando o quarto.")
				pare
			caso 'Q':
			caso 'q':
				escreva("Você ignora a moldura e olha mais uma vez ao redor, esse quarto está tão...perfeito que chega a ser esquisito pensar que alguém \ncom uma vida, família e nome um dia dormiu ali.\n")
				u.aguarde(3000)
				pare
			caso contrario:
					escreva("comando inválido!")
					pare
		}
				pare
			caso '2':
				escreva("Você adentra em um dormitório com arranhões nas paredes, um desktop em tela azul, uma cama aparentemente feita às pressas...")
			pare
			caso contrario: escreva("contrario")
			pare
		}
			pare
			caso '3': escreva(1)
			pare
			caso contrario: escreva("contrario")
			pare
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

	funcao SalaChave()
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

	retorne falso

	}
}
