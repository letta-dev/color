/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Exemplo para o botão de som
if (botao_tipo == "sfx") {
	    if (sfx == 1) {
	        global.sfx = true
	        sfx = 2;
	    } else {
	        global.sfx = false
	        sfx = 1;
	    }
	}

	// Exemplo para o botão de música
	if (botao_tipo == "music") {
	    if (music == 1) {
	        global.musica = true
	        music = 2;
	    } else {
	        global.musica = false
	        music = 1;
	    }
	}

	// Exemplo para finalizar
if (botao_tipo == "finaliza") 
	{
	    scr_calcular_pontuacao_final();
		scr_calcular_composicao();


		//----------------------------------
		// TRANSFERE RESULTADO PARA O MENU
		//----------------------------------

		// Pontuação
		obj_menus.pontuacao_jogo =
		    obj_controle.pontuacao;

		obj_menus.multiplicador_pureza =
		    obj_controle.multiplicador;

		obj_menus.pontuacao_final =
		    obj_controle.pontuacao_final;


		//----------------------------------
		// PORCENTAGEM DAS 9 CORES
		//----------------------------------

		for (var i = 0; i < 9; i++)
		{
		    obj_menus.porcentagem_cores[i] =
		        obj_controle.porcentagem_cores[i];
		}


		//----------------------------------
		// ESPAÇOS VAZIOS
		//----------------------------------

		obj_menus.porcentagem_vazios =
		    obj_controle.porcentagem_vazios;


		//----------------------------------
		// TROCA DE ROOM
		//----------------------------------

		room_goto(rm_resultado);
}




