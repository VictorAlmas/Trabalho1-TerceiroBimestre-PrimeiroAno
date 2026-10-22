programa
{
	inclua biblioteca Texto --> txt
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat


	inteiro sanidade = 100
	const inteiro SANIDADE_MAXIMA = 100
	const inteiro RECUPERA_COMIDA = 10
	const inteiro RECUPERA_MEDKIT = 50
	const inteiro PASSOS_INFECCAO = 10
	const inteiro PISTAS_PARA_REVELACAO = 4
	real jogador_x = 0.0
	real jogador_y = 0.0


	real alien_x = 20.0
	real alien_y = 20.0
	logico andar_alien = verdadeiro
	inteiro alien_congelado = 0
	inteiro granadas_na_sala = 3

	inteiro mun_atual_salva[3] = {0, 0, 0}
	inteiro mun_reserva_salva[3] = {0, 0, 0}
	logico arma_ja_equipada[3] = {falso, falso, falso}

	inteiro opcao
	caracter andar_teclas
	logico menu_ativo = verdadeiro


	logico sala_armamento = falso


	cadeia inventario[20]
	inteiro itensNoInventario = 0


	cadeia arma_equipada = ""
	inteiro municao_atual = 0
	inteiro municao_carregador = 0
	inteiro municao_reserva = 0


	logico medkit_pego = falso
	inteiro sorteio
	logico infectado = falso
	inteiro passos_infectado = 0

	logico pista_intruso = falso
	logico pista_laudo = falso
	logico pista_redoma = falso
	logico pista_contagio = falso


	funcao Sair()
	{
		limpa()
		para (inteiro g = 15; g > 0; g--)
		{
			limpa()
			escreva("Conexao encerrada. O ultimo eco se apagou no vacuo")
			para (inteiro i = 0; i < g; i++)
			{
				escreva(".")
			}
			u.aguarde(500)
		}
		escreva("\n")
		limpa()
		escreva("Conexao encerrada. O ultimo eco se apagou no vacuo")
		u.aguarde(1000)
		limpa()
		menu_ativo = falso
		retorne
	}


	funcao Creditos()
	{
		limpa()
		escreva("=================== TRANSMISSAO DE CREDITOS ===================\n\n")
		escreva("  Desenvolvedores: Ayka E., Victor H., Lucas N. \n")
		escreva("  Interface de Desenvolvimento: Portugol Studio\n")
		escreva("  Atmosfera: Suspense Sci-Fi / Sobrevivencia\n\n")
		escreva("===============================================================\n")
		escreva("Pressione ENTER para retornar ao terminal...")
		AguardarEnter()
		retorne
	}


	funcao Historia()
	{
		limpa()
		escreva("===================== ARQUIVOS DE MEMORIA =====================\n\n")
		escreva("  O silencio engoliu tudo. As cidades estao vazias e as estrelas\n")
		escreva("  parecem mais frias. Nao ha mais transmissoes, nao ha mais vozes.\n")
		escreva("  Voce capta um pulso fraco no radar. Um ultimo eco humano.\n\n")
		escreva("  OBJETIVO: Siga o sinal. Descubra se voce realmente esta sozinho.\n")
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
			escreva("Desativando modo de sobrevivencia em estado de criogenia acordar sobrevivente\n\n")
			escreva("Buscando sinais vitais no perimetro cosmico")
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
		escreva("                       CONEXAO ESTABELECIDA                             \n")
		escreva("=========================================================================\n\n")
		u.aguarde(500)
		escreva("Estatica ecoa pelos alto-falantes da sua cabine.\n\n")
		escreva("O monitor pisca com uma linha de codigo piscando em vermelho...\n\n")
		u.aguarde(1500)
		escreva("ALERTA DE SEGURANCA: Intruso detectado a bordo da nave.\n\n")
		u.aguarde(1000)
		escreva("Especie nao identificada.\n\n")
		pista_intruso = verdadeiro
		u.aguarde(3000)
		escreva("Iniciando protocolo de orientacao para sobrevivente.\n\n")
		u.aguarde(2000)
		escreva("Voce esta na sala principal de criogenia.\n\n")
		u.aguarde(1000)
		escreva("Ha a sala de mantimentos, a sala de armamentos e a sala de enfermaria,\n")
		u.aguarde(1000)
		escreva("entre outras possiveis salas que podem ser descobertas.\n\n")
		u.aguarde(1000)
		escreva("Entrando em modo de suporte de vida e manutencao.\n\n")
		u.aguarde(1000)
		escreva("Ativando estufa para melhorar o fluxo e a qualidade do ar.\n\n")
		u.aguarde(1200)
		escreva("Um som metalico ecoa pelos corredores da nave.\n\n")
		u.aguarde(1000)
		escreva("Sistemas secundarios voltam lentamente a atividade.\n\n")
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
			escreva("\n PRESSIONE ENTER PARA COMECAR: ")
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
				caso 6:
					SalaEscritorio()
					pare
				caso 44:
					QuartoQuarto()
					pare
				caso 444:
					QuatroBaralhos()
					pare
				caso 4444:
					QuartoFim()
					pare

				caso contrario:
					limpa()
					escrevaAguarde("Opcao errada! Tente novamente.\n", 1500)
			}
		}
	}


	funcao ExecutarJogo()
	{
		escreva("\nVoce esta na sala principal de criogenia, seja la o que esta a bordo, esta procurando voce...\n")
		escrevaAguarde("ALERTA DE SEGURANCA: Intruso detectado a bordo da nave. Especie nao identificada.\n", 2500)
		pista_intruso = verdadeiro
		SortearPosicoes()
		loop()
	}


	funcao Status()
	{
		escreva("==================================================\n")
		escreva(" SANIDADE: ", sanidade, "/100\n")
		se (infectado)
		{
			escreva(" VIRUS ATIVO! Passos restantes: ", PASSOS_INFECCAO - passos_infectado, "\n")
			escreva(" ", SintomaInfeccao(), "\n")
		}
		escreva(" Posicao do jogador: X:", jogador_x, " | Y:", jogador_y, "\n")
		escreva(" Posicao do alien: X:", alien_x, " | Y:", alien_y, "\n")
		se (alien_congelado > 0)
		{
			escreva(" Alien CONGELADO por ", alien_congelado, " movimentos\n")
		}
		se (arma_equipada != "")
		{
			escreva(" Arma: ", arma_equipada, " | Municao: ", municao_atual, "/", municao_carregador, " (Reserva: ", municao_reserva, ")\n")
		}
		escreva("==================================================\n")
	}


	funcao recSan()
	{
		inteiro recuperado

		andar_alien = falso

		se (sanidade >= SANIDADE_MAXIMA)
		{
			escrevaAguarde("Sua sanidade ja esta no maximo, guarde a comida para depois.\n", 800)
		}
		senao se (comer() == verdadeiro)
		{
			recuperado = RestaurarSanidade(RECUPERA_COMIDA)
			escreva("Voce se alimentou e recuperou ", recuperado, " de sanidade. (", sanidade, "/", SANIDADE_MAXIMA, ")\n")
			u.aguarde(1500)
		}
		senao
		{
			escrevaAguarde("Azar, voce nao tem comida!\n", 800)
		}
		andar_alien = verdadeiro
	}


	funcao Acao(cadeia acao)
	{
		real x_antes = jogador_x
		real y_antes = jogador_y

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
		senao se (acao == "V" ou acao == "v")
		{
			recSan()
		}
		senao
		{
			escreva("Opcao invalida!\n")
			u.aguarde(800)
		}


		LimitPosicoes()

		se (infectado e (jogador_x != x_antes ou jogador_y != y_antes))
		{
			ContarPassoInfeccao()
		}
	}


	funcao PosAlien()
	{
		se (alien_congelado > 0)
		{
			alien_congelado--
			escreva("O Alien esta congelado... (", alien_congelado, " movimentos restantes)\n")
			u.aguarde(600)
		}
		senao se (andar_alien == verdadeiro)
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
		escreva("O Alien encurralou voce no silencio do espaco.\n")
		FinalRevelacao()
		Morrido()
	}


	funcao loop()
	{
		cadeia acao_jogador
		real x_antes
		real y_antes


		enquanto (sanidade > 0)
		{
			limpa()


			CalcSan()


			se (sanidade <= 0)
			{
				pare
			}


			Status()


			escreva("Use W(subir), A(esquerda), S(descer), D(direita), F(inventario), V(comer), 6(recarregar), 7(atirar): ")
			leia(acao_jogador)


			x_antes = jogador_x
			y_antes = jogador_y

			Acao(acao_jogador)


			PosAlien()


			se (jogador_x != x_antes ou jogador_y != y_antes)
			{
				EventoSala()
			}
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
			escreva("| O ALIEN ESTA MUITO PERTO, FUJA!!! |\n")
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
			escreva("Item \"", nome, "\" adicionado ao inventario! (", itensNoInventario, "/20)\n")
		}
		senao
		{
			escreva("Inventario cheio! Nao eh possivel carregar mais itens.\n")
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


	funcao inteiro IndiceDoItem(cadeia nome)
	{
		para (inteiro i = 0; i < itensNoInventario; i++)
		{
			se (inventario[i] == nome)
			{
				retorne i
			}
		}
		retorne -1
	}


	funcao logico TemItem(cadeia nome)
	{
		retorne IndiceDoItem(nome) >= 0
	}


	funcao inteiro RestaurarSanidade(inteiro quantidade)
	{
		inteiro antes = sanidade

		sanidade = sanidade + quantidade

		se (sanidade > SANIDADE_MAXIMA)
		{
			sanidade = SANIDADE_MAXIMA
		}

		retorne sanidade - antes
	}


	funcao inteiro ValorRestauracao(cadeia nome)
	{
		se (nome == "Nano-Medkit")
		{
			retorne RECUPERA_MEDKIT
		}
		se (EhComida(nome))
		{
			retorne RECUPERA_COMIDA
		}
		retorne 0
	}


	funcao logico EhConsumivel(cadeia nome)
	{
		se (ValorRestauracao(nome) > 0)
		{
			retorne verdadeiro
		}
		retorne falso
	}


	funcao UsarConsumivel(inteiro indice)
	{
		cadeia nome = inventario[indice]
		inteiro recuperado

		se (sanidade >= SANIDADE_MAXIMA)
		{
			escreva("Sua sanidade ja esta no maximo. Guarde \"", nome, "\" para depois.\n")
			retorne
		}

		recuperado = RestaurarSanidade(ValorRestauracao(nome))
		RemoverItemPorIndice(indice)

		se (nome == "Nano-Medkit")
		{
			escreva("Voce injeta o Nano-Medkit e sente os nanobots acalmando sua mente...\n")
		}
		senao
		{
			escreva("Voce se alimentou com ", nome, ".\n")
		}
		escreva("Sanidade recuperada: +", recuperado, " (", sanidade, "/", SANIDADE_MAXIMA, ")\n")
	}


	funcao TrocarItem()
	{
		inteiro origem
		inteiro destino
		cadeia temp


		se (itensNoInventario == 0)
		{
			escreva("Inventario vazio, nao ha itens para trocar.\n")
			u.aguarde(1000)
			retorne
		}


		escreva("Digite o numero do item que deseja mover: ")
		leia(origem)
		escreva("Digite a posicao de destino: ")
		leia(destino)


		origem--
		destino--


		se (origem >= 0 e origem < itensNoInventario e destino >= 0 e destino < itensNoInventario)
		{
			temp = inventario[origem]
			inventario[origem] = inventario[destino]
			inventario[destino] = temp
			escreva("Itens trocados de posicao com sucesso!\n")
		}
		senao
		{
			escreva("Posicao invalida.\n")
		}
		u.aguarde(1200)
	}


	funcao UsarItem()
	{
		inteiro indice
		cadeia nome_arma


		se (itensNoInventario == 0)
		{
			escreva("Inventario vazio, nao ha itens para usar.\n")
			u.aguarde(1000)
			retorne
		}


		escreva("Digite o numero do item que deseja usar: ")
		leia(indice)
		indice--


		se (indice >= 0 e indice < itensNoInventario)
		{
			se (EhConsumivel(inventario[indice]))
			{
				UsarConsumivel(indice)
				u.aguarde(1500)
				retorne
			}



			se (EhArma(inventario[indice]))
			{
				nome_arma = inventario[indice]
				RemoverItemPorIndice(indice)
				escreva("Voce usou: ", nome_arma, "\n")
				EquiparArma(nome_arma)
			}
			senao
			{
				escreva("\"", inventario[indice], "\" nao pode ser usado assim. Ele funciona sozinho quando voce chega na porta certa.\n")
			}
		}
		senao
		{
			escreva("Posicao invalida.\n")
		}
		u.aguarde(1500)
	}


	funcao RetirarItem()
	{
		inteiro indice


		se (itensNoInventario == 0)
		{
			escreva("Inventario vazio, nao ha itens para retirar.\n")
			u.aguarde(1000)
			retorne
		}


		escreva("Digite o numero do item que deseja descartar: ")
		leia(indice)
		indice--


		se (indice >= 0 e indice < itensNoInventario)
		{
			escreva("Item \"", inventario[indice], "\" descartado.\n")
			RemoverItemPorIndice(indice)
		}
		senao
		{
			escreva("Posicao invalida.\n")
		}
		u.aguarde(1000)
	}


	funcao ExibirCabecalhoInv()
	{
		escreva("=================================\n")
		escreva("            INVENTARIO           \n")
		escreva("=================================\n")
		escreva("Espacos livres: ", (20 - itensNoInventario), " / 20\n\n")
	}


	funcao ExibirListaInv()
	{
		se (itensNoInventario == 0)
		{
			escreva("O inventario esta vazio.\n\n")
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
		escreva("[1] Trocar item de posicao\n")
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
				escreva("Opcao invalida.\n")
				u.aguarde(800)
		}
		andar_alien = verdadeiro
	}
	funcao inteiro IndiceArma(cadeia nome)
	{
		se (nome == "Pistola Giroscopica")
		{
			retorne 0
		}
		senao se (nome == "Arma Magnetica de Pulso")
		{
			retorne 1
		}
		senao se (nome == "Granada de Criogenio")
		{
			retorne 2
		}

		retorne -1
	}

	funcao logico EhArma(cadeia nome)
	{
		retorne IndiceArma(nome) >= 0
	}

	funcao inteiro ReservaInicial(cadeia nome)
	{
		se (nome == "Granada de Criogenio")
		{
			retorne 0
		}

		retorne CapacidadeDaArma(nome) * 3
	}

	funcao inteiro CapacidadeDaArma(cadeia nome)
	{
		se (nome == "Pistola Giroscopica")
		{
			retorne 12
		}
		senao se (nome == "Arma Magnetica de Pulso")
		{
			retorne 6
		}
		senao se (nome == "Granada de Criogenio")
		{
			retorne 1
		}

		retorne 10
	}


	funcao EquiparArma(cadeia nome)
	{
		inteiro novo = IndiceArma(nome)
		inteiro antigo

		se (arma_equipada != "")
		{
			se (arma_equipada != "Granada de Criogenio")
			{
				antigo = IndiceArma(arma_equipada)
				mun_atual_salva[antigo] = municao_atual
				mun_reserva_salva[antigo] = municao_reserva
			}
			AdicionarItem(arma_equipada)
		}

		arma_equipada = nome
		municao_carregador = CapacidadeDaArma(nome)

		se (nome == "Granada de Criogenio")
		{
			municao_atual = 1
			municao_reserva = 0
		}
		senao se (arma_ja_equipada[novo])
		{
			municao_atual = mun_atual_salva[novo]
			municao_reserva = mun_reserva_salva[novo]
		}
		senao
		{
			municao_atual = municao_carregador
			municao_reserva = ReservaInicial(nome)
			arma_ja_equipada[novo] = verdadeiro
		}


		escreva("\n[", arma_equipada, "] equipada! (", municao_atual, "/", municao_carregador, ")\n")
		se (nome != "Granada de Criogenio")
		{
			escreva("Municao de reserva: ", municao_reserva, "\n")
		}
		u.aguarde(1500)
	}


	funcao real RecuoDaArma(cadeia nome)
	{
		se (nome == "Pistola Giroscopica")
		{
			retorne 1.0
		}
		senao se (nome == "Arma Magnetica de Pulso")
		{
			retorne 2.5
		}

		retorne 1.5

	}


	funcao AfastarAlienAoDisparar()
	{
		real r = RecuoDaArma(arma_equipada)

		se (alien_congelado > 0)
		{
			retorne
		}


		se (alien_x > jogador_x)
		{
			alien_x = alien_x + r
		}
		senao se (alien_x < jogador_x)
		{
			alien_x = alien_x - r
		}


		se (alien_y > jogador_y)
		{
			alien_y = alien_y + r
		}
		senao se (alien_y < jogador_y)
		{
			alien_y = alien_y - r
		}
	}


	funcao inteiro ContarGranadas()
	{
		inteiro total = 0

		para (inteiro i = 0; i < itensNoInventario; i++)
		{
			se (inventario[i] == "Granada de Criogenio")
			{
				total++
			}
		}

		retorne total
	}

	funcao Atirar()
	{
		se (arma_equipada == "")
		{
			escreva("\nVoce nao tem nenhuma arma equipada!\n")
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

		se (arma_equipada == "Granada de Criogenio")
		{
			alien_congelado = 6
			escreva("\nVoce arremessou a Granada de Criogenio!\n")
			escreva("O Alien congela no lugar!\n")

			arma_equipada = ""
			municao_atual = 0
			municao_carregador = 0
			municao_reserva = 0

			escreva("Granadas restantes no inventario: ", ContarGranadas(), "\n")
			u.aguarde(1500)
			retorne
		}

		escreva("\nVoce disparou a ", arma_equipada, "! (", municao_atual, "/", municao_carregador, " restantes)\n")


		AfastarAlienAoDisparar()


		escreva("O alien recua com o estampido!\n")
		u.aguarde(1200)
	}


	funcao Recarregar()
	{
		inteiro necessario


		se (arma_equipada == "")
		{
			escreva("\nVoce nao tem nenhuma arma para recarregar!\n")
			u.aguarde(1200)
			retorne
		}


		se (municao_atual == municao_carregador)
		{
			escreva("\nO carregador ja esta cheio!\n")
			u.aguarde(1000)
			retorne
		}


		se (municao_reserva <= 0)
		{
			escreva("\nVoce nao tem mais municao de reserva!\n")
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
			escreva("Tem uma sala aqui, quer entrar?\n")
			escreva("[S] sim ou [N] nao?\n")
			escreva("Escolha: ")

			leia(andar_teclas)


			escolha(andar_teclas)
			{
				caso 'S':
				caso 's':
					SalaEscritorio()
					pare
				caso 'N':
				caso 'n':
					pare
			}
		}
		senao se (jogador_x == 0.0 e jogador_y == 0.0)
		{
			se (TemItem("Olho que tudo ve"))
			{
				escreva("Tem uma sala aqui, quer entrar?\n")
				escreva("[S] sim ou [N] nao?\n")
				escreva("Escolha: ")

				leia(andar_teclas)


				escolha(andar_teclas)
				{
					caso 'S':
					caso 's':
						SalaF9()
						pare
					caso 'N':
					caso 'n':
						pare
				}
			}
		}
		senao se (jogador_x == 4.0 e jogador_y == 7.0)
		{
			ChaveArm()
		}
		senao se (jogador_x == 8.0 e jogador_y == 1.0)
		{
			escreva("Tem uma sala aqui, quer entrar?\n")
			escreva("[S] sim ou [N] nao?\n")
			escreva("Escolha: ")

			leia(andar_teclas)


			escolha(andar_teclas)
			{
				caso 'S':
				caso 's':
					SalaEnfermaria()
					pare
				caso 'N':
				caso 'n':
					pare
			}
		}
		senao se (jogador_x == 6.0 e jogador_y == 7.0)
		{
			escreva("Tem uma sala aqui, quer entrar?\n")
			escreva("[S] sim ou [N] nao?\n")
			escreva("Escolha: ")

			leia(andar_teclas)


			escolha(andar_teclas)
			{
				caso 'S':
				caso 's':
					SalaDormitorio()
					pare
				caso 'N':
				caso 'n':
					pare
			}
		}
		senao se (jogador_x == -5.0 e jogador_y == -7.0)
		{
			escreva("Tem uma sala aqui, quer entrar?\n")
			escreva("[S] sim ou [N] nao?\n")
			escreva("Escolha: ")

			leia(andar_teclas)


			escolha(andar_teclas)
			{
				caso 'S':
				caso 's':
					se (TemItem("Chave prateada"))
					{
						SalaMantimentos()
					}
					senao
					{
						escrevaAguarde("A porta esta trancada, voce precisara de uma chave...\n", 2000)
					}
					pare

				caso 'N':
				caso 'n':
					pare


			}
		}
		senao se (jogador_x == -10.0 e jogador_y == -5.0)
		{
			escreva("Tem uma sala aqui, quer entrar?\n")
			escreva("[S] sim ou [N] nao?\n")
			escreva("Escolha: ")

			leia(andar_teclas)


			escolha(andar_teclas)
			{
				caso 'S':
				caso 's':
					se (TemItem("Cartao de Acesso Nv.2"))
					{
						salaQuarentena()
					}
					senao
					{
						escrevaAguarde("A porta esta trancada, voce precisara de um cartao de acesso...\n", 2000)
					}
					pare
			}
		}
	}


	funcao Folhas()
	{
		andar_alien = falso
		escreva("Voce mexe nas folhas. Sao relatorios antigos cobertos de poeira e sem nexo. Uma folha em especial te chama atencao...\n")
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
			caso contrario: escrevaAguarde("Comando invalido!\n", 1200)
				pare
		}
		andar_alien = verdadeiro
	}


	funcao ExibirLaudo()
	{
		limpa()
		pista_laudo = verdadeiro

		escreva("=================================================================\n")
		escreva("       ESTACAO ESPACIAL AURA - RELATORIO MEDICO / CONFIDENCIAL   \n")
		escreva("=================================================================\n\n")

		u.aguarde(800)

		escrevaLenta("DOCUMENTO: Laudo de Triagem Psiquiatrica e Biologica\n" , 10)
		escrevaLenta("PACIENTE: Dra. Aris Thorne (Especialista em Xenobiologia)\n" , 10)
		escrevaLenta("RESPONSAVEL: Dr. Marcus Vance (Medico Chefe)\n" , 10)
		escrevaLenta("STATUS: QUARENTENA NIVEL 4 [ACESSO RESTRITO]\n" , 10)
		escreva("-----------------------------------------------------------------\n\n")

		u.aguarde(1000)


		escreva("[OBSERVACOES CLINICAS]:\n")
		escrevaLenta("A paciente deu entrada no setor medico apresentando quadro de paranoia severa.\n" , 10)
		escrevaLenta("Relata 'zumbidos na frequencia espectral' e insistia que os colegas do modulo B\n" , 10)
		escrevaLenta("estavam 'com os olhares vazios e tomados por uma raiva invisivel'.\n\n" , 10)


		u.aguarde(1200)


		escreva("[EXAMES FISIOLOGICOS]:\n")
		escrevaLenta("- Batimentos cardiacos: Excepcionalmente estaveis (incompativel com o panico).\n" , 10)
		escrevaLenta("- Varredura biologica: Negativa para bacterias, virus ou toxinas conhecidas.\n" , 10)
		escrevaLenta("- Mapeamento Cerebral: Anomalia detectada. Padroes de ondas cerebrais mostram\n" , 10)
		escrevaLenta("  picos de agressividade extrema ocorrendo em microsegundos, alternados com\n" , 10)
		escrevaLenta("  periodos de aparente calma e lucidez.\n\n" , 10)


		u.aguarde(1200)


		escreva("[NOTA FINAL DO MEDICO]:\n")
		escrevaLenta("A paranoia eh contagiosa? De um dia para o outro, tres auxiliares que estavam em\n" , 10)
		escrevaLenta("contato com a Dra. Aris comecaram a manifestar o mesmo comportamento hostil.\n" , 10)
		escrevaLenta("O mais perturbador eh que NENHUM dos exames aponta infeccao fisica. Nao ha febre,\n" , 10)
		escrevaLenta("nao ha lesao... Eh como se a agressividade estivesse sendo transmitida pelo ar,\n" , 10)
		escrevaLenta("ou por algo que nossos sensores simplesmente nao conseguem rastrear.\n\n" , 10)


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
		se (nome != "Granada de Criogenio" e (TemItem(nome) ou arma_equipada == nome))
		{
			escrevaAguarde("Voce ja tem essa arma.\n", 1500)
			retorne
		}

		se (itensNoInventario >= 20)
		{
			escrevaAguarde("Inventario cheio! Nao eh possivel carregar mais itens.\n", 1500)
			retorne
		}

		AdicionarItem(nome)
		escreva(numero, " - ", titulo, " \n")
		escreva("-------------------------------------------------------------------\n")
		escreva("Descricao: ", descricao, "\n")
		escreva(vantagem, "\n")
		u.aguarde(2500)
	}


	funcao SalaArmamento()
	{
		andar_alien = falso


		escreva("=====================================================================================\n")
		u.aguarde(500)
		escreva("                                     [SALA DE ARMAMENTOS]                                 \n")
		u.aguarde(500)
		escreva("=====================================================================================\n")
		escrevaLenta("A porta pesada se abre com um silvo hidraulico, revelando a Sala de Armamentos.\n", 50)
		escrevaLenta("Diante de voce, um painel iluminado exibe fileiras de equipamentos avancados.\n", 50)
		escrevaLenta("O brilho neon reflete na superficie de Granadas de Criogenio e pistolas giroscopicas.\n", 50)
		escrevaLenta("Ao lado, descansam armas magneticas de pulso.\n", 50)
		escrevaLenta("O arsenal esta a sua disposicao.\n", 50)
		escreva("[1] para pegar a Granada de Criogenio (restam ", granadas_na_sala, " na sala)\n")
		escreva("[2] para pegar a Pistola Giroscopica\n")
		escreva("[3] para pegar a Arma Magnetica de Pulso\n")
		escreva("[Q] para retornar\n")
		leia(andar_teclas)


		escolha (andar_teclas)
		{
			caso '1':
				se (granadas_na_sala <= 0)
				{
					escreva("Nao restam granadas de criogenio na sala.\n")
				}
				senao se (itensNoInventario >= 20)
				{
					escreva("Inventario cheio! Nao eh possivel carregar a granada.\n")
				}
				senao
				{
					granadas_na_sala--
					PegarArma("Granada de Criogenio", "1", "[ GRANADA DE CRIOGENIO ]", "Utilidade: Congela o Alien no lugar por 5 movimentos, fazendo com que de tempo de fugir.", "Uso unico.")
					escreva("Restam ", granadas_na_sala, " granadas na sala.\n")
				}
				pare
			caso '2':
				PegarArma("Pistola Giroscopica", "2", "[ PISTOLAS GIROSCOPICAS ]", "Dispara mini-foguetes que aceleram apos sairem do cano.", "Vantagem: Faz o Alien recuar 1.0 nas coordenadas X e Y.")
				pare
			caso '3':
				PegarArma("Arma Magnetica de Pulso", "3", "[ ARMAS MAGNETICAS DE PULSO ]", "Bobinas eletromagneticas que aceleram um dardo metalico envenenado.", "Vantagem: Faz o Alien recuar 2.5 em X e Y.")
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


		escreva("Parabens! Voce desbloqueou a sala de armamentos!\n")
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
		escrevaAguarde("                            [SALA ESCRITORIO]                          \n", 500)
		escrevaAguarde("=======================================================================\n", 500)
		escrevaLenta("        Voce entrou em uma sala com algumas pilhas de folhas nas mesas,\n", 33)
		escrevaLenta("a iluminacao do ambiente falha levemente. O local tem cheiro de coisas antigas,\n", 33)
		escrevaLenta("    nas paredes ha alguns quadros\n", 33)
		escrevaLenta("    Voce nota uma porta no fim desta sala, o que voce fara?\n", 33)

		sala_armamento = verdadeiro

		escreva("===============================\n")
		escreva("|[1] para abrir a porta        \n")
		escreva("|[2] para olhar as folhas      \n")
		escreva("|[3] para olhar os quadros     \n")
		escreva("|[Q] para retornar             \n")
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
				pare
			caso contrario:
				escrevaAguarde("Comando invalido!\n", 1200)
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
		escreva("As portas pneumaticas se abrem com um silvo suave.\n")
		u.aguarde(500)
		escreva("O cheiro de ozonio e antisseptico invade seus pulmoes.\n")
		u.aguarde(500)
		escreva("Luzes fluorescentes brancas piscam no teto, iluminando\n")
		u.aguarde(500)
		escreva("macas cirurgicas vazias e tanques de vidro com liquido azul.\n")
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
				escreva("Voce comeca a revirar os armarios metalicos e gavetas de\n")
				escreva("suprimentos medicos danificados...\n")
				escreva("\nPressione ENTER para continuar...")
				AguardarEnter()


				sorteio = u.sorteia(1, 3)


				escolha(sorteio)
				{
					caso 1:
						se (medkit_pego)
						{
							escrevaAguarde("O compartimento secreto esta vazio, voce ja pegou o Nano-Medkit.\n", 2500)
							pare
						}
						escreva("\n[SUCESSO] Voce encontrou um compartimento secreto!\n")
						escreva("Contem 1 Nano-Medkit, gostaria de adicionar ao seu inventario?\n")
						escreva("[S] sim ou [N] nao\n")
						escreva("Escolha: ")
						leia(andar_teclas)


						escolha(andar_teclas)
						{


							caso 'S':
							caso 's':
								se (itensNoInventario >= 20)
								{
									escrevaAguarde("Inventario cheio! Libere espaco e volte depois.\n", 2000)
									pare
								}
								medkit_pego = verdadeiro
								escreva("Para usar, abra o inventario [F] e escolha \"Usar item\".\n")
								AdicionarItem ("Nano-Medkit")
								escreva("\nPressione ENTER para continuar...")
								AguardarEnter()
								pare
							caso 'N':
							caso 'n':
								escrevaAguarde("Voce nao pegou o item.\n", 1000)
								pare
							caso contrario: escrevaAguarde("Comando invalido!\n", 1200)
								pare
						}
						pare


					caso 2:
						se (TemItem("Cartao de Acesso Nv.2"))
						{
							escrevaAguarde("Voce revira os vidros, mas nao ha mais nada de util.\n", 2500)
							pare
						}
						escreva("\n[SUCESSO] Sob restos de vidros de um tanque de bacta quebrado,\n")
						escreva("voce encontra um Cartao de Acesso de Seguranca Nivel 2!\n")
						escreva("\nPressione ENTER para continuar...")
						AguardarEnter()
						escreva("Deseja adicionar ao inventario?\n")
						escreva("[S] sim ou [N] nao?\n")
						escreva("Escolha: ")
						leia(andar_teclas)


						escolha(andar_teclas)
						{


							caso 'S':
							caso 's':
								se (itensNoInventario >= 20)
								{
									escrevaAguarde("Inventario cheio! Libere espaco e volte depois.\n", 2000)
									pare
								}
								AdicionarItem ("Cartao de Acesso Nv.2")
								pare
							caso 'N':
							caso 'n':
								escrevaAguarde("Voce nao pegou o item.\n", 1000)
								pare
							caso contrario: escrevaAguarde("Comando invalido!\n", 1200)
								pare
						}

						pare


					caso 3:
						escreva("\n[FALHA] Voce abre uma gaveta travada a forca e uma pequena\n")
						escreva("explosao de curto-circuito acontece na sua cara!\n")
						escreva("As luzes da enfermaria piscam, mas voce nao encontra nada.\n")
						escreva("\nPressione ENTER para continuar...")
						AguardarEnter()
						pare
				}

			caso 'Q':
			caso 'q':
				escreva("")
				pare
			caso contrario:
				escrevaAguarde("Comando invalido!\n", 1200)
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
		escreva("                                 [DORMITORIOS]                                  \n")
		u.aguarde(500)
		escreva("================================================================================\n")
		u.aguarde(500)
		escreva("              Voce entra em um local repleto de cabines individuais e\n")
		u.aguarde(500)
		escreva("            no meio delas tem um corredor livre.\n")
		u.aguarde(500)
		escreva("Ao que parece, sao os dormitorios dos tripulantes que um dia existiram ali...\n")
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
				escreva("Comando invalido!\n")
				u.aguarde(1500)
				SalaDormitorio()
				pare
		}
		andar_alien = verdadeiro
	}




	funcao ExplorarDormitorio()
	{
		limpa()
		escreva("-----------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Voce nota que ao longo do corredor, existem quatro quartos:\n")
		u.aguarde(500)
		escreva("dois em cada lado e eles sao enumerados por uma placa acima da porta.\n")
		u.aguarde(500)
		escreva("Quarto 1 eh de um lado do corredor, Quarto 2 do outro, e assim por diante.\n")
		u.aguarde(500)
		escreva("-----------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Digite o numero do dormitorio que deseja explorar: ")

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
			caso '4':
				QuartoQuarto()
				pare
			caso contrario:
				escreva("Quarto invalido!\n")
				u.aguarde(1500)
				ExplorarDormitorio()
				pare
		}
	}


	funcao QuartoUm()
	{
		limpa()


		escreva("=======================================================================\n")
		escrevaAguarde("Voce se vira em direcao ao primeiro quarto a sua esquerda e,\n" , 500)
		escrevaAguarde("ao abrir a porta que range suavemente, voce encontra um quarto\n" , 500)
		escrevaAguarde("com uma aparencia comum devido ao sistema de controle de gravidade e oxigenio que envolve toda a estacao...\n" , 2000)

		limpa()


		escreva("-------------------------------------------------------------------------------------------------------------------\n")
		escrevaAguarde("No pequeno quarto ha uma cama com edredons marrons, intocada.\n" , 500)
		escrevaAguarde("Acima desta cama, acoplado ao teto ha uma mascara de oxigenio para emergencia, como todos os dormitorios...\n" , 500)
		escrevaAguarde("Na mesinha de canto, ao lado da cama, ha uma moldura de madeira com a foto de um homem e ao que parece, sua esposa.\n" , 500)
		escreva("-------------------------------------------------------------------------------------------------------------------\n")
		escreva("[E] para interagir\n")
		escreva("[Q] para continuar explorando\n")
		escreva("Escolha: ")

		leia(andar_teclas)


		escolha(andar_teclas)
		{

			caso 'E':
			caso 'e':
				escrevaAguarde("Voce pega a pequena moldura de mesa nas maos, passa a mao pela foto, tentando reconhecer aquelas pessoas...\n" , 300)
				escrevaAguarde("Entao, o seu foco muda repentinamente, " , 300)
				escrevaAguarde("uma forte dor de cabeca toma suas temporas,\n" , 300)
				escrevaAguarde("voce fecha os olhos com forca diante dessa situacao.\n" , 300)
				escrevaAguarde("Sua mente te tortura com flashes de pessoas correndo desordenadamente,\n" , 300)
				escrevaAguarde("umas tentando se esconder e outras tentando atacar agressivamente o ser humanoide que voce nao consegue identificar.\n" , 300)
				escrevaAguarde("Sua mente eh tomada por confusao, voce pensa:\n" , 300)
				escrevaLenta("Mas o que ta acontecendo?\n" , 400)
				escrevaAguarde("Assim que voce se recompoe deste sentimento estranho e mal-estar, voce devolve a moldura e continua investigando o quarto.\n" , 4000)
				pare

			caso 'Q':
			caso 'q':
				escrevaAguarde("Voce ignora a moldura e olha mais uma vez ao redor, esse quarto esta tao...perfeito que chega a ser esquisito pensar que alguem \ncom uma vida, familia e nome um dia dormiu ali.\n" , 3000)
				ExplorarDormitorio()
				pare
		}
	}


	funcao QuartoDois()
	{
		escreva("----------------------------------------------------------------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Voce adentra em um dormitorio com arranhoes nas paredes, um desktop em tela azul, uma cama aparentemente feita as pressas...\n")
		u.aguarde(500)
		escreva("----------------------------------------------------------------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("[A] para investigar os Arranhoes\n")
		escreva("[D] para investigar Desktop\n")
		escreva("[C] para investigar Cama\n")
		escreva("Escolha: ")

		leia(andar_teclas)

		limpa()

		escolha(andar_teclas)
		{
			caso 'A':
			caso 'a':
				escreva("Voce se aproxima das paredes e passa seus dedos pelas marcas, voce nota que...sao arranhoes profundos, talvez um ser humano comum nao fosse capaz disso.\n")
				u.aguarde(3000)
				pare
			caso 'D':
			caso 'd':
				escreva("Voce se aproxima da mesa onde o desktop descansa, voce tenta mexer mas nenhuma resposta...")
				u.aguarde(3000)
				pare
			caso 'C':
			caso 'c':
				escreva("Voce comeca a mexer os lencois e travesseiros e olhar rapidamente embaixo da cama.\n")
				u.aguarde(3000)

				sorteio = u.sorteia(1, 2)

				escolha(sorteio)
				{
					caso 1:
						se (TemItem("Chave prateada"))
						{
							escrevaAguarde("Voce procura embaixo da cama, mas nao ha mais nada la. Voce ja pegou a chave prateada.\n", 2500)
							pare
						}
						escreva("[SUCESSO] Quando voce olha embaixo da cama, voce encontra algo que pode ser util: Uma CHAVE PRATEADA!\n")
						escreva("Gostaria de adicionar ao inventario?\n")
						escreva("[S] sim ou [N] nao?\n")
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
								escrevaAguarde("Voce nao pegou o item.\n", 1000)
								pare
							caso contrario:
								escrevaAguarde("Comando invalido!\n", 1200)
								pare
						}
						pare

					caso 2:
						escrevaAguarde("Que pena! Voce nao encontrou nada :(\n", 2500)
						pare
				}
		}

	}


	funcao QuartoTres()
	{
		escreva("-------------------------------------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Voce vai para o terceiro quarto e, olhando ao redor, voce percebe que esse quarto eh menos neutro,\n")
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
				se (TemItem("Olho que tudo ve"))
				{
					escrevaAguarde("Voce tenta dormir de novo, mas o olho na sua testa nao deixa voce fechar os olhos...\n", 2500)
					pare
				}
				se (itensNoInventario >= 20)
				{
					escrevaAguarde("Seu inventario esta cheio. Libere espaco antes de dormir.\n", 2000)
					pare
				}
				sorteio = u.sorteia(1, 2)
				se (sorteio == 1)
				{
					MorteSono()
				}
				senao
				{
					limpa()
					escrevaLenta("Acorda e percebe que tem um novo olho na sua testa.\n" , 33)
					AdicionarItem("Olho que tudo ve")
					pare
				}
				pare
			caso 'Q':
			caso 'q':
				escreva("")
				pare
		}
	}


	funcao QuartoQuarto()
	{
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
		escrevaLenta(" - Adele. Talentosa Cantora Britanica, tendo 4 albuns de estudio, '25' ganhou 4 Brit Awards e 'Make You Feel My Love', quarto single de divulgacao de '19', chegou a 4 posicao no UK Singles Chart.\n\n" , 4)
		u.aguarde(444)
		escrevaLenta(" - Wangari Maathai. Inteligente Cientista Queniana, tendo ganho o Nobel da Paz em 2004 e no mesmo ano mais 4 diferentes premios, publicou 4 livros e recebeu 4 diplomas honorarios.\n\n" , 4)
		escrevaLenta("Apos isso, tu se locomove as Beliches.\n\n" , 4)
		u.aguarde(44*44)
		escreva("Pressione ENTER para continuar...")
		AguardarEnter()
	}
	funcao QuatroBeliches()
	{
		// escrevaLenta("\n" , 4)
		limpa() limpa() limpa() limpa()
		Quatros()
		escrevaLenta("Percebes que possui 4 beliches, 4 andares com 4 metros de altura cada, alem de cada um ter 4 colchoes de 4cm cada, 4 lencois e 4 travesseiros.\n" , 4)
		u.aguarde(444)
		escrevaLenta("Apos isso, tu se locomove aos Livros.\n\n" , 4)
		u.aguarde(44*44)
		escreva("Pressione ENTER para continuar...")
		AguardarEnter()
	}


	funcao QuatroLivros()
	{
		limpa() limpa() limpa() limpa()
		Quatros()
		escrevaLenta("Observa que todos os 4 livros estao cheios de 4, possuindo 44 paginas divididas em 4 capitulos e possui 4 autores\nSendo eles: \n\n" , 4)
		u.aguarde(444)
		escrevaLenta(" - Paul IV\n\n" , 4)
		escrevaLenta(" - Hugo Fourcade \n\n" , 4)
		escrevaLenta(" - Vlad Patru\n\n" , 4)
		escrevaLenta(" - Hans Vier\n\n" , 4)
		escrevaLenta("Apos isso, tu se locomove aos Baralhos.\n\n" , 4)
		u.aguarde(44*44)
		escreva("Pressione ENTER para continuar...")
		AguardarEnter()
	}
	funcao QuatroBaralhos()
	{
		limpa() limpa() limpa() limpa()
		Quatros()
		escrevaLenta("Viersualiza que cada um dos 4 baralhos possui temas diferentes, um sendo tema das 4 estacoes do ano, outro sendo das 4 semanas do mes, outro sendo 4 periodos do dia e o ultimo sendo dos 4 pontos cardeais \n" , 4)
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
				pare
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
		escrevaLenta("Aqui as coisas sao diferentes, se sente estranho pela mudanca.\n" , 44)
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
			u.aguarde(444444444)
		}

	}


	funcao Quatros()
	{
		escrevaLenta("4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444 4444\n\n" , 4/4)
	}


	funcao logico QuatroMorte()
	{
		escrevaLenta("Na proxima pense no 4, agora a forca do 4 vai te matar numa chance de 1/4.\n" , 4)
		u.aguarde(44*44)

		limpa() limpa() limpa() limpa()
		se(sorteia(1 , 4) == 4)
		{
			escrevaLenta("Foi dividido em 4 partes e got fired four times.    (Fire = 4 em Noruegues e Dinamarques)\n" , 4)
			u.aguarde(44*44+44)

			para(inteiro q=0; q < 44; q++)
			{
				escreva("\n")
				para(inteiro t=0; t < 4; t++)
				{
					escreva("Died    ")
				}

			}
			Morrido()
			retorne(verdadeiro)
		}
		senao
		{
			escrevaLenta("Ficou vivo miseravier, tente de novo" , 4)
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
		escreva("Voce abre a escotilha hidraulica e entra na sala.\n")
		u.aguarde(500)
		escreva("O ar aqui eh gelado e cheira a metal esteril. Prateleiras\n")
		u.aguarde(500)
		escreva("magneticas cobrem as paredes com fileiras de pacotes.\n")
		u.aguarde(500)
		escreva("No centro, as luzes azuis de um terminal piscam.\n")
		u.aguarde(500)
		escreva("--------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Este lugar pode ter itens essenciais para restauracao de sanidade.\n")
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

		andar_alien = verdadeiro
	}

	funcao logico EhComida(cadeia nome)
	{
		se (nome == "Pasta Nutritiva" ou nome == "Tomate")
		{
			retorne verdadeiro
		}
		retorne falso
	}


	funcao logico comer()
	{
		para (inteiro i = 0; i < itensNoInventario; i++)
		{
			se (EhComida(inventario[i]))
			{
				RemoverItemPorIndice(i)
				retorne verdadeiro
			}
		}
		retorne falso
	}

	funcao SalaF9()
	{
		escreva("---------------------------------------------------------------------------------------------------\n")
		u.aguarde(500)
		escrevaLenta("Tu entra numa sala com a escrita 'Cabine do Elysium'...\n", 33)
		u.aguarde(1000)
		limpa()
		escreva("---------------------------------------------------------------------------------------------------\n")
		escrevaLenta("Voce ve finalmente o espaco, vazio e infinito, ressoando o ULTIMO ECO de vida...\n", 33)
		u.aguarde(500)
		escrevaLenta("Percebe um painel com 'Farol-9' escrito nele.\n", 33)
		u.aguarde(500)
		escrevaLenta("Ao lado deste painel possui um botao vermelho.\n", 33)
		u.aguarde(500)
		Final()
	}


	funcao Final()
	{
		escrevaLenta("\nDeseja Apertar? (S/N)\n", 33)
		leia(andar_teclas)
		limpa()
		escreva("---------------------------------------------------------------------------------------------------\n\n")

		escolha(andar_teclas)
		{
			caso 'S':
			caso 's':
				FinalBom()
				pare

			caso 'N':
			caso 'n':
				escrevaAguarde("Tu nao tem escolha KKJK\n" , 1500)
				limpa()
				Final()
				pare
			caso contrario:
				escrevaAguarde("Comando invalido!\n", 1200)
				limpa()
				Final()
				pare
		}

	}

	funcao FinalBom()
	{
		escrevaLenta("Aparece ao painel que um sinal foi enviado...\n" , 33)
		u.aguarde(500)
		escrevaLenta("Porem o Alien lhe encontra e voce morre.\n" , 33)
		u.aguarde(500)
		limpa()
		escrevaLenta("\nO Fim?\n" , 1)
		Morrido()
	}

	funcao explorarMantimentos()
	{
		escreva("---------------------------------------------------------------------------------------------------\n")
		u.aguarde(500)
		escrevaLenta("Voce anda e olha ao redor do enorme espaco cheio de corredores frios com prateleiras,\n", 33)
		u.aguarde(500)
		escrevaLenta("de um lado, centenas de pacotes aluminizados contendo 'Pasta Nutritiva Sabor Alface'.\n", 33)
		u.aguarde(500)
		escrevaLenta("Do outro, atraves do vidro embacado, voce ve pequenas plantas crescendo em gel nutritivo.\n", 33)
		u.aguarde(500)
		escrevaLenta("Tomates espaciais geneticamente modificados brilham sob uma luz ultravioleta.\n", 33)
		u.aguarde(500)
		escreva("---------------------------------------------------------------------------------------------------\n")
		escreva("[I] para investigar Pasta Nutritiva Sabor Alface\n")
		escreva("[E] para examinar a estufa de Tomates\n")
		escreva("[Q] para retornar\n")
		escreva("Escolha: ")


		leia(andar_teclas)
		limpa()


		se (andar_teclas == 'I' ou andar_teclas == 'i')
		{
			escreva("----------------------------------------------------------------------------------------\n")
			escrevaLenta("Voce pega um pacote de Pasta Nutritiva. A embalagem esta fria.\n", 33)
			escrevaLenta("O rotulo diz: 'Nutricao 100% sintetica. Sabor Alface de Jupiter'.\n", 33)
			escrevaLenta("Lembrar que o chefe Jacquin nao pode vir saborear isso te da um aperto no peito.\n", 33)
			u.aguarde(500)
			escreva("----------------------------------------------------------------------------------------\n")
			escreva("Voce deseja adicionar ao inventario?\n")
			escreva("[S] sim ou [N] nao?\n")
			escreva("Escolha: ")


			leia(andar_teclas)
			limpa()


			escolha(andar_teclas)
			{
				caso 'S':
				caso 's':
					escrevaLenta("Para comer, pressione [V]\n", 33)
					AdicionarItem("Pasta Nutritiva")
					escreva("\nPressione ENTER para continuar...")
					AguardarEnter()
					pare
				caso 'N':
				caso 'n':
					escrevaAguarde("Voce nao pegou o item.\n", 1000)
					pare
			}


		}
		senao se (andar_teclas == 'E' ou andar_teclas == 'e')
		{
			escrevaLenta("Voce limpa o embacado do vidro com a manga do traje.\n", 33)
			escrevaLenta("Os tomates parecem quase vivos sob a luz UV pulsante.\n", 33)
			escrevaLenta("O painel hidroponico indica: 'Pronto para colheita'.\n", 33)
			u.aguarde(500)
			escreva("----------------------------------------------------------------------------------------\n")
			escreva("Voce deseja colher um tomate e adicionar ao inventario?\n")
			escreva("[S] sim ou [N] nao?\n")
			escreva("Escolha: ")

			leia(andar_teclas)
			limpa()

			escolha(andar_teclas)
			{
				caso 'S':
				caso 's':
					escrevaLenta("Para comer, pressione [V]\n", 33)
					AdicionarItem("Tomate")
					escreva("\nPressione ENTER para continuar...")
					AguardarEnter()
					pare
				caso 'N':
				caso 'n':
					escrevaAguarde("Voce nao pegou o item.\n", 1000)
					pare
			}
		}
		senao se (andar_teclas == 'Q' ou andar_teclas == 'q')
		{
			escrevaAguarde("Voce decide apenas observar e manter os suprimentos intactos por enquanto.\n", 1500)
		}
		senao
		{
			escrevaAguarde("Comando invalido!\n", 1200)
		}
	}


	funcao salaQuarentena()
	{
		pista_redoma = verdadeiro

		escrevaAguarde("==============================================================================\n", 500)
		escrevaAguarde("                            [ZONA DE BIO-QUARENTENA]                          \n", 500)
		escrevaAguarde("==============================================================================\n", 500)
		escrevaLenta("           As grossas portas de blindagem dupla se fecham pesadamente\n", 33)
		escrevaLenta("            atras de voce com um estrondo metalico ecoante. O ar aqui\n", 33)
		escrevaLenta("            dentro eh frio, denso e tem um forte gosto metalico.\n", 33)
		escrevaLenta("---------------------------------------------------------------------------------\n", 33)
		escrevaLenta("             Luzes de emergencia amarelas giram lentamente no teto,\n", 33)
		escrevaLenta("           projetando sombras longas nas paredes de policarbonato reforcado.\n", 33)
		escrevaLenta("             O chao esta coberto por marcas de arranhoes profundos e pocas\n", 33)
		escrevaLenta("            secas de um fluido quimico amarelado.\n", 33)
		escrevaLenta("---------------------------------------------------------------------------------\n", 33)
		escrevaLenta("            Ao centro, uma redoma de vidro blindado esta estilhacada de\n", 33)
		escrevaLenta("          dentro para fora. Paineis digitais piscam freneticamente em\n", 33)
		escrevaLenta("             vermelho com a mensagem: 'RISCO BIOLOGICO: NIVEL 5'.\n", 33)
		escrevaAguarde("==============================================================================\n", 500)
		escreva("[E] para explorar\n")
		escreva("[Q] para retornar\n")
		escreva("Escolha: ")
		leia(andar_teclas)
		limpa()
		escolha(andar_teclas)
		{
			caso 'E':
			caso 'e':
				explorarQuarentena()
				pare
			caso 'Q':
			caso 'q':
				pare
		}
	}


	funcao explorarQuarentena()
	{
		andar_alien = falso

		escreva("--------------------------------------------------------------------------------------\n")
		escrevaLenta("Voce comeca a andar por esse lugar e seu corpo eh invadido por um mal-estar,\n", 33)
		escrevaLenta("um som semelhante a estatica toma seus ouvidos e entao voce ouve um rosnado...\n", 33)
		u.aguarde(1000)
		escrevaLenta("Voce percebe que isso vem das suas costas e entao voce se vira rapidamente e\n", 33)
		escrevaLenta("seus olhos encontram um homem muito muito magro em um nivel que uma pessoa comum\n", 33)
		escrevaLenta("nao teria sobrevivido, esse homem rosna baixo e espuma pela boca e entao voce nota\n", 33)
		escrevaLenta("que os rosnados em alguns momentos parecem querer te dizer algo.\n\n", 33)
		escreva("Pressione ENTER para continuar: \n")
		AguardarEnter()
		limpa()
		escreva("----------------------------------------------------------------------------------------\n")
		escrevaLenta("Antes que voce possa fugir, esse homem infectado tenta te atacar!\n", 33)
		escreva("[I] para desviar\n")
		escreva("[Q] para ficar\n")
		escreva("Escolha: ")

		leia(andar_teclas)
		limpa()


		escolha(andar_teclas)
		{
			caso 'I':
			caso 'i':
				sorteio = u.sorteia(1, 3)
				escolha(sorteio)
				{
					caso 1:
						escreva("[SUCESSO] Voce desvia e consegue sair da sala vivo.\n\n")
						escrevaLenta("Mas, durante o desvio, o infectado roca em voce. Um contato breve, mas o bastante.\n", 33)
						escrevaLenta("O virus que ja incubava dentro do seu corpo reage e termina de amadurecer!\n", 33)
						escrevaLenta("Sua cabeca lateja, suas maos tremem e algo dentro de voce comeca a mudar.\n", 33)
						pista_contagio = verdadeiro
						se (infectado == falso)
						{
							infectado = verdadeiro
							passos_infectado = 0
						}
						escreva("Voce tem ", PASSOS_INFECCAO, " passos antes que o virus complete o trabalho.\n\n")
						escreva("Pressione ENTER para continuar: ")
						AguardarEnter()
						pare
					caso 2:
						escreva("[AZAR] Voce tenta desviar mas tropeca e esse homem te dilacera vivo.\n")
						morteInfectado()
						pare
					caso 3:
						escreva("O Alien entrou, engoliu o infectado vivo e matou voce tambem.\n")
						morteAlienQuarentena()
						pare
				}
				pare
			caso 'Q':
			caso 'q':
				escrevaLenta("Voce fica parado e esse homem tenta formar a palavra 'desculpe' em meio aos seus rosnados de fome...\n", 33)
				escrevaLenta("Perceba que o sofrimento jamais acaba pois, aparentemente,\n", 33)
				escrevaLenta("O hospedeiro tem lapsos de consciencia enquanto infectado, independente do avanco.\n", 33)
				escreva("Entao ele nao consegue controlar e avanca em voce, te rasgando vivo.\n")
				morteInfectado()
				pare
		}
		andar_alien = verdadeiro
	}


	funcao PegChave()
	{
		// B(r,eᵃᵈ) > keʸ.

		se (TemItem("Chave de Ferro") == falso)
		{
			se (itensNoInventario >= 20)
			{
				escrevaAguarde("Inventario cheio! Libere espaco para pegar a chave.\n", 2000)
				retorne
			}
			AdicionarItem("Chave de Ferro")
			escreva("Voce pegou a chave! Faca a escolha certa (essa acao tera consequencias...)\n")
			u.aguarde(4000)
			se (sala_armamento == verdadeiro)
			{
				escreva("Se quiser voltar ate a porta, mova-se ate X:6 | Y:3\n")
				u.aguarde(2500)
			}
		}
		senao
		{
			escreva("Voce ja pegou essa chave.\n")
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
				escreva("Voce observa a sala novamente, mas nao encontra nada de novo.\n")
				u.aguarde(2600)
				pare
			caso 'S':
			caso 's':
				escreva("Voce sai da sala.\n")
				u.aguarde(1300)
				pare
			caso contrario:
				escreva("Comando invalido!\n")
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


		inteiro enrraboFeito = u.sorteia(0 , 1000)
		inteiro aposta = u.sorteia(0 , 1000)

		escreva("----------------------------------------------------------------------\n")
		u.aguarde(500)
		escreva("Voce se deita na cama, sente a tensao dos seus musculos se esvairem...\n")
		u.aguarde(500)
		escreva("Ha quanto tempo voce nao descansava?..\n")
		u.aguarde(500)
		escreva("O edredom te envolve como um abraco quente e macio \n")
		u.aguarde(500)
		escreva("que te lembra fortemente o quao solitario voce eh na sua especie.\n")
		u.aguarde(500)
		escreva("Entao, voce deixa o sono e o cansaco te tomarem e voce adormece profundamente.\n")
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
			escreva("estracalha")
		}

		escreva(" voce ate a morte.")

		se (enrraboFeito == aposta)
		{
			escreva("         (FINAL RARO! PABENS)")
		}

		u.aguarde(2000)
		escreva("\n========================================\n")
		escreva("         SONO FATAL, FIM DE JOGO        \n")
		escreva(" =========================================")
		FinalRevelacao()
		Morrido()
	}


	funcao morteInfectado()
	{
		escreva("\n====================================\n")
		escreva("      VOCE MORREU PARA O INFECTADO      \n")
		escreva(" =====================================  ")
		FinalRevelacao()
		Morrido()
	}


	funcao morteAlienQuarentena()
	{
		escreva("\n==================================\n")
		escreva("     VOCES MORRERAM PARA O ALIEN    \n")
		escreva(" ===================================  ")
		FinalRevelacao()
		Morrido()
	}
	funcao inteiro ContarPistas()
	{
		inteiro total = 0

		se (pista_intruso)
		{
			total++
		}
		se (pista_laudo)
		{
			total++
		}
		se (pista_redoma)
		{
			total++
		}
		se (pista_contagio)
		{
			total++
		}

		retorne total
	}


	funcao FinalRevelacao()
	{
		se (ContarPistas() < PISTAS_PARA_REVELACAO)
		{
			retorne
		}

		escreva("\n\nPressione ENTER para continuar...")
		AguardarEnter()
		limpa()

		escrevaLenta("No instante final, tudo o que voce viu comeca a se encaixar...\n\n", 40)
		u.aguarde(1500)

		se (pista_intruso)
		{
			escrevaLenta("'ALERTA DE SEGURANCA: Intruso detectado a bordo da nave. Especie nao identificada.'\n", 33)
			u.aguarde(1000)
			escrevaLenta("A nave nunca falou do alien. Seus sensores acharam algo que nao sabiam nomear em quem tinha acabado de acordar.\n\n", 33)
			u.aguarde(1500)
		}
		se (pista_laudo)
		{
			escrevaLenta("Laudo da Dra. Aris Thorne: 'A paranoia eh contagiosa?'  'Nao ha febre, nao ha lesao.'\n", 33)
			u.aguarde(1000)
			escrevaLenta("Ela foi a primeira a adoecer. Os exames nunca acharam o virus, nem em voce:\n", 33)
			escrevaLenta("por isso voce foi congelado como sobrevivente, e nao trancado como paciente.\n\n", 33)
			u.aguarde(1500)
		}
		se (pista_redoma)
		{
			escrevaLenta("A redoma de vidro blindado, estilhacada de dentro para fora.\n", 33)
			u.aguarde(1000)
			escrevaLenta("Nao havia monstro preso la dentro. Era a tripulacao que voce contaminou sem saber.\n\n", 33)
			u.aguarde(1500)
		}
		se (pista_contagio)
		{
			escrevaLenta("O infectado tentava dizer 'desculpe'. Nos lapsos de lucidez, ele te reconheceu: um colega de bordo.\n", 33)
			u.aguarde(1000)
			escrevaLenta("O virus que dormia em voce, preso pela criogenia, terminou de incubar ao toque dele.\n\n", 33)
			u.aguarde(1500)
		}

		escrevaLenta("O 'ultimo eco humano' que o radar captou era o seu proprio pulso, ecoando pela nave.\n", 33)
		u.aguarde(1000)
		escrevaLenta("O alien tambem o seguia. E cada sala por onde voce passou levou um pouco do virus junto.\n\n", 33)
		u.aguarde(2000)
		escrevaLenta("Voce nao era a sobrevivente. Voce era o motivo de nao haver sobreviventes.\n\n", 50)
		u.aguarde(2500)

		escreva("====================================\n")
		escreva("   FINAL VERDADEIRO: O PORTADOR   \n")
		escreva(" =====================================  ")
	}


	funcao cadeia SintomaInfeccao()
	{
		se (passos_infectado < 3)
		{
			retorne "Sintoma: dor de cabeca e maos tremulas. Algo se mexe sob a sua pele."
		}
		se (passos_infectado < 6)
		{
			retorne "Sintoma: paranoia. Voce jura que ha alguem te seguindo nas sombras."
		}
		se (passos_infectado < 9)
		{
			retorne "Sintoma: agressividade. Seus punhos fecham sozinhos e voce quer destruir tudo."
		}
		retorne "Sintoma: raiva e delirio. Voce ja nao reconhece mais nada ao redor."
	}


	funcao ContarPassoInfeccao()
	{
		passos_infectado++

		se (passos_infectado >= PASSOS_INFECCAO)
		{
			MorteInfeccao()
		}
	}


	funcao MorteInfeccao()
	{
		limpa()
		escrevaLenta("A paranoia e a raiva tomam conta de voce por completo. Nada ao redor parece real...\n", 33)
		escrevaLenta("O virus terminou de amadurecer e seu corpo, sem forcas, desaba no chao.\n", 33)
		escreva("\n====================================\n")
		escreva("   O VIRUS TERMINOU DE INCUBAR EM VOCE   \n")
		escreva(" =====================================  ")
		FinalRevelacao()
		Morrido()
	}


	funcao SortearPosicoes()
	{
		inteiro nova_x
		inteiro nova_y
		logico posicao_valida = falso

		alien_congelado = 0

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

			se (PosicaoSalaEspecial(nova_x, nova_y) == falso e (nova_x - jogador_x) * (nova_x - jogador_x) + (nova_y - jogador_y) * (nova_y - jogador_y) > 100)
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
		senao se (x == 8.0 e y == 1.0)
		{
			retorne verdadeiro
		}
		senao se (x == -10.0 e y == -5.0)
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


	funcao Morrido()
	{
		escreva("\n\n")
		enquanto (verdadeiro)
		{
			u.aguarde(999999)
		}
	}
}
