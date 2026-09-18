programa 
{
	
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat

     	inteiro sanidade = 100
	
		real jogador_x = 0
    		real jogador_y = 0

     	real alien_x = 20
     	real alien_y = 20


        inteiro opcao // Escolhas do player
        caracter andar
        caracter andar_teclas
        logico menu_ativo = verdadeiro
        logico item = falso 
        logico sala_armamento = falso
        logico chave_armamento = falso
        logico chave_dispensa = falso

   

        // ===================== INVENTÁRIO =====================
        cadeia inventario[20]
        inteiro itensNoInventario = 0
        // ========================================================

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
                        u.aguarde(600)
                        escreva(".")
                        u.aguarde(600)


                        para(inteiro g=0; g < 3; g++)
                        {
                                u.aguarde(200)
                                escreva(".")
                                u.aguarde(200)

                        }
                }

                cadeia passar

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
                leia(passar)
                loop()
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
                        cadeia comecar_jogo
                        limpa()

                        // Menu
                         escreva("______        __  __     __         ______   __     __    __     ______        ______     ______     ______    \n")
					escreva("/\\  __ \\      /\\ \\/\\ \\   /\\ \\       /\\__  _\\ /\\ \\   /\\ \"-./  \\   /\\  __ \\      /\\  ___\\   /\\  ___\\   /\\  __ \\   \n")
					escreva("\\ \\ \\/\\ \\     \\ \\ \\_\\ \\  \\ \\ \\____  \\/_/\\ \\/ \\ \\ \\  \\ \\ \\-./\\ \\  \\ \\ \\/\\ \\     \\ \\  __\\   \\ \\ \\____  \\ \\ \\/\\ \\  \n")
					escreva(" \\ \\_____\\     \\ \\_____\\  \\ \\_____\\    \\ \\_\\  \\ \\_\\  \\ \\_\\ \\ \\_\\  \\ \\_____\\     \\ \\_____\\  \\ \\_____\\  \\ \\_____\\ \n")
					escreva("  \\/_____/      \\/_____/   \\/_____/     \\/_/   \\/_/   \\/_/  \\/_/   \\/_____/      \\/_____/   \\/_____/   \\/_____/ \n")
					escreva("\n")
					escreva("\n                                          PRESSIONE ENTER PARA COMEÇAR: ")

					leia(comecar_jogo)
					limpa()
                         escreva("\n")
					escreva("===============================================================\n")
					escreva("                    SISTEMA DE CONTROLE                       \n")
					escreva("===============================================================\n")
					escreva("|                                                             |\n")
					escreva("|  [1] INICIAR PROTOCOLO DE BUSCA                             |\n")
					escreva("|      > Jogar                          |                     |\n")
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
					escreva("  CODIGO DE ACESSO: ")

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
      funcao Executarjogo(  )
        {
        	escreva("\nVocê está na sala principal de criogenia, seja lá o que está a bordo, está procurando você...\n")
        	loop()
        }
	        //=========S A N I D A D E===========
      funcao loop()
    {
        caracter tecla_movimento

        enquanto(sanidade > 0)
        {
        	limpa()
            // O computador calcula a distância e atualiza sua sanidade
            calcular_sanidade()

            // Se a sanidade zerou no cálculo, interrompe o jogo 
            
            se (sanidade <= 0)
            {
                pare
            }
            
            escreva("==================================================\n")
            escreva(" SANIDADE: ", sanidade, "/100\n")
            escreva(" Posição do jogador: X:", jogador_x, " | Y:", jogador_y, "\n")
            escreva(" Posição do alien:   X:", alien_x, " | Y:", alien_y, "\n")
            escreva("==================================================\n")
            
            // Ele fica travado esperando você escolher para onde ir
            escreva("Use W(subir), A(esquerda), S(descer), D(direita) para andar: ")
            leia(tecla_movimento)

            // Processa o SEU movimento baseado na tecla apertada
            escolha(tecla_movimento)
            {
                caso 'W':
                caso 'w':
                    jogador_y++
                    pare

                caso 'A':
                caso 'a':
                    jogador_x--
                    pare

                caso 'S':
                caso 's':
                    jogador_y--
                    pare

                caso 'D':
                caso 'd':
                    jogador_x++
                	pare
   
            	caso 'F':
			caso 'f':
			 MostrarInventario()
					 
            
            }

            // Ele só dá o passo DEPOIS que você se moveu!
            // Ele compara a posição X dele com a sua
            se (alien_x < jogador_x) { 
                alien_x = alien_x + 0.5 
            }
            senao se (alien_x > jogador_x) { 
                alien_x = alien_x - 0.5 
            }

            // Ele compara a posição Y dele com a sua
            se (alien_y < jogador_y) { 
                alien_y = alien_y + 0.5
            }
            senao se (alien_y > jogador_y) { 
                alien_y = alien_y - 0.5 
            }
        }

        // Se sair do loop porque a sanidade chegou a 0, exibe o fim de jogo
        limpa()
        escreva("\n")
        escreva("====================================\n")
        escreva("           COLAPSO MENTAL           \n")
        escreva("====================================\n")
        escreva("O Alien encurralou você no silêncio do espaço.\n")

	   aguardarEnter()
    }

        funcao calcular_sanidade()
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
            escreva("\n!!! O ALIEN ESTA MUITO PERTO !!!\n")
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

        funcao aguardarEnter()
        {
	        cadeia pausa
	        leia(pausa)
        }

        // ===================== FUNÇÕES DE INVENTÁRIO =====================

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
                para(inteiro i = indice; i < itensNoInventario - 1; i++)
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

        funcao MostrarInventario()
        {
                inteiro opcaoInventario
                
                        limpa()
                        escreva("=================================\n")
                        escreva("            INVENTÁRIO           \n")
                        escreva("=================================\n")
                        escreva("Espaços livres: ", (20 - itensNoInventario), " / 20\n\n")

                        se (itensNoInventario == 0)
                        {
                                escreva("O inventário está vazio.\n\n")
                        }
                        senao
                        {
                                para(inteiro i = 0; i < itensNoInventario; i++)
                                {
                                        escreva(i + 1, " - ", inventario[i], "\n")
                                }
                                escreva("\n")
                        }

                        escreva("=================================\n")
                        escreva("[1] Trocar item de posição\n")
                        escreva("[2] Usar item\n")
                        escreva("[3] Retirar item\n")
                        escreva("[0] Voltar ao jogo\n")
                        escreva("Escolha: ")
                        leia(opcaoInventario)

                        escolha(opcaoInventario)
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
                
        }

        // ====================================================================

        funcao Move()
        //verificar eventos()
        {
        logico Simsalabim = verdadeiro
        enquanto(Simsalabim == verdadeiro)
        {

        se(jogador_x == 6 e jogador_y == 3)
        {

                limpa()

                        escreva("Você entrou em uma sala com algumas pilhas de folhas nas mesas,\n a iluminação do ambiente falha levemente. O local tem cheiro de coisas antigas, nas paredes há alguns quadros\n")
                        escreva("Voce nota uma porta no fim desta sala, o que voce fará?\n")

                        sala_armamento = verdadeiro

				    escreva("===============================\n")
                        escreva("|[1] para abrir a porta       |\n")
                        escreva("|[2] para olhar as folhas     |\n")
                        escreva("|[3] para olhar os quadros    |\n")
                        escreva("===============================\n")
                        escreva("Escolha: ")

                        leia(andar_teclas)
                        limpa()

                        escolha(andar_teclas)
                        {
                                caso '1':
					                para(inteiro i = 0; i < 20; i++)
					                {
					                	se(inventario[i] == "Chave de Ferro")
					                	{
					                		escreva("Parabens! voce desbloqueou a sala de armamentos!\n")
					                		escreva("[E] para explorar a sala\n")
					                		escreva("[Q] para RETORNAR\n")
										leia(andar_teclas)
										
					                		escolha(andar_teclas)
					                		{
					                			caso'E':
					                			caso'e':
					                				escreva("A porta pesada se abre com um silvo hidráulico, revelando a Sala de Armamentos.\n")
					                				escreva("Diante de você, um painel iluminado exibe fileiras de equipamentos avançados.\n")
					                				escreva("O brilho neon reflete na superfície polida de lasers de energia direcionada e pistolas giroscópicas.\n")
					                				escreva("Ao lado, descansam armas magnéticas de pulso, lançadores de agulha Flechette e imponentes armas de micro-ondas.\n")
					                				escreva("O arsenal está à sua disposição, use com sabedoria.")

					                				escreva("[1] para entender o funcionamento das armas\n")
					                				escreva("[Q] para retornar")
					                				leia(andar_teclas)

					                				escolha(andar_teclas)
					                				{
					                					caso'1':
					                						escreva("1 - [               LASERS DE ENERGIA DIRECIONADA                ] \n")
					                						escreva("-------------------------------------------------------------------\n")
					                						escreva("Descrição: Emite feixes de luz concentrada de alta intensidade.\n")
					                						escreva("Utilidade: Ideal para cegar sensores de satélites ou derreter\n")
					                						escreva("estruturas espaciais como uma nave.\n")
					                						escreva("2 - [                    PISTOLAS GIROSCOPICAS                   ] \n")
					                						escreva("-------------------------------------------------------------------\n")
					                						escreva("Descrição: Dispara mini-foguetes que aceleram apos sairem do cano\n")
					                						escreva("Vantagem: Recuo zero (ideal para gravidade zero) e projétil ganha velocidade no vácuo.\n\n")
					                						escreva("3 - [                 ARMAS MAGNÉTICAS DE PULSO                  ]\n")
					                						escreva("-------------------------------------------------------------------")
					                						escreva("Descrição: Bobinas eletromagnéticas que aceleram um dardo metálico envenenado.\n")
					                						escreva("Vantagem: Disparo silencioso, sem necessidade de oxigênio e sem cartuchos vazios.\n\n")
					                						escreva("4 - [               LANÇADORES DE AGULHA FLECHETTE               ]\n")
					                						escreva("--------------------------------------------------------------------")
					                						escreva("")
					                					caso'Q':
					                						escreva("")
					                						u.aguarde(2900)
					                				}
					                				
					                		}
					                	}
					                }
		
                                        escreva("A porta esta trancada, voce precisara de uma chave.\n")
                                        u.aguarde(2900)
                                        pare

                                caso 'a':
                                caso 'A':
                                        escreva("Você mexe nas folhas. São relatórios antigos cobertos de poeira e sem nexo. Uma folha em especial te chama atenção\n")
                                        u.aguarde(3200)
                                        escreva("[w]")
                                        pare

                                caso 's':
                                caso 'S':
                                        escreva("Os quadros mostram retratos de pessoas antigas que parecem te encarar.\n")
								u.aguarde(3000)
                                        pare

                                caso contrario:
                                escreva("Comando inválido!\n")
                                       retorne
                        }
                }senao se (jogador_x == 4 e jogador_y == 7)
        {

                limpa()
                escreva("Voce entra numa sala escura e esbarra numa mesa, em cima desta mesa tem uma chave de ferro um pouco desgastada...o que voce fara?\n")
                escreva("[w] para pegar a chave\n")
                escreva("[a] para explorar a sala novamente\n")
                escreva("[s] para sair da sala\n")
                escreva("Escolha: ")

                leia(andar_teclas)

			escolha(andar_teclas)
			{
			
			caso 'W':
			caso 'w':
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
			retorne
			}
        }
		
				}
			}
	}
