// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_atualizar_preview()
{
    //----------------------------------
    // LIMPA O PREVIEW ANTERIOR
    //----------------------------------

    with (obj_tile)
    {
        preview = false;
    }

    //----------------------------------
    // NÃO EXISTE CADEIA
    //----------------------------------

    if (array_length(cadeia) == 0)
    {
        return;
    }

    //----------------------------------
    // EXISTE COMBINAÇÃO?
    //----------------------------------

    switch (resultado_combinacao)
    {
        case obj_controle.COMBINACAO_EMPATE_PRIMEIRO:
        //case obj_controle.COMBINACAO_PRIMEIRO_SEGUNDO:
        //case obj_controle.COMBINACAO_MONOCROMATICA:

            for (var i = 0; i < array_length(cadeia); i++)
            {
                var board = cadeia[i];

                if (board.tile != noone)
                {
                    board.tile.preview = true;
                }
            }

        break;
    }
}