/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if room == rm_menu
{
	draw_set_font(fnt_grande)
	draw_set_color(c_black)
	// Pega largura e altura da viewport
	var vw = display_get_gui_width();
	var vh = display_get_gui_height();

	// Texto que você quer desenhar
	var txt = "Se vecê continuar tentando misturar três iguais, \n a culpa já não é da falta de tutorial.";

	// Calcula posição central
	var xx = vw * 0.5;
	var yy = vh * 0.5;

	// Define alinhamento central
	draw_set_halign(fa_center);
	draw_set_valign (fa_middle);

	// Desenha o texto
	draw_text(xx, 100, txt);
	draw_set_font(Font1)

}

if room == rm_principal
{
	draw_set_font(Font1)
	draw_set_color(c_black)
	// Pega largura e altura da viewport
	var vw = display_get_gui_width();
	var vh = display_get_gui_height();

	// Texto que você quer desenhar
	var txt = "Se vecê continuar tentando misturar três iguais, \n a culpa já não é da falta de tutorial.";

	// Calcula posição central
	var xx = vw * 0.5;
	var yy = vh * 0.5;

	// Define alinhamento central
	draw_set_halign(fa_center);
	draw_set_valign (fa_middle);

	// Desenha o texto
	draw_text(xx, 100, txt);
	draw_set_font(Font1)

}





