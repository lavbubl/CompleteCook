if !surface_exists(bg_surf)
	bg_surf = surface_create(sprite_get_width(door_gate), sprite_get_height(door_gate))
else
{
	surface_set_target(bg_surf)
	
	draw_clear_alpha(c_black, 0)
	
	for (var i = 0; i < array_length(bg_parallax); i++) //draw each layer
		draw_sprite_tiled(door_bg, i, bg_parallax[i].x, sprite_height)
	
	gpu_set_blendmode(bm_subtract)
	draw_sprite(subtract_spr, 1, 0, 0) // subtract the masking from the drawing 
	gpu_set_blendmode(bm_normal)
	
	surface_reset_target()
	draw_surface(bg_surf, x - sprite_get_xoffset(door_gate), y - sprite_get_yoffset(door_gate))
}

draw_sprite(door_gate, 0, x, y)

var a = distance_to_object(obj_player) / 200

draw_sprite_ext(door_gate, 1, x, y, 1, 1, 0, c_white, a)