if (kidsparty_lightning or dark_lightning)
{
	var cw = (camera_get_view_width(view_camera[0]) + 32)
	var ch = (camera_get_view_height(view_camera[0]) + 32)
	if (!surface_exists(surf))
	{
		surf = surface_create(cw, ch)
		surface_set_target(surf)
		draw_clear_alpha(c_black, 0)
		surface_reset_target()
	}
	if (kidsparty_lightning && (!surface_exists(surf2)))
	{
		surf2 = surface_create(cw, ch)
		surface_set_target(surf2)
		draw_clear_alpha(c_black, 0)
		surface_reset_target()
	}
	var surf_x = camera_get_view_x(view_camera[0])
	var surf_y = camera_get_view_y(view_camera[0])
	if kidsparty_lightning
	{
		if surface_exists(surf)
		{
			surface_set_target(surf)
			draw_set_color(c_black)
			draw_set_alpha(1)
			draw_rectangle(0, 0, cw, ch, false)
			gpu_set_blendmode(bm_subtract)
			draw_set_color(c_white)
			with (obj_patrolcone)
			{
				if (instance_exists(baddieID) && baddieID.state != states.stun && baddieID.state != states.grabbed && baddieID.state != states.hit && baddieID.state != states.punch)
				{
					var points = get_triangle_points(x, y, image_angle, len, size)
					var c = 16777215
					draw_triangle_color((x - surf_x), (y - surf_y), (points[0] - surf_x), (points[1] - surf_y), (points[2] - surf_x), (points[3] - surf_y), c, c, c, 0)
				}
			}
			gpu_set_blendmode(bm_normal)
			draw_set_alpha(1)
			surface_reset_target()
		}
		if surface_exists(surf2)
		{
			surface_set_target(surf2)
			draw_set_color(c_black)
			draw_set_alpha(1)
			draw_rectangle(0, 0, cw, ch, false)
			gpu_set_blendmode(bm_subtract)
			draw_set_color(c_white)
			with (obj_patrolcone)
			{
				if (instance_exists(baddieID) && baddieID.state != states.stun && baddieID.state != states.grabbed && baddieID.state != states.hit && baddieID.state != states.punch)
					draw_sprite_ext(spr_patrol_lightgradient, 0, (x - surf_x), (y - surf_y), 1, 1, image_angle, c_white, 1)
			}
			gpu_set_blendmode(bm_normal)
			draw_surface(surf, 0, 0)
			gpu_set_blendmode(bm_add)
			draw_set_alpha(0.3)
			with (obj_patrolcone)
			{
				if (instance_exists(baddieID) && baddieID.state != states.stun && baddieID.state != states.grabbed && baddieID.state != states.hit && baddieID.state != states.punch)
				{
					if (collision or (instance_exists(baddieID) && baddieID.alarm[5] != -1))
					{
						points = get_triangle_points(x, y, image_angle, len, size)
						c = 255
						draw_triangle_color((x - surf_x), (y - surf_y), (points[0] - surf_x), (points[1] - surf_y), (points[2] - surf_x), (points[3] - surf_y), c, c, c, 0)
					}
				}
			}
			surface_reset_target()
			gpu_set_blendmode(bm_normal)
			draw_set_alpha(bg_alpha)
			draw_surface(surf2, surf_x, surf_y)
			draw_set_alpha(1)
		}
	}
	else if dark_lightning
	{
		if surface_exists(surf)
		{
			surface_set_target(surf)
			draw_set_color(c_black)
			draw_set_alpha(0.8)
			draw_rectangle(0, 0, cw, ch, false)
			gpu_set_blendmode(bm_subtract)
			draw_set_color(c_white)
			for (var i = 0; i < 2; i++)
			{
				var _player = asset_get_index(concat("obj_player", (i + 1)))
				draw_set_alpha(circle_alpha_out)
				with (_player)
				{
					if (state != states.gotoplayer)
						draw_circle(((x - surf_x) + irandom_range(-1, 1)), ((y - surf_y) + irandom_range(-1, 1)), 178, 0)
				}
				draw_set_alpha(circle_alpha_in)
				with (_player)
				{
					if (state != states.gotoplayer)
						draw_circle(((x - surf_x) + irandom_range(-1, 1)), ((y - surf_y) + irandom_range(-1, 1)), 128, 0)
				}
			}
			with (obj_chateaulight)
			{
				draw_set_alpha(circle_alpha_out)
				draw_circle(((x - surf_x) + irandom_range(-1, 1)), ((y - surf_y) + irandom_range(-1, 1)), circle_size_out, 0)
				draw_set_alpha(circle_alpha_in)
				draw_circle(((x - surf_x) + irandom_range(-1, 1)), ((y - surf_y) + irandom_range(-1, 1)), circle_size_in, 0)
			}
			gpu_set_blendmode(bm_normal)
			draw_set_alpha(1)
			surface_reset_target()
			draw_surface(surf, surf_x, surf_y)
		}
	}
}
