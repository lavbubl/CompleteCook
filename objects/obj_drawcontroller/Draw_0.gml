if use_dark
{
	for (var i = 0; i < array_length(objdark_arr); i++)
	{
		with (objdark_arr[i])
		{
			if visible
			{
				var b = get_dark(image_blend, other.use_dark)
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha)
			}
		}
	}
}
if (obj_player1.finisher or obj_player2.finisher or (obj_player.state == states.playersuperattack && obj_player.superattackstate == states.transitioncutscene))
	finisher_alpha = Approach(finisher_alpha, 0.3, 0.1)
else if (finisher_alpha > 0)
	finisher_alpha = Approach(finisher_alpha, 0, 0.02)
if (finisher_alpha > 0)
{
	draw_set_alpha(finisher_alpha)
	draw_rectangle_color(-32, -32, (room_width + 32), (room_height + 32), c_black, c_black, c_black, c_black, 0)
	draw_set_alpha(1)
}
var _kungfu = global.kungfu
with (obj_baddie)
	draw_enemy(_kungfu, true)
shader_set(global.Pal_Shader)
with (obj_sausageman_dead)
{
	if (visible && bbox_in_camera(view_camera[0], 32))
	{
		pal_swap_set(spr_palette, paletteselect, 0)
		b = get_dark(image_blend, other.use_dark)
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha)
	}
}
with (obj_heatafterimage)
{
	if visible
	{
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
		draw_sprite_ext(obj_player1.sprite_index, obj_player1.image_index, x, y, obj_player1.xscale, obj_player1.yscale, 1, c_white, alpha)
	}
}
with (obj_player2)
{
	if (visible && bbox_in_camera(view_camera[0], 32))
	{
		pal_swap_set(spr_palette, paletteselect, 0)
		b = get_dark(image_blend, other.use_dark)
		draw_sprite_ext(sprite_index, image_index, x, y, (xscale * scale_xs), (yscale * scale_ys), image_angle, b, image_alpha)
	}
}
with (obj_player1)
{
	if (visible && bbox_in_camera(view_camera[0], 32))
	{
		pal_swap_set(spr_palette, paletteselect, 0)
		pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.patterntexture)
		b = get_dark(image_blend, other.use_dark)
		draw_sprite_ext(sprite_index, image_index, x, y, (xscale * scale_xs), (yscale * scale_ys), angle, b, image_alpha)
		pattern_reset()
	}
	draw_superslam_enemy()
}
shader_set(shd_hit)
with (obj_baddie)
{
	_stun = 0
	if (state == states.stun)
		_stun = 25
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x, (y + _stun), (xscale * image_xscale), yscale, angle, image_blend, image_alpha)
}
with (obj_player)
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
}
with (obj_deadjohnparent)
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, (x + hurtx), y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}
with (obj_smallnumber)
{
	if (visible && flash)
		draw_text(x, y, number)
}
shader_reset()
