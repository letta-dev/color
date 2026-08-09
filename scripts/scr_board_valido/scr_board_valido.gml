// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_board_valido(_board, _tile)
{
    if (_board == noone)
        return false;

    if (_tile.tipo == obj_controle.TIPO_TILE)
        return !_board.ocupado;

    if (_tile.tipo == obj_controle.TIPO_MOVER)
        return _board.ocupado;

    return false;
}