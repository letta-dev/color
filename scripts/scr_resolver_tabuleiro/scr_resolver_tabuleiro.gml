// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_resolver_tabuleiro()
{
    for (var i = 0; i < array_length(boards_alterados); i++)
    {
        var board = boards_alterados[i];

        if (board == noone)
            continue;

        //----------------------------------
        // BOARD COM TILE
        //----------------------------------

        if (board.ocupado)
        {
            scr_resolver_reacao(board);
        }

        //----------------------------------
        // BOARD VAZIO
        //----------------------------------

        else
        {
            var vizinhos =
            [
                board.vizinho_esquerda,
                board.vizinho_direita,
                board.vizinho_superior_esquerda,
                board.vizinho_superior_direita,
                board.vizinho_inferior_esquerda,
                board.vizinho_inferior_direita
            ];

            for (var j = 0; j < 6; j++)
            {
                if (vizinhos[j] != noone)
                {
                    if (vizinhos[j].ocupado)
                    {
                        scr_resolver_reacao(vizinhos[j]);
                    }
                }
            }
        }
    }
}