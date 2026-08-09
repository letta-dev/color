/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//-------------------------------------
// TIMER
//-------------------------------------

timer_etapa++;


//=====================================
// ETAPA 0
// APARECE "PONTUAÇÃO DE JOGO"
//=====================================

if (etapa == 0)
{
    if (timer_etapa >= tempo_pausa)
    {
        etapa = 1;
        timer_etapa = 0;
    }
}


//=====================================
// ETAPA 1
// ANIMA PONTUAÇÃO DE JOGO
//=====================================

if (etapa == 1)
{
    valor_pontuacao = lerp(
        valor_pontuacao,
        obj_menus.pontuacao_jogo,
        velocidade_pontuacao
    );

    if (abs(valor_pontuacao - obj_menus.pontuacao_jogo) < 1)
    {
        valor_pontuacao = obj_menus.pontuacao_jogo;

        etapa = 2;
        timer_etapa = 0;
    }
}


//=====================================
// ETAPA 2
// PAUSA
//=====================================

if (etapa == 2)
{
    if (timer_etapa >= tempo_pausa)
    {
        etapa = 3;
        timer_etapa = 0;
    }
}


//=====================================
// ETAPA 3
// ANIMA MULTIPLICADOR
//=====================================

if (etapa == 3)
{
    valor_multiplicador = lerp(
        valor_multiplicador,
        obj_menus.multiplicador_pureza,
        velocidade_multiplicador
    );

    if (abs(
        valor_multiplicador -
        obj_menus.multiplicador_pureza
    ) < 0.01)
    {
        valor_multiplicador =
            obj_menus.multiplicador_pureza;

        etapa = 4;
        timer_etapa = 0;
    }
}


//=====================================
// ETAPA 4
// PAUSA
//=====================================

if (etapa == 4)
{
    if (timer_etapa >= tempo_pausa)
    {
        etapa = 5;
        timer_etapa = 0;
    }
}


//=====================================
// ETAPA 5
// ANIMA PONTUAÇÃO FINAL
//=====================================

if (etapa == 5)
{
    valor_pontuacao_final = lerp(
        valor_pontuacao_final,
        obj_menus.pontuacao_final,
        velocidade_pontuacao
    );

    if (abs(
        valor_pontuacao_final -
        obj_menus.pontuacao_final
    ) < 1)
    {
        valor_pontuacao_final =
            obj_menus.pontuacao_final;

        etapa = 6;
        timer_etapa = 0;
    }
}


//=====================================
// ETAPA 6
// PAUSA
//=====================================

if (etapa == 6)
{
    if (timer_etapa >= tempo_pausa)
    {
        etapa = 7;
        timer_etapa = 0;
        cor_atual = 0;
    }
}


//=====================================
// ETAPA 7
// COMPOSIÇÃO CROMÁTICA
//=====================================

if (etapa == 7)
{
    // Anima a porcentagem da cor atual

    porcentagem_animada[cor_atual] = lerp(
        porcentagem_animada[cor_atual],
        obj_menus.porcentagem_cores[cor_atual],
        velocidade_porcentagem
    );


    // Quando termina a animação,
    // prepara a próxima cor

    if (abs(
        porcentagem_animada[cor_atual] -
        obj_menus.porcentagem_cores[cor_atual]
    ) < 0.05)
    {
        porcentagem_animada[cor_atual] =
            obj_menus.porcentagem_cores[cor_atual];

        timer_etapa++;

        if (timer_etapa >= tempo_pausa)
        {
            cor_atual++;
            timer_etapa = 0;

            // Depois das 9 cores,
            // passa para os espaços vazios

            if (cor_atual >= 9)
            {
                etapa = 8;
            }
        }
    }
}


//=====================================
// ETAPA 8
// ESPAÇOS VAZIOS
//=====================================

if (etapa == 8)
{
    porcentagem_animada[9] = lerp(
        porcentagem_animada[9],
        obj_menus.porcentagem_vazios,
        velocidade_porcentagem
    );
}








