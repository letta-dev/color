/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



draw_self()

if (finaliza == 1) 
{
	var txt = "CASH OUT";
	var w = string_width(txt);
	var h = string_height(txt);

	// Centraliza o texto no ponto (x, y)
	//draw_set_font(fnt_main);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(x - w/2, y - h/2, txt);

}


if (sfx == 1) 
{
	draw_set_font(fnt_pequena)
	var txt = "SFX OFF";
	var w = string_width(txt);
	var h = string_height(txt);

	// Centraliza o texto no ponto (x, y)
	//draw_set_font(fnt_main);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(x - w/2, y - h/2, txt);
	draw_set_font(Font1)
}

if (sfx == 2) 
{
	draw_set_font(fnt_pequena)
	var txt = "SFX ON";
	var w = string_width(txt);
	var h = string_height(txt);

	// Centraliza o texto no ponto (x, y)
	//draw_set_font(fnt_main);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(x - w/2, y - h/2, txt);
	draw_set_font(Font1)

}

if (music == 1) 
{
	draw_set_font(fnt_pequena)
	var txt = "MUSIC OFF";
	var w = string_width(txt);
	var h = string_height(txt);

	// Centraliza o texto no ponto (x, y)
	//draw_set_font(fnt_main);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(x - w/2, y - h/2, txt);
	draw_set_font(Font1)

}

if (music == 2) 
{
	draw_set_font(fnt_pequena)
	var txt = "MUSIC ON";
	var w = string_width(txt);
	var h = string_height(txt);

	// Centraliza o texto no ponto (x, y)
	//draw_set_font(fnt_main);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(x - w/2, y - h/2, txt);
	draw_set_font(Font1)

}