/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()
if (mostra)
{
    var room_w = room_width;
    var room_h = room_height;

    var quadro_w = 1100;
    var quadro_h = 300;

    var quadro_x = (room_w - quadro_w) / 2;
    var quadro_y = (room_h - quadro_h) / 2;

    // Fundo cinza semi-transparente
    draw_set_color(c_gray);
    //draw_set_alpha(50);
    draw_rectangle(
        quadro_x,
        quadro_y,
        quadro_x + quadro_w,
        quadro_y + quadro_h,
        false
    );
    draw_set_alpha(1);

    // Texto
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var linhas = [
        "Para combinar as cores voce precisa agrupar um numero igual de tiles de duas cores,",
        "por exemplo, 2 tiles vermelhos e 2 tiles azuis.",
        "As combinacoes sao validas a partir de 4 tiles.",
        "Caso haja uma terceira cor minoritaria na cadeia ela sera consumida pela combinacao.",
        "",
        "O jogo termina quando todo o tabuleiro esta preenchido ou quando voce decide parar.",
        "Cada combinacao vale pontos, e combinacoes com mais tiles valem mais pontos.",
        "Ao finalizar, independente da forma, sera aplicado um multiplicador baseado",
        "na quantidade de tiles de nivel 3 presentes no tabuleiro."
    ];

    var linha_altura = 20;
    var altura_total = array_length(linhas) * linha_altura;

    // Centro vertical do texto
    var centro_x = quadro_x + quadro_w / 2;
    var start_y = quadro_y + (quadro_h - altura_total) / 2;

    for (var i = 0; i < array_length(linhas); i++)
    {
        var linha = linhas[i];

        draw_text(
            centro_x,
            start_y + i * linha_altura,
            linha
        );
    }

    // Restaura alinhamentos
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}


/*// Verifica se o mouse está sobre a sprite inteira do objeto
if (mostra)
{
    
    // Pega dimensões da room
    var room_w = room_width;
    var room_h = room_height;

    // Define tamanho do quadro
    var quadro_w = 800;
    var quadro_h = 700;

    // Calcula posição centralizada
    var quadro_x = (room_w - quadro_w) / 2;
    var quadro_y = (room_h - quadro_h) / 2;

    // Desenha quadro cinza
    draw_set_color(c_gray);
    draw_rectangle(quadro_x, quadro_y, quadro_x + quadro_w, quadro_y + quadro_h, false);

    // Define cor do texto
    draw_set_color(c_white);

    // Texto de ajuda
    var texto = 
    "Para combinar as cores voce precisa agrupar um numero igual de tiles de duas cores,\n" +
    "por exemplo, 2 tiles vermelhos e dois tiles azuis.\n" +
    "As combinacoes sao validas a partir de 4 tiles.\n" +
    "Caso haja uma terceira cor minoritaria na cadeia ela sera consumida pela combinacao.\n\n" +
    "O jogo termina quando todo o tabuleiro esta preenchido ou quando voce decide parar.\n" +
    "Cada combinacao vale pontos, e combinacoes com mais tiles valem mais pontos.\n" +
    "Ao finalizar, independente da forma, sera aplicado um multiplicador baseado\n" +
    "na quantidade de tiles de nivel 3 presentes no tabuleiro.";

    // Centraliza o texto dentro do quadro
    draw_text_ext(quadro_x + 20, quadro_y + 20, texto, -1, quadro_w - 40);
}



