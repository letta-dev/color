/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//-------------------------------------
// RESULTADO DA PARTIDA
//-------------------------------------


//=====================================
// FONTE
//=====================================

fonte_resultado = 1;


//=====================================
// POSIÇÃO CENTRAL
//=====================================

centro_x = room_width / 2;
centro_y = room_height / 2;


//=====================================
// POSIÇÃO VERTICAL DOS BLOCOS
//=====================================

// Título principal
y_titulo = 50;

// Pontuação de jogo
y_pontuacao = 130;

// Multiplicador de pureza
y_multiplicador = 230;

// Pontuação final
y_pontuacao_final = 340;

// Título da composição
y_composicao = 130;

// Primeira linha de cor
y_cores = 150;


//=====================================
// ESPAÇAMENTO VERTICAL
//=====================================

// Distância entre o texto e seu valor
espaco_subtitulo_valor = 35;

// Distância entre as linhas das cores
espaco_linha_cor = 45;


//=====================================
// ESCALA DOS ÍCONES
//=====================================

escala_icone_cor = 1;


//=====================================
// ANIMAÇÃO
//=====================================

// Etapa atual da animação
etapa = 0;

// Temporizador da etapa atual
timer_etapa = 0;


//=====================================
// VALORES ANIMADOS
//=====================================

// Pontuação de jogo
valor_pontuacao = 99;

// Multiplicador de pureza
valor_multiplicador = 99;

// Pontuação final
valor_pontuacao_final = obj_menus.pontuacao_final;


//=====================================
// PORCENTAGENS ANIMADAS
//=====================================

// [0] Vermelho
// [1] Azul
// [2] Amarelo
// [3] Roxo
// [4] Verde
// [5] Laranja
// [6] Cinza
// [7] Russet
// [8] Oliva
// [9] Espaços vazios

porcentagem_animada = array_create(10, 0);


//=====================================
// CONTROLE DAS CORES
//=====================================

// Cor que está sendo exibida atualmente
cor_atual = 0;


//=====================================
// VELOCIDADE DAS ANIMAÇÕES
//=====================================

// Velocidade da pontuação
velocidade_pontuacao = 0.15;

// Velocidade do multiplicador
velocidade_multiplicador = 0.10;

// Velocidade das porcentagens
velocidade_porcentagem = 0.15;


//=====================================
// PAUSA ENTRE ETAPAS
//=====================================

// Tempo em frames
tempo_pausa = 20;



