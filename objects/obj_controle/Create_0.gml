/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//-------------------------------------
// TABULEIRO
//-------------------------------------

// dimensões
board_colunas = 10;
board_linhas = 8;

// posição inicial
board_x = 330;
board_y = 200;

// sprite
board_largura = 64;
board_altura = 74;

// espaçamento entre centros
board_espaco_x = 64;
board_espaco_y = 55.5;

// matriz
board = array_create(board_colunas);
for (var c = 0; c < board_colunas; c++)
{
    board[c] = array_create(board_linhas);
}

// cria o tabuleiro
for (var linha = 0; linha < board_linhas; linha++)
{
    for (var coluna = 0; coluna < board_colunas; coluna++)
    {
        var xx = board_x + (coluna * board_espaco_x);

        // desloca linhas ímpares
        if (linha mod 2 == 1)
        {
            xx += board_largura / 2;
        }

        var yy = board_y + (linha * board_espaco_y);

        var novo_board = instance_create_layer(xx, yy, "board", obj_board);

        novo_board.linha = linha;
        novo_board.coluna = coluna;

        board[coluna][linha] = novo_board;
    }
}

// define vizinhos
for (var linha = 0; linha < board_linhas; linha++)
{
    for (var coluna = 0; coluna < board_colunas; coluna++)
    {
        var b = board[coluna][linha];

        // esquerda / direita
        if (coluna > 0) b.vizinho_esquerda = board[coluna - 1][linha];
        if (coluna < board_colunas - 1) b.vizinho_direita = board[coluna + 1][linha];

        // linhas pares
        if (linha mod 2 == 0)
        {
            if (linha > 0)
            {
                b.vizinho_superior_esquerda = (coluna > 0) ? board[coluna - 1][linha - 1] : noone;
                b.vizinho_superior_direita = board[coluna][linha - 1];
            }
            if (linha < board_linhas - 1)
            {
                b.vizinho_inferior_esquerda = (coluna > 0) ? board[coluna - 1][linha + 1] : noone;
                b.vizinho_inferior_direita = board[coluna][linha + 1];
            }
        }
        else
        {
            // linhas ímpares
            if (linha > 0)
            {
                b.vizinho_superior_esquerda = board[coluna][linha - 1];
                b.vizinho_superior_direita = (coluna < board_colunas - 1) ? board[coluna + 1][linha - 1] : noone;
            }
            if (linha < board_linhas - 1)
            {
                b.vizinho_inferior_esquerda = board[coluna][linha + 1];
                b.vizinho_inferior_direita = (coluna < board_colunas - 1) ? board[coluna + 1][linha + 1] : noone;
            }
        }
    }
}


//-------------------------------------
// GAMEPLAY
//-------------------------------------

tile_ativo = noone;
turno = 0;
proxima_ordem = 0;
modo_borboleta = false;

cor_novo_tile = -1;
nivel_novo_tile = -1;

board_resultado = noone;

boards_alterados = [];




//-------------------------------------
// CONSTANTES
//-------------------------------------

// tipos
TIPO_TILE  = 0;
TIPO_MOVER = 1;

// níveis
NIVEL_PRIMARIO   = 0;
NIVEL_SECUNDARIO = 1;
NIVEL_TERCIARIO  = 2;

// cores
COR_VERMELHO = 0;
COR_AZUL     = 1;
COR_AMARELO  = 2;
COR_ROXO     = 3;
COR_VERDE    = 4;
COR_LARANJA  = 5;
COR_CINZA    = 6;
COR_RUSSET   = 7;
COR_OLIVA    = 8;

// inicialização da próxima peça
proximo_tipo  = TIPO_TILE;
proxima_cor   = irandom_range(0, 2);
proximo_nivel = NIVEL_PRIMARIO;
proximo_frame = proxima_cor;


cadeia = [];

//************
//BUSCA
//************

cadeia = [];
nivel_busca = -1;

//**********
// ANALIZE DE RESULTADOS
//**********

// resultados da análise
COMBINACAO_NENHUMA = 0;
COMBINACAO_EMPATE_PRIMEIRO = 1;
COMBINACAO_PRIMEIRO_SEGUNDO = 2;
COMBINACAO_EMPATE_TRIPLO = 3;
COMBINACAO_EMPATE_SEGUNDO = 4;
COMBINACAO_MONOCROMATICA = 5;

// resultado atual
resultado_combinacao = COMBINACAO_NENHUMA;

cor_resultado_1 = -1;
cor_resultado_2 = -1;

//cor_novo_tile = -1;


//-------------------------------------
// TABELA DE COMBINAÇÕES
//-------------------------------------

tabela_combinacao = array_create(9);

for (var i = 0; i < 9; i++)
{
    tabela_combinacao[i] = array_create(9, -1);
}

// Primárias -> Secundárias
tabela_combinacao[COR_VERMELHO][COR_AZUL]     = COR_ROXO;
tabela_combinacao[COR_AZUL][COR_VERMELHO]     = COR_ROXO;

tabela_combinacao[COR_VERMELHO][COR_AMARELO]  = COR_LARANJA;
tabela_combinacao[COR_AMARELO][COR_VERMELHO]  = COR_LARANJA;

tabela_combinacao[COR_AZUL][COR_AMARELO]      = COR_VERDE;
tabela_combinacao[COR_AMARELO][COR_AZUL]      = COR_VERDE;

// Secundárias -> Terciárias
tabela_combinacao[COR_ROXO][COR_VERDE]        = COR_OLIVA; 
tabela_combinacao[COR_VERDE][COR_ROXO]        = COR_OLIVA;

tabela_combinacao[COR_VERDE][COR_LARANJA]     = COR_RUSSET;
tabela_combinacao[COR_LARANJA][COR_VERDE]     = COR_RUSSET;

tabela_combinacao[COR_ROXO][COR_LARANJA]      = COR_CINZA;
tabela_combinacao[COR_LARANJA][COR_ROXO]      = COR_CINZA;




//-------------------------------------
// BALANCEAMENTO
//-------------------------------------


//----------------------------------
// BALANCEAMENTO PONTOS
//----------------------------------

pontos_nivel = [];

pontos_nivel[NIVEL_PRIMARIO]   = 10;
pontos_nivel[NIVEL_SECUNDARIO] = 50;

// Se um dia o terciário pontuar:
// pontos_nivel[NIVEL_TERCIARIO] = 100;

bonus_combo = [];

bonus_combo[0] = 1.0;
bonus_combo[1] = 1.5;
bonus_combo[2] = 2.0;
bonus_combo[3] = 2.5;
bonus_combo[4] = 3.0;
bonus_combo[5] = 3.5;
bonus_combo[6] = 4.0;
bonus_combo[7] = 4.5;
bonus_combo[8] = 5.0;



pontuacao = 0;
combo = 0;
multiplicador = 1;
pontuacao_final = 0
porcentagem_cores = array_create(9, 0);
//***********
//DEBUG
//**********
debug_contagem_cores = array_create(9, 0);
nome_cor_resultado = "";