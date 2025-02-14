if !surface_exists(bg_surf)
	bg_surf = surface_create(sprite_width, sprite_height)
else
{
	surface_set_target(bg_surf)
	
	draw_clear_alpha(c_black, 0)
	
	for (var i = 0; i < array_length(bg_parallax); i++) //draw each layer
		draw_sprite_tiled(door_bg, i, bg_parallax[i].x, sprite_height)
	
	gpu_set_blendmode(bm_subtract)
	draw_sprite(door_gate, 1, sprite_get_xoffset(sprite_index), sprite_get_yoffset(sprite_index)) // subtract the masking from the drawing 
	gpu_set_blendmode(bm_normal)
	
	surface_reset_target()
	draw_surface(bg_surf, x + (bbox_left - x), y + (bbox_top - y))
}

draw_sprite(door_gate, 0, x, y)