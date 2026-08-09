// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_escolher_board_resultado()
{
    //----------------------------------
    // SEGURANÇA
    //----------------------------------

    if (array_length(cadeia) == 0)
    {
        board_resultado = noone;
        return;
    }

    //----------------------------------
    // COMEÇA PELO PRIMEIRO BOARD
    //----------------------------------

    board_resultado = cadeia[0];

    //----------------------------------
    // MODO BORBOLETA
    // MENOR ORDEM
    //----------------------------------

    if (modo_borboleta)
    {
        for (var i = 1; i < array_length(cadeia); i++)
        {
            var board = cadeia[i];

            if (board.tile.ordem < board_resultado.tile.ordem)
            {
                board_resultado = board;
            }
        }
    }

    //----------------------------------
    // MODO NORMAL
    // MAIOR ORDEM
    //----------------------------------

    else
    {
        for (var i = 1; i < array_length(cadeia); i++)
        {
            var board = cadeia[i];

            if (board.tile.ordem > board_resultado.tile.ordem)
            {
                board_resultado = board;
            }
        }
    }
}