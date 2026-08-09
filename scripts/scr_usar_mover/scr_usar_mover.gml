// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function scr_usar_mover(_board)
{
    //----------------------------------
    // O BOARD PRECISA TER UM TILE
    //----------------------------------

    if (!_board.ocupado)
    {
        return;
    }

    //----------------------------------
    // GUARDA O BOARD DE ORIGEM
    //----------------------------------

    array_push(obj_controle.boards_alterados, _board);

    //----------------------------------
    // GUARDA O TILE QUE ESTÁ NO BOARD
    //----------------------------------

    var tile_retirado = _board.tile;

    //----------------------------------
    // LIBERA O BOARD
    //----------------------------------

    _board.ocupado = false;
    _board.tile = noone;

    //----------------------------------
    // REMOVE O MOVER
    //----------------------------------

    var mover = tile_ativo;

    instance_destroy(mover);

    //----------------------------------
    // O TILE RETIRADO VOLTA PARA A MÃO
    //----------------------------------

    tile_ativo = tile_retirado;

    tile_ativo.estado = "movel";
    tile_ativo.board_destino = noone;

    tile_ativo.x = mouse_x;
    tile_ativo.y = mouse_y;
}

/*function scr_usar_mover(_board)
{
    //----------------------------------
    // O BOARD PRECISA TER UM TILE
    //----------------------------------

    if (!_board.ocupado)
    {
        return;
    }

    //----------------------------------
    // GUARDA O TILE QUE ESTÁ NO BOARD
    //----------------------------------

    var tile_retirado = _board.tile;

    //----------------------------------
    // LIBERA O BOARD
    //----------------------------------

	_board.ocupado = false;
    _board.tile = noone;

    //----------------------------------
    // REMOVE O MOVER
    //----------------------------------

    var mover = tile_ativo;

    instance_destroy(mover);

    //----------------------------------
    // O TILE RETIRADO VOLTA PARA A MÃO
    //----------------------------------

    tile_ativo = tile_retirado;

    tile_ativo.estado = "movel";
    tile_ativo.board_destino = noone;

    tile_ativo.x = mouse_x;
    tile_ativo.y = mouse_y;
}