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
{
	var _stun = 0
	if (state == states.stun && thrown == false)
		_stun = 25
	if (visible && object_index != obj_pizzaball && bbox_in_camera(view_camera[0], 32))
	{
		var c = image_blend
		if elite
			c = 65535
		if elitegrab
			c = 32768
		b = get_dark(c, other.use_dark)
		if (object_index == obj_peppinoclone)
		{
			shader_set(global.Pal_Shader)
			pal_swap_set(spr_peppalette, 1, 0)
		}
		else
		{
			shader_set(global.Pal_Shader)
			pal_swap_set(spr_palette, paletteselect, 0)
		}
		draw_sprite_ext(sprite_index, image_index, x, (y + _stun), (xscale * image_xscale), yscale, angle, b, image_alpha)
		if _kungfu
		{
			if (hp > maxhp)
				maxhp = hp
			draw_healthbar((x - 16), (y - 50), (x + 16), (y - 45), ((hp / maxhp) * 100), c_black, c_red, c_red, 0, 1, 1)
		}
		if (object_index == obj_peppinoclone or usepalette)
			shader_reset()
		if (object_index == obj_hamkuff)
		{
			if (state == states.blockstance && instance_exists(playerid))
			{
				var x1 = (x + 3)
				var y1 = (y + 30)
				if (sprite_index == spr_hamkuff_chain2)
				{
					x1 = (x + 7)
					y1 = (y + 33)
				}
				var dis = point_distance(x1, y1, playerid.x, playerid.y)
				var w = 24
				var len = (dis div w)
				var dir = point_direction(x1, y1, playerid.x, (playerid.y + 16))
				var xx = lengthdir_x(w, dir)
				var yy = lengthdir_y(w, dir)
				for (i = 0; i < len; i++)
					draw_sprite_ext(spr_hamkuff_sausage, -1, (x1 + (xx * i)), (y1 + (yy * i)), 1, 1, dir, b, 1)
			}
		}
	}
}
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
		b = get_dark(image_blend, other.use_dark)
		draw_sprite_ext(sprite_index, image_index, x, y, (xscale * scale_xs), (yscale * scale_ys), angle, b, image_alpha)
	}
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
