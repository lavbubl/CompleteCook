var xx = x
var yy = y
draw_set_color(c_white)
draw_sprite(spr_comboend, 0, xx, yy)
var title = floor(combo / 5)
if (title > (sprite_get_number(spr_combotitles) / 2))
{
    title -= (sprite_get_number(spr_combotitles) / 2)
    very = true
}
if (combo >= 80)
    very = true
draw_sprite(spr_combotitles, (title * 2 + title_index), xx, (yy + 30))
draw_set_font(-4)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text(xx, (yy + 70), comboscore)
if very
    draw_sprite(spr_combovery, 0, (xx - 65), (yy - 6 + 30))
