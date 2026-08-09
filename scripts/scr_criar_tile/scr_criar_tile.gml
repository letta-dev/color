// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_criar_tile(_board, _cor, _nivel)
{
    //----------------------------------
    // CRIA O TILE
    //----------------------------------

    var novo_tile = instance_create_layer(
        _board.x,
        _board.y,
        "tiles_fixos",
        obj_tile
    );
	show_debug_message("CRIANDO TILE");
	show_debug_message("ID: " + string(novo_tile));
	show_debug_message("Board: " + string(_board));

    //----------------------------------
    // CONFIGURA O TILE
    //----------------------------------

    novo_tile.tipo = obj_controle.TIPO_TILE;
    novo_tile.cor = _cor;
    novo_tile.nivel = _nivel;

    novo_tile.estado = "final";

    novo_tile.board_destino = _board;

    novo_tile.ordem = obj_controle.proxima_ordem;
    obj_controle.proxima_ordem++;

    //----------------------------------
    // SPRITE
    //----------------------------------

    novo_tile.image_index = _cor;

    //----------------------------------
    // ATUALIZA O BOARD
    //----------------------------------

    _board.ocupado = true;
    _board.tile = novo_tile;

    //----------------------------------
    // RETORNA O TILE CRIADO
    //----------------------------------
	if (global.sfx) audio_play_sound(snd_combo,9,false)
	show_debug_message("Board ocupado: " + string(_board.ocupado));
	show_debug_message("Board tile: " + string(_board.tile));
    return novo_tile;
}