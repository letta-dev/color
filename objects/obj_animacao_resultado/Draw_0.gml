/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//-------------------------------------
// DRAW
//-------------------------------------

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fonte_resultado);


//=====================================
// POSIÇÕES DAS COLUNAS
//=====================================

var centro = room_width / 2;

// Distância entre as duas colunas
var distancia_colunas = 350;

var x_resultados = centro - distancia_colunas / 2;
var x_cores      = centro + distancia_colunas / 2;


//=====================================
// TÍTULO
//=====================================

draw_text(
    centro,
    y_titulo,
    "RESULTADO"
);


//=====================================
// COLUNA 1
// RESULTADOS
//=====================================


//-------------------------------------
// PONTUAÇÃO DE JOGO
//-------------------------------------

if (etapa >= 0)
{
    draw_text(
        x_resultados,
        y_pontuacao,
        "PONTUAÇÃO DE JOGO"
    );
}

if (etapa >= 1)
{
    draw_text(
        x_resultados,
        y_pontuacao + espaco_subtitulo_valor,
        string(floor(valor_pontuacao))
    );
}


//-------------------------------------
// MULTIPLICADOR
//-------------------------------------

if (etapa >= 2)
{
    draw_text(
        x_resultados,
        y_multiplicador,
        "MULTIPLICADOR DE PUREZA"
    );
}

if (etapa >= 3)
{
    draw_text(
        x_resultados,
        y_multiplicador + espaco_subtitulo_valor,
        "×" + string_format(
            valor_multiplicador,
            1,
            1
        )
    );
}


//-------------------------------------
// PONTUAÇÃO FINAL
//-------------------------------------

if (etapa >= 4)
{
    draw_text(
        x_resultados,
        y_pontuacao_final,
        "PONTUAÇÃO FINAL"
    );
}

if (etapa >= 5)
{
    draw_text(
        x_resultados,
        y_pontuacao_final + espaco_subtitulo_valor,
        string(floor(valor_pontuacao_final))
    );
}


//=====================================
// COLUNA 2
// COMPOSIÇÃO CROMÁTICA
//=====================================

if (etapa >= 6)
{
    draw_text(
        x_cores,
        y_composicao,
        "COMPOSIÇÃO CROMÁTICA"
    );
}


//=====================================
// CORES
//=====================================

if (etapa >= 7)
{
    for (var i = 0; i < 9; i++)
    {
        if (i <= cor_atual)
        {
            var yy =
                y_cores +
                espaco_subtitulo_valor +
                (i * espaco_linha_cor);


            //----------------------------------
            // ÍCONE
            //----------------------------------

            draw_sprite_ext(
                spr_resultado_cores,
                i,
                x_cores - 55,
                yy,
                escala_icone_cor,
                escala_icone_cor,
                0,
                c_white,
                1
            );


            //----------------------------------
            // PORCENTAGEM
            //----------------------------------

            draw_text(
                x_cores + 30,
                yy,
                string_format(
                    porcentagem_animada[i],
                    2,
                    1
                ) + "%"
            );
        }
    }
}


//=====================================
// ESPAÇOS VAZIOS
//=====================================

if (etapa >= 8)
{
    var y_vazio =
        y_cores +
        espaco_subtitulo_valor +
        (9 * espaco_linha_cor);


    //----------------------------------
    // ÍCONE DE ESPAÇO VAZIO
    //----------------------------------

    draw_sprite_ext(
        spr_resultado_cores,
        9,
        x_cores - 55,
        y_vazio,
        escala_icone_cor,
        escala_icone_cor,
        0,
        c_white,
        1
    );


    //----------------------------------
    // PORCENTAGEM
    //----------------------------------

    draw_text(
        x_cores + 30,
        y_vazio,
        string_format(
            porcentagem_animada[9],
            2,
            1
        ) + "%"
    );
}


//-------------------------------------
// RESTAURA
//-------------------------------------

draw_set_halign(fa_left);
draw_set_valign(fa_top);










