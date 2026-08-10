// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_buscar_cadeia(_board_inicial)
{
	//show_debug_message("=== BUSCA INICIADA ===");
    // limpa a cadeia anterior
    cadeia = [];

    // guarda o nível procurado
    nivel_busca = _board_inicial.tile.nivel;

    // inicia a busca
    scr_busca(_board_inicial);


    // libera os boards para futuras buscas
    for (var i = 0; i < array_length(cadeia); i++)
    {
        cadeia[i].visitado = false;
    }
}