// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_calcular_pontuacao()
{
    //----------------------------------
    // QUANTIDADE DE TILES DA CADEIA
    //----------------------------------

    var quantidade = array_length(cadeia);

    //----------------------------------
    // NÍVEL DA CADEIA
    //----------------------------------

    var nivel = cadeia[0].tile.nivel;
	if (nivel == NIVEL_TERCIARIO)
	{
	    return;
	}

    //----------------------------------
    // PONTOS BASE
    //----------------------------------

    var pontos_base = quantidade * pontos_nivel[nivel];

    //----------------------------------
    // MULTIPLICADOR DO COMBO
    //----------------------------------

    var indice_combo = combo;

    if (indice_combo >= array_length(bonus_combo))
    {
        indice_combo = array_length(bonus_combo) - 1;
    }

    var multiplicador = bonus_combo[indice_combo];

    //----------------------------------
    // PONTUAÇÃO FINAL
    //----------------------------------

    var pontos = floor(pontos_base * multiplicador);

    //----------------------------------
    // SOMA NA PONTUAÇÃO TOTAL
    //----------------------------------

    pontuacao += pontos;

    //----------------------------------
    // DEBUG
    //----------------------------------

    show_debug_message("=== PONTUAÇÃO ===");
    show_debug_message("Tiles: " + string(quantidade));
    show_debug_message("Nivel: " + string(nivel));
    show_debug_message("Base: " + string(pontos_base));
    show_debug_message("Multiplicador: " + string(multiplicador));
    show_debug_message("Ganho: " + string(pontos));
    show_debug_message("Total: " + string(pontuacao));
}