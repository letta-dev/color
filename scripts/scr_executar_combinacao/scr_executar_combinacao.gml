// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function scr_executar_combinacao()
{
    //----------------------------------
    // EXISTE COMBINAÇÃO?
    //----------------------------------

    if (board_resultado == noone)
    {
        return noone;
    }

    //----------------------------------
    // GUARDA O BOARD RESULTADO
    //----------------------------------

    var destino = board_resultado;


	//**********
	//CALCULAR PONTUAÇÃO
	//*************
	
	scr_calcular_pontuacao();
	
	
    //----------------------------------
    // REMOVE A CADEIA
    //----------------------------------

    scr_destruir_cadeia();

    //----------------------------------
    // CRIA O NOVO TILE
    //----------------------------------

    var novo_tile = scr_criar_tile(
        destino,
        cor_novo_tile,
        nivel_novo_tile
    );

    //----------------------------------
    // DEVOLVE O TILE CRIADO
    //----------------------------------

    return novo_tile;
}
/*
function scr_executar_combinacao()
{
	show_debug_message("=== EXECUTAR COMBINACAO ===");
	show_debug_message("board_resultado = " + string(board_resultado));
	show_debug_message("cor_novo_tile = " + string(cor_novo_tile));
	show_debug_message("nivel_novo_tile = " + string(nivel_novo_tile));
    //----------------------------------
    // EXISTE COMBINAÇÃO?
    //----------------------------------

    if (board_resultado == noone)
    {
        return;
    }

    //----------------------------------
    // REMOVE TODOS OS TILES DA CADEIA
    //----------------------------------

    scr_destruir_cadeia();

    //----------------------------------
    // CRIA O TILE RESULTANTE
    //----------------------------------
	var novo_tile = scr_criar_tile(
	    board_resultado,
	    cor_novo_tile,
	    nivel_novo_tile
	);

	return novo_tile;
    //scr_criar_tile(
    //    board_resultado,
    //    cor_novo_tile,
    //    nivel_novo_tile
    //);
}