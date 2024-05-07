draw_sprite_tiled(spr_optionbg, 0, x, y)
draw_sprite_tiled_ext(spr_optionbg, bgindex, x, y, 1, 1, c_white, bgalpha)
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if (!canchoose && alarm[0] < 0)
	exit;
for (var i = 0; i < array_length(optionarr); i++)
{
    draw_text(480, 148 + (i * 48), optionarr[i][0])
	if (selected == i)
		draw_sprite(spr_cursor, 0, 200, 158 + (i * 48))
}
