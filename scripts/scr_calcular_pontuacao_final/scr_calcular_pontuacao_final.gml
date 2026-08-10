// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_calcular_pontuacao_final()
{
    //----------------------------------
    // VARIÁVEIS
    //----------------------------------

    var total_tiles =
        obj_controle.board_linhas *
        obj_controle.board_colunas;

    // Array para contar todas as cores
    var qtd_cores = array_create(9, 0); 
    // 9 cores: vermelho, azul, amarelo, roxo, verde, laranja, cinza, russet, oliva


    //----------------------------------
    // CONTA TODAS AS PEÇAS
    //----------------------------------

    with (obj_tile)
    {
        qtd_cores[cor]++; // incrementa a cor correspondente
    }


    //----------------------------------
    // DEBUG
    //----------------------------------

    show_debug_message("===== PONTUAÇÃO FINAL =====");
    show_debug_message("Pontuação de jogo: " + string(obj_controle.pontuacao));
    show_debug_message("Total tiles: " + string(total_tiles));

    // Mostra cada cor
    show_debug_message("Vermelho: " + string(qtd_cores[obj_controle.COR_VERMELHO]));
    show_debug_message("Azul: " + string(qtd_cores[obj_controle.COR_AZUL]));
    show_debug_message("Amarelo: " + string(qtd_cores[obj_controle.COR_AMARELO]));
    show_debug_message("Roxo: " + string(qtd_cores[obj_controle.COR_ROXO]));
    show_debug_message("Verde: " + string(qtd_cores[obj_controle.COR_VERDE]));
    show_debug_message("Laranja: " + string(qtd_cores[obj_controle.COR_LARANJA]));
    show_debug_message("Cinza: " + string(qtd_cores[obj_controle.COR_CINZA]));
    show_debug_message("Russet: " + string(qtd_cores[obj_controle.COR_RUSSET]));
    show_debug_message("Oliva: " + string(qtd_cores[obj_controle.COR_OLIVA]));


    //----------------------------------
    // MULTIPLICADOR
    //----------------------------------

    obj_controle.multiplicador = 1;

    // pega o maior valor entre todas as cores
    var maior = 0;
    for (var i = 0; i < array_length(qtd_cores); i++)
    {
        if (qtd_cores[i] > maior)
        {
            maior = qtd_cores[i];
        }
    }

    var dominancia = (maior / total_tiles) * 100;

    show_debug_message("Maior: " + string(maior));
    show_debug_message("Dominância: " + string(dominancia));

    //----------------------------------
    // DEFINE MULTIPLICADOR
    //----------------------------------

    if (dominancia >= 100)
    {
        obj_controle.multiplicador = 10;
    }
    else if (dominancia >= 99)
    {
        obj_controle.multiplicador = 5.5;
    }
    else if (dominancia >= 95)
    {
        obj_controle.multiplicador = 4.5;
    }
    else if (dominancia >= 80)
    {
        obj_controle.multiplicador = 4;
    }
    else if (dominancia >= 60)
    {
        obj_controle.multiplicador = 2.5;
    }
    else if (dominancia >= 40)
    {
        obj_controle.multiplicador = 2;
    }
    else if (dominancia >= 20)
    {
        obj_controle.multiplicador = 1.5;
    }


    //----------------------------------
    // CALCULA PONTUAÇÃO FINAL
    //----------------------------------

    obj_controle.pontuacao_final =
        obj_controle.pontuacao *
        obj_controle.multiplicador;


    //----------------------------------
    // DEBUG FINAL
    //----------------------------------

    show_debug_message("Multiplicador: " + string(obj_controle.multiplicador));
    show_debug_message("Pontuação Base: " + string(obj_controle.pontuacao));
    show_debug_message("Pontuação Final: " + string(obj_controle.pontuacao_final));


    //----------------------------------
    // RETORNA O RESULTADO
    //----------------------------------

    return obj_controle.pontuacao_final;
}

/*
function scr_calcular_pontuacao_final()
{
    //----------------------------------
    // VARIÁVEIS
    //----------------------------------

    var total_terciarias = 0;
    var total_tiles =
        obj_controle.board_linhas *
        obj_controle.board_colunas;

    var qtd_cinza = 0;
    var qtd_russet = 0;
    var qtd_oliva = 0;


    //----------------------------------
    // CONTA AS TERCIÁRIAS
    //----------------------------------

    with (obj_tile)
    {
        if (nivel == 2)
        {
            total_terciarias++;

            switch (cor)
            {
                case obj_controle.COR_CINZA:
                    qtd_cinza++;
                break;

                case obj_controle.COR_RUSSET:
                    qtd_russet++;
                break;

                case obj_controle.COR_OLIVA:
                    qtd_oliva++;
                break;
            }
        }
    }


    //----------------------------------
    // DEBUG
    //----------------------------------

    show_debug_message("===== PONTUAÇÃO FINAL =====");
    show_debug_message(
        "Pontuação de jogo: " +
        string(obj_controle.pontuacao)
    );

    show_debug_message(
        "Total terciárias: " +
        string(total_terciarias)
    );

    show_debug_message(
        "Cinza: " +
        string(qtd_cinza)
    );

    show_debug_message(
        "Russet: " +
        string(qtd_russet)
    );

    show_debug_message(
        "Oliva: " +
        string(qtd_oliva)
    );


    //----------------------------------
    // MULTIPLICADOR
    //----------------------------------

    obj_controle.multiplicador = 1;


    //----------------------------------
    // SE NÃO HOUVER TERCIÁRIAS
    //----------------------------------

    if (total_terciarias > 0)
    {
        var maior =
            max(
                qtd_cinza,
                qtd_russet,
                qtd_oliva
            );

        var dominancia =
            (maior / total_tiles) * 100;


        show_debug_message(
            "Maior: " +
            string(maior)
        );

        show_debug_message(
            "Dominância: " +
            string(dominancia)
        );


        //----------------------------------
        // DEFINE MULTIPLICADOR
        //----------------------------------

        if (dominancia == 100)
        {
            obj_controle.multiplicador = 5;
        }
        else if (dominancia >= 75)
        {
            obj_controle.multiplicador = 2.5;
        }
        else if (dominancia >= 50)
        {
            obj_controle.multiplicador = 1.5;
        }
    }


    //----------------------------------
    // CALCULA PONTUAÇÃO FINAL
    //----------------------------------

    obj_controle.pontuacao_final =
        obj_controle.pontuacao *
        obj_controle.multiplicador;


    //----------------------------------
    // DEBUG FINAL
    //----------------------------------

    show_debug_message(
        "Multiplicador: " +
        string(obj_controle.multiplicador)
    );

    show_debug_message(
        "Pontuação Base: " +
        string(obj_controle.pontuacao)
    );

    show_debug_message(
        "Pontuação Final: " +
        string(obj_controle.pontuacao_final)
    );


    //----------------------------------
    // RETORNA O RESULTADO
    //----------------------------------

    return obj_controle.pontuacao_final;
}