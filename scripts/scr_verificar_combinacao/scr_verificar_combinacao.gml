// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações


function scr_verificar_combinacao()
{

    //----------------------------------------
    // LIMPA RESULTADO ANTERIOR
    //----------------------------------------
	resultado_combinacao = obj_controle.COMBINACAO_NENHUMA;

	cor_resultado_1 = -1;
	cor_resultado_2 = -1;

	nivel_resultado = -1;
	
	//----------------------------------------
	// TAMANHO MÍNIMO DA CADEIA
	//----------------------------------------

	if (array_length(cadeia) < 4)
	{
	    resultado_combinacao = obj_controle.COMBINACAO_NENHUMA;
	    return;
	}

    //----------------------------------------
    // CONTA AS CORES
    //----------------------------------------

    var contagem = array_create(9, 0);

    for (var i = 0; i < array_length(cadeia); i++)
    {
        var cor = cadeia[i].tile.cor;
        contagem[cor]++;
    }
	
	for (var i = 0; i < 9; i++)
	{
	    debug_contagem_cores[i] = contagem[i];
	}
	
	if (array_length(cadeia) > 0)
	{
	    nivel_resultado = cadeia[0].tile.nivel;
	}
	//----------------------------------------
	// NÍVEL MÁXIMO NÃO COMBINA
	//----------------------------------------

	if (nivel_resultado == obj_controle.NIVEL_TERCIARIO)
	{
	    resultado_combinacao = obj_controle.COMBINACAO_NENHUMA;
	    return;
	}

    //----------------------------------------
    // CONTA QUANTAS CORES EXISTEM
    //----------------------------------------

    var cores_diferentes = 0;

    for (var cor = 0; cor < 9; cor++)
    {
        if (contagem[cor] > 0)
        {
            cores_diferentes++;
        }
    }

    //----------------------------------------
    // REGRA 5
    // APENAS UMA COR
    //----------------------------------------

    if (cores_diferentes == 1)
    {
        resultado_combinacao = obj_controle.COMBINACAO_MONOCROMATICA;
        return;
    }

    //----------------------------------------
    // PROCURA MAIOR E SEGUNDO MAIOR
    //----------------------------------------

    var maior = 0;
    var segundo = 0;

    for (var cor = 0; cor < 9; cor++)
    {
        var valor = contagem[cor];

        if (valor > maior)
        {
            segundo = maior;
            maior = valor;
        }
        else if (valor > segundo && valor < maior)
        {
            segundo = valor;
        }
    }

    //----------------------------------------
    // DESCOBRE QUEM POSSUI O MAIOR
    //----------------------------------------

    var empate_primeiro = 0;

    for (var cor = 0; cor < 9; cor++)
    {
        if (contagem[cor] == maior)
        {
            if (empate_primeiro == 0)
                cor_resultado_1 = cor;
            else if (empate_primeiro == 1)
                cor_resultado_2 = cor;

            empate_primeiro++;
        }
    }

    //----------------------------------------
    // REGRA 3
    //----------------------------------------

    if (empate_primeiro >= 3)
    {
        resultado_combinacao = obj_controle.COMBINACAO_EMPATE_TRIPLO;
        return;
    }

    //----------------------------------------
    // REGRA 1
    //----------------------------------------

    if (empate_primeiro == 2)
    {
        resultado_combinacao = obj_controle.COMBINACAO_EMPATE_PRIMEIRO;
        return;
    }

    //----------------------------------------
    // DESCOBRE O SEGUNDO LUGAR
    //----------------------------------------

    var empate_segundo = 0;

    for (var cor = 0; cor < 9; cor++)
    {
        if (contagem[cor] == segundo)
        {
            empate_segundo++;

            if (cor_resultado_2 == -1)
            {
                cor_resultado_2 = cor;
            }
        }
    }

    //----------------------------------------
    // REGRA 4
    //----------------------------------------

    if (empate_segundo >= 2)
    {
        resultado_combinacao = obj_controle.COMBINACAO_EMPATE_SEGUNDO;
        return;
    }

    //----------------------------------------
    // REGRA 2
    //----------------------------------------

    resultado_combinacao = obj_controle.COMBINACAO_PRIMEIRO_SEGUNDO;
}