bg_surf = -1
image_speed = 0
depth = 20

#region create masking effect

//ditto from startgate: i feel like drawing inside a create event might be bad, but it works
var s = surface_create(sprite_get_width(door_gate), sprite_get_height(door_gate))

surface_set_target(s)

draw_clear(c_white)

gpu_set_blendmode(bm_subtract)
draw_sprite(door_gate, 1, sprite_get_xoffset(door_gate), sprite_get_yoffset(door_gate)) // subtract the masking from the drawing 
gpu_set_blendmode_normal_fixed()

surface_reset_target()

subtract_spr = sprite_create_from_surface(s, 0, 0, sprite_get_width(door_gate), sprite_get_height(door_gate), false, false, 0, 0)

surface_free(s)

#endregion

save_data = {
	hats: 0,
	rank: 0
}

save_exists = false

/*ini_open(global.savestring)

if ini_section_exists(boss_name)
{
	
}

ini_close()*/
