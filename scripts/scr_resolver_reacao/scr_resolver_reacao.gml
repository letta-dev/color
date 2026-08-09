// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function scr_resolver_reacao(_board_inicial)
{
    //----------------------------------
    // VALIDAÇÃO
    //----------------------------------

    if (_board_inicial == noone)
        return;

    if (!_board_inicial.ocupado)
        return;

    //----------------------------------
    // COMEÇA A REAÇÃO
    //----------------------------------

    var board_atual = _board_inicial;
    var continuar = true;

    while (continuar)
    {
        //----------------------------------
        // BUSCA A CADEIA
        //----------------------------------

        scr_buscar_cadeia(board_atual);

        //----------------------------------
        // ANALISA A COMBINAÇÃO
        //----------------------------------

        scr_verificar_combinacao();

        //----------------------------------
        // DECIDE O QUE FAZER
        //----------------------------------

        switch (resultado_combinacao)
        {
            //----------------------------------
            // COMBINAÇÕES VÁLIDAS
            //----------------------------------

            case COMBINACAO_EMPATE_PRIMEIRO:

                scr_escolher_board_resultado();
                scr_escolher_cor_resultado();
				
                var novo_tile = scr_executar_combinacao();
				obj_controle.combo ++;

                //----------------------------------
                // CONTINUA A REAÇÃO
                //----------------------------------

                if (novo_tile != noone)
                {
                    board_atual = novo_tile.board_destino;
                }
                else
                {
                    continuar = false;
                }

            break;

            //----------------------------------
            // SEM COMBINAÇÃO
            //----------------------------------

            default:

                continuar = false;

            break;
        }
    }
	//----------------------------------
	// FIM DA REAÇÃO
	//----------------------------------

	obj_controle.combo = 0;
}



/*
function scr_resolver_reacao(_board_inicial)
{
    var board_atual = _board_inicial;
    var continuar = true;

    while (continuar)
    {
        //----------------------------------
        // BUSCA A CADEIA
        //----------------------------------

        scr_buscar_cadeia(board_atual);

        //----------------------------------
        // ANALISA A COMBINAÇÃO
        //----------------------------------

        scr_verificar_combinacao();

        //----------------------------------
        // DECIDE O QUE FAZER
        //----------------------------------

        switch (resultado_combinacao)
        {
            //----------------------------------
            // COMBINAÇÕES VÁLIDAS
            //----------------------------------

            case COMBINACAO_EMPATE_PRIMEIRO:

                scr_escolher_board_resultado();
                scr_escolher_cor_resultado();

                var novo_tile = scr_executar_combinacao();

                board_atual = novo_tile.board_destino;

            break;

            //----------------------------------
            // TODAS AS OUTRAS
            //----------------------------------

            default:

                continuar = false;

            break;
        }
    }
}