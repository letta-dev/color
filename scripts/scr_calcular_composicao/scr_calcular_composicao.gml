// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_calcular_composicao()
{
    //----------------------------------
    // TOTAL DE POSIÇÕES DO TABULEIRO
    //----------------------------------

    var total_posicoes =
        obj_controle.board_colunas * obj_controle.board_linhas;


    //----------------------------------
    // ZERA A CONTAGEM DAS CORES
    //----------------------------------

    for (var i = 0; i < 9; i++)
    {
        obj_controle.debug_contagem_cores[i] = 0;
    }


    //----------------------------------
    // CONTA OS TILES DE CADA COR
    //----------------------------------

    with (obj_tile)
    {
        if (cor >= 0 && cor < 9)
        {
            obj_controle.debug_contagem_cores[cor]++;
        }
    }


    //----------------------------------
    // CALCULA A QUANTIDADE DE TILES
    //----------------------------------

    var total_ocupados = 0;

    for (var i = 0; i < 9; i++)
    {
        total_ocupados += obj_controle.debug_contagem_cores[i];
    }


    //----------------------------------
    // CALCULA OS ESPAÇOS VAZIOS
    //----------------------------------

    obj_controle.qtd_vazios =
        total_posicoes - total_ocupados;


    //----------------------------------
    // CALCULA A PORCENTAGEM DAS CORES
    //----------------------------------

    for (var i = 0; i < 9; i++)
    {
        obj_controle.porcentagem_cores[i] =
            (obj_controle.debug_contagem_cores[i] / total_posicoes) * 100;
    }


    //----------------------------------
    // CALCULA A PORCENTAGEM DE VAZIOS
    //----------------------------------

    obj_controle.porcentagem_vazios =
        (obj_controle.qtd_vazios / total_posicoes) * 100;


    //----------------------------------
    // DEBUG
    //----------------------------------

    show_debug_message("===== COMPOSIÇÃO CROMÁTICA =====");
    show_debug_message("Total de posições: " + string(total_posicoes));
    show_debug_message("Total ocupados: " + string(total_ocupados));
    show_debug_message("Espaços vazios: " + string(obj_controle.qtd_vazios));
    show_debug_message(
        "Vazios: " +
        string(obj_controle.porcentagem_vazios) +
        "%"
    );

    show_debug_message(
        "Vermelho: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_VERMELHO]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_VERMELHO]) +
        "%)"
    );

    show_debug_message(
        "Azul: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_AZUL]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_AZUL]) +
        "%)"
    );

    show_debug_message(
        "Amarelo: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_AMARELO]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_AMARELO]) +
        "%)"
    );

    show_debug_message(
        "Roxo: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_ROXO]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_ROXO]) +
        "%)"
    );

    show_debug_message(
        "Verde: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_VERDE]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_VERDE]) +
        "%)"
    );

    show_debug_message(
        "Laranja: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_LARANJA]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_LARANJA]) +
        "%)"
    );

    show_debug_message(
        "Cinza: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_CINZA]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_CINZA]) +
        "%)"
    );

    show_debug_message(
        "Russet: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_RUSSET]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_RUSSET]) +
        "%)"
    );

    show_debug_message(
        "Oliva: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_OLIVA]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_OLIVA]) +
        "%)"
    );
}


/*
function scr_calcular_composicao()
{
    //----------------------------------
    // TOTAL DE POSIÇÕES DO TABULEIRO
    //----------------------------------

    var total_posicoes =
        obj_controle.board_colunas * obj_controle.board_linhas;


    //----------------------------------
    // ZERA A CONTAGEM DAS CORES
    //----------------------------------

    for (var i = 0; i < 9; i++)
    {
        obj_controle.debug_contagem_cores[i] = 0;
    }


    //----------------------------------
    // CONTA OS TILES DE CADA COR
    //----------------------------------

    with (obj_tile)
    {
        if (cor >= 0 && cor < 9)
        {
            obj_controle.debug_contagem_cores[cor]++;
        }
    }


    //----------------------------------
    // CALCULA A PORCENTAGEM DE CADA COR
    //----------------------------------

    for (var i = 0; i < 9; i++)
    {
        obj_controle.porcentagem_cores[i] =
            (obj_controle.debug_contagem_cores[i] / total_posicoes) * 100;
    }


    //----------------------------------
    // DEBUG
    //----------------------------------

    show_debug_message("===== COMPOSIÇÃO CROMÁTICA =====");
    show_debug_message("Total de posições: " + string(total_posicoes));

    show_debug_message(
        "Vermelho: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_VERMELHO]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_VERMELHO]) +
        "%)"
    );

    show_debug_message(
        "Azul: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_AZUL]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_AZUL]) +
        "%)"
    );

    show_debug_message(
        "Amarelo: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_AMARELO]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_AMARELO]) +
        "%)"
    );

    show_debug_message(
        "Roxo: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_ROXO]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_ROXO]) +
        "%)"
    );

    show_debug_message(
        "Verde: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_VERDE]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_VERDE]) +
        "%)"
    );

    show_debug_message(
        "Laranja: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_LARANJA]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_LARANJA]) +
        "%)"
    );

    show_debug_message(
        "Cinza: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_CINZA]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_CINZA]) +
        "%)"
    );

    show_debug_message(
        "Russet: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_RUSSET]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_RUSSET]) +
        "%)"
    );

    show_debug_message(
        "Oliva: " +
        string(obj_controle.debug_contagem_cores[obj_controle.COR_OLIVA]) +
        " (" +
        string(obj_controle.porcentagem_cores[obj_controle.COR_OLIVA]) +
        "%)"
    );
}