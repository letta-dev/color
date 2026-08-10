// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_destruir_cadeia()
{
    if (array_length(cadeia) == 0) return;

    var delay = 0;

    for (var i = 0; i < array_length(cadeia); i++)
    {
        var board = cadeia[i];

        if (board == noone) continue;

        if (board.tile != noone)
        {
            // agenda a destruição com delay
            alarm[0] = delay; // supondo que board.tile tenha um alarm
            with (board.tile)
            {
                destruindo = true;
            }
        }

        board.tile = noone;
        board.ocupado = false;

        delay += 5; // aumenta o atraso entre cada tile (5 steps)
    }
}

