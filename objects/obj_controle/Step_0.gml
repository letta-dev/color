/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!instance_exists(tile_ativo))
{
    //----------------------------------
    // NOVA JOGADA
    //----------------------------------

    boards_alterados = [];

    randomize();

    tile_ativo = instance_create_layer(mouse_x, mouse_y, "tiles_moveis", obj_tile);

    tile_ativo.tipo = proximo_tipo;
    tile_ativo.cor = proxima_cor;
    tile_ativo.nivel = proximo_nivel;
    tile_ativo.image_index = proximo_frame;
    tile_ativo.ordem = proxima_ordem;

    proxima_ordem++;

    //---------------------------------
    // SORTEIA A PRÓXIMA PEÇA
    //---------------------------------

    if (turno <= 5)
    {
        proximo_tipo  = TIPO_TILE;
        proxima_cor   = irandom_range(0,2);
        proximo_nivel = NIVEL_PRIMARIO;
        proximo_frame = proxima_cor;

        turno++;
    }
    else
    {
        var sorteio = irandom_range(0,99);

        if (sorteio < 90)
        {
            proximo_tipo  = TIPO_TILE;
            proxima_cor   = irandom_range(0,2);
            proximo_nivel = NIVEL_PRIMARIO;
            proximo_frame = proxima_cor;
        }
        else
        {
            proximo_tipo  = TIPO_MOVER;
            proxima_cor   = -1;
            proximo_nivel = -1;
            proximo_frame = 9;
        }
    }
}

//------------------------------------------
// CLIQUE DO MOUSE
//------------------------------------------

if (mouse_check_button_pressed(mb_left))
{
    if (instance_exists(tile_ativo))
    {
        if (tile_ativo.estado == "movel")
        {
            tile_ativo.estado = "prepara";
        }
    }
}

//------------------------------------------
// SOLTOU O MOUSE
//------------------------------------------

if (mouse_check_button_released(mb_left))
{
	if (global.sfx) audio_play_sound(snd_add_tile,9,false)
    if (instance_exists(tile_ativo))
    {
        if (tile_ativo.estado == "prepara")
        {
            if (tile_ativo.board_destino != noone)
            {
                //----------------------------------
                // TILE NORMAL
                //----------------------------------

                if (tile_ativo.tipo == TIPO_TILE)
                {
                    tile_ativo.layer = layer_get_id("tiles_fixos");
                    tile_ativo.estado = "final";

                    obj_debug.tile_total++;

                    tile_ativo.board_destino.ocupado = true;
                    tile_ativo.board_destino.tile = tile_ativo;

                    //----------------------------------
                    // GUARDA O BOARD ALTERADO
                    //----------------------------------

                    array_push(boards_alterados, tile_ativo.board_destino);

                    //----------------------------------
                    // RESOLVE O TABULEIRO
                    //----------------------------------

                    scr_resolver_tabuleiro();

                    //----------------------------------
                    // VERIFICA SE EXISTE ESPAÇO LIVRE
                    //----------------------------------

                    var possui_espaco = false;

                    with (obj_board)
                    {
                        if (!ocupado)
                        {
                            possui_espaco = true;
                            break;
                        }
                    }

                    if (!possui_espaco)
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

                    tile_ativo = noone;
                }

                //----------------------------------
                // MOVER
                //----------------------------------

                else
                {
                    scr_usar_mover(tile_ativo.board_destino);
                }
            }
            else
            {
                tile_ativo.estado = "movel";
            }
        }
    }
}










