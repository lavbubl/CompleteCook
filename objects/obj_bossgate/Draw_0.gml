if !surface_exists(bg_surf)
	bg_surf = surface_create(sprite_get_width(door_gate), sprite_get_height(door_gate))
if surface_exists(bg_surf)
{
	surface_set_target(bg_surf)
	
	draw_clear(c_black)
	
	var xx = ((obj_camera.campos.x + (screen_w / 2)) - x) * scroll_spd
	var yy = ((obj_camera.campos.y + (screen_h / 2)) - y + 170) * scroll_spd
	
	draw_sprite_tiled(door_bg, 0, xx, yy)
	
	gpu_set_blendmode(bm_subtract)
	draw_sprite(subtract_spr, 1, 0, 0) // subtract the masking from the drawing 
	gpu_set_blendmode_normal_fixed()
	
	surface_reset_target()
	draw_surface(bg_surf, x - sprite_get_xoffset(door_gate), y - sprite_get_yoffset(door_gate))
}

draw_sprite(door_gate, 0, x, y)

var a = distance_to_object(obj_player) / 200
draw_sprite_ext(door_gate, 1, x, y, 1, 1, 0, c_white, a)

/*if save_exists
{
	for (var i = 0; i < save_data.secret_count; i++)
	    draw_sprite(spr_secretportal_enter, 10, x - 150, bbox_top + (i * 50))
}
*/