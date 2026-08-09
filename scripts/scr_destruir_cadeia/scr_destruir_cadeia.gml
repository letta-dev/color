// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_destruir_cadeia()
{
    if (array_length(cadeia) == 0)
    {
        return;
    }

    for (var i = 0; i < array_length(cadeia); i++)
    {
        var board = cadeia[i];

        if (board == noone)
            continue;

        if (board.tile != noone)
        {
            instance_destroy(board.tile);
        }

        board.tile = noone;
        board.ocupado = false;
    }
}