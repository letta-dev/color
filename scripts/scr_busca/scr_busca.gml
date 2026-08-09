// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_busca(_board)
{
    //---------------------------------
    // EXISTE?
    //---------------------------------

    if (_board == noone)
    {
        return;
    }

    //---------------------------------
    // JÁ FOI VISITADO?
    //---------------------------------

    if (_board.visitado)
    {
        return;
    }

    //---------------------------------
    // ESTÁ OCUPADO?
    //---------------------------------

    if (!_board.ocupado)
    {
        return;
    }

    //---------------------------------
    // POSSUI TILE?
    //---------------------------------

    if (!instance_exists(_board.tile))
    {
        return;
    }

    //---------------------------------
    // MESMO NÍVEL?
    //---------------------------------

    if (_board.tile.nivel != nivel_busca)
    {
        return;
    }

    //---------------------------------
    // ADICIONA À CADEIA
    //---------------------------------

    _board.visitado = true;

    array_push(cadeia, _board);
	show_debug_message(
    "Adicionado: L=" +
    string(_board.linha) +
    " C=" +
    string(_board.coluna)
);

    //---------------------------------
    // VISITA OS VIZINHOS
    //---------------------------------

    scr_busca(_board.vizinho_esquerda);
    scr_busca(_board.vizinho_direita);

    scr_busca(_board.vizinho_superior_esquerda);
    scr_busca(_board.vizinho_superior_direita);

    scr_busca(_board.vizinho_inferior_esquerda);
    scr_busca(_board.vizinho_inferior_direita);
}