/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor




	// Exemplo para finalizar
if (botao_tipo == "finaliza") 
	{
	    scr_calcular_pontuacao_final();
		scr_calcular_composicao();

		obj_menus.pontuacao_jogo = obj_controle.pontuacao;

		obj_menus.multiplicador_pureza = obj_controle.multiplicador;

		obj_menus.pontuacao_final = obj_controle.pontuacao_final;

		for (var i = 0; i < 9; i++)
		{
		    obj_menus.porcentagem_cores[i] = obj_controle.porcentagem_cores[i];
		}


		obj_menus.porcentagem_vazios = obj_controle.porcentagem_vazios;


		room_goto(rm_resultado);
}




