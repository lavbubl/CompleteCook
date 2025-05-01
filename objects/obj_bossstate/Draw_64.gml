var padding = 48
var dist = 40

var xx = padding
var yy = padding
var xo = xx

var rows = 3

var curhp = 1
repeat player.maxhp
{
	draw_sprite_ext(player.hpspr, player.hpix, xx, yy, 1, 1, 0, c_black, 1)
	if curhp <= player.hp
	{
		if obj_player.pal_select == 12
			pattern_draw(player.hpspr, player.hpix, xx, yy, obj_player.pattern_spr)
		
		pal_swap_set(pal_peppino, obj_player.pal_select, false)
		draw_sprite(player.hpspr, player.hpix, xx, yy)
		pal_swap_reset()
	}
	xx += dist
	if xx >= xo + (dist * rows) 
	{
		xx = xo
		yy += dist
	}
	curhp++
}

xx = screen_w - padding - (dist * (opponent.rows - 1))
yy = padding
xo = xx

curhp = 1
repeat opponent.maxhp
{
	draw_sprite_ext(opponent.hpspr, opponent.hpix, xx, yy, 1, 1, 0, c_black, 1)
	if curhp <= opponent.hp
		draw_sprite(opponent.hpspr, opponent.hpix, xx, yy)
	xx += dist
	if xx >= xo + (dist * opponent.rows) 
	{
		xx = xo
		yy += dist
	}
	curhp++
}

player.hpix = wrap(sprite_get_number(player.hpspr), player.hpix + 0.35)
opponent.hpix = wrap(sprite_get_number(opponent.hpspr), opponent.hpix + 0.35)

if fade_alpha > 0
{
	draw_set_color(c_black)
	draw_set_alpha(fade_alpha)
	draw_rectangle(0, 0, screen_w, screen_h, false)
	draw_set_color(c_white)
	draw_set_alpha(1)
	
	with obj_player
	{
		if pal_select == 12
			pattern_draw(sprite_index, image_index, x, y, pattern_spr, xscale * visual_size, image_yscale * visual_size, image_angle, image_blend, image_alpha)

		pal_swap_set(pal_peppino, pal_select, false)
		draw_sprite_ext(sprite_index, image_index, x, y, xscale * visual_size, image_yscale * visual_size, image_angle, image_blend, image_alpha)
		pal_swap_reset()
	}
}
