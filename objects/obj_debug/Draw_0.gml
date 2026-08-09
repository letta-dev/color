/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/*
draw_set_color(c_black);

var yy = 100;

draw_text(500, yy, "PONTOS " + string(obj_controle.pontuacao));
yy += 20;

draw_text(500, yy, "PONTUAÇÃO FINAL " + string(obj_controle.pontuacao_final));
yy += 20;

draw_text(500, yy, "MULTIPLICADOR " + string(obj_controle.multiplicador));
yy += 20;

/*
draw_set_color(c_black);

var yy = 380;

draw_text(20, yy, "=== CONTAGEM DAS CORES ===");
yy += 20;

draw_text(20, yy, "Vermelho : " + string(obj_controle.debug_contagem_cores[obj_controle.COR_VERMELHO]));
yy += 20;

draw_text(20, yy, "Azul     : " + string(obj_controle.debug_contagem_cores[obj_controle.COR_AZUL]));
yy += 20;

draw_text(20, yy, "Amarelo  : " + string(obj_controle.debug_contagem_cores[obj_controle.COR_AMARELO]));
yy += 20;

draw_text(20, yy, "Roxo     : " + string(obj_controle.debug_contagem_cores[obj_controle.COR_ROXO]));
yy += 20;

draw_text(20, yy, "Verde    : " + string(obj_controle.debug_contagem_cores[obj_controle.COR_VERDE]));
yy += 20;

draw_text(20, yy, "Laranja  : " + string(obj_controle.debug_contagem_cores[obj_controle.COR_LARANJA]));
yy += 20;

draw_text(20, yy, "Cinza    : " + string(obj_controle.debug_contagem_cores[obj_controle.COR_CINZA]));
yy += 20;

draw_text(20, yy, "Russet   : " + string(obj_controle.debug_contagem_cores[obj_controle.COR_RUSSET]));
yy += 20;

draw_text(20, yy, "Oliva    : " + string(obj_controle.debug_contagem_cores[obj_controle.COR_OLIVA]));
yy += 40;

draw_text(20, yy, "Resultado : " + string(obj_controle.resultado_combinacao));
yy += 20;

draw_text(20, yy, "Cor 1 : " + string(obj_controle.cor_resultado_1));
yy += 20;

draw_text(20, yy, "Cor 2 : " + string(obj_controle.cor_resultado_2));
*/



/*
draw_text(20, 20, "Cadeia: " + string(array_length(obj_controle.cadeia)));
var yy = 50;

for (var i = 0; i < array_length(obj_controle.cadeia); i++)
{
    var b = obj_controle.cadeia[i];

    draw_text(
        20,
        yy,
        "[" + string(i) + "]  L:" + string(b.linha) +
        " C:" + string(b.coluna)
    );

    yy += 20;
}

/*
if (board_debug != noone)
{
    draw_set_color(c_red);

    draw_circle(
        board_debug.x,
        board_debug.y,
        8,
        false
    );
}

draw_set_color(c_yellow);

if (board_debug.vizinho_esquerda != noone)
{
	draw_set_color(c_yellow);
    draw_circle(
        board_debug.vizinho_esquerda.x,
        board_debug.vizinho_esquerda.y,
        6,
        false
    );
}

if (board_debug.vizinho_direita != noone)
{
	draw_set_color(c_red);
    draw_circle(
        board_debug.vizinho_direita.x,
        board_debug.vizinho_direita.y,
        6,
        false
    );
}

if (board_debug.vizinho_superior_esquerda != noone)
{
	draw_set_color(c_black);
    draw_circle(
        board_debug.vizinho_superior_esquerda.x,
        board_debug.vizinho_superior_esquerda.y,
        6,
        false
    );
}

if (board_debug.vizinho_superior_direita != noone)
{
	draw_set_color(c_blue);
    draw_circle(
        board_debug.vizinho_superior_direita.x,
        board_debug.vizinho_superior_direita.y,
        6,
        false
    );
}

if (board_debug.vizinho_inferior_esquerda != noone)
{
	draw_set_color(c_green);
    draw_circle(
        board_debug.vizinho_inferior_esquerda.x,
        board_debug.vizinho_inferior_esquerda.y,
        6,
        false
    );
}

if (board_debug.vizinho_inferior_direita != noone)
{
	draw_set_color(c_purple);
    draw_circle(
        board_debug.vizinho_inferior_direita.x,
        board_debug.vizinho_inferior_direita.y,
        6,
        false
    );
}



for (var i = 0; i < array_length(obj_controle.cadeia); i++)
{
    var b = obj_controle.cadeia[i];

    draw_set_color(c_red);
    draw_text(b.x - 5, b.y - 5, "X");
}