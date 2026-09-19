// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function scr_escolher_cor_resultado()
{
    cor_novo_tile = -1;
    nivel_novo_tile = -1;

    nome_cor_resultado = "Nenhuma";

    if (cor_resultado_1 == -1 || cor_resultado_2 == -1)
        return;

    //----------------------------------
    // ESCOLHE A COR
    //----------------------------------

    cor_novo_tile = tabela_combinacao[cor_resultado_1][cor_resultado_2];

    //----------------------------------
    // ESCOLHE O NÍVEL
    //----------------------------------

    switch (cor_novo_tile)
    {
        case COR_VERMELHO:
        case COR_AZUL:
        case COR_AMARELO:

            nivel_novo_tile = NIVEL_PRIMARIO;

        break;

        case COR_ROXO:
        case COR_VERDE:
        case COR_LARANJA:

            nivel_novo_tile = NIVEL_SECUNDARIO;

        break;

        case COR_CINZA:
        case COR_RUSSET:
        case COR_OLIVA:

            nivel_novo_tile = NIVEL_TERCIARIO;


        break;
    }

    //----------------------------------
    // NOME DA COR
    //----------------------------------

    switch(cor_novo_tile)
    {
        case COR_VERMELHO: nome_cor_resultado = "Vermelho"; break;
        case COR_AZUL:     nome_cor_resultado = "Azul"; break;
        case COR_AMARELO:  nome_cor_resultado = "Amarelo"; break;
        case COR_ROXO:     nome_cor_resultado = "Roxo"; break;
        case COR_VERDE:    nome_cor_resultado = "Verde"; break;
        case COR_LARANJA:  nome_cor_resultado = "Laranja"; break;
        case COR_CINZA:    nome_cor_resultado = "Cinza"; break;
        case COR_RUSSET:   nome_cor_resultado = "Russet"; break;
        case COR_OLIVA:    nome_cor_resultado = "Oliva"; break;
    }
}

