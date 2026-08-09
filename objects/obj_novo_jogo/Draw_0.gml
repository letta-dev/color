/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

	draw_self()

	if (room = rm_resultado) var txt = "NOVO JOGO";
	else if (room = rm_principal) var txt = "REINICIAR";
	var w = string_width(txt);
	var h = string_height(txt);

	// Centraliza o texto no ponto (x, y)
	//draw_set_font(fnt_main);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(x - w/2, y - h/2, txt);






