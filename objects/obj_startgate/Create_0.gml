bg_surf = -1
image_speed = 0
depth = 20

bg_parallax = []

for (var i = 0; i < array_length(speed_array); i++) 
{
	var s = {
		spd: speed_array[i],
		x: 0
	}
	
    array_push(bg_parallax, s)
}

#region create masking effect

//i feel like drawing inside a create event might be bad, but it works
var s = surface_create(sprite_get_width(door_gate), sprite_get_height(door_gate))

surface_set_target(s)

draw_clear(c_white)

gpu_set_blendmode(bm_subtract)
draw_sprite(door_gate, 1, sprite_get_xoffset(door_gate), sprite_get_yoffset(door_gate)) // subtract the masking from the drawing 
gpu_set_blendmode_ext(bm_src_alpha, bm_dest_alpha)

surface_reset_target()

subtract_spr = sprite_create_from_surface(s, 0, 0, sprite_get_width(door_gate), sprite_get_height(door_gate), false, false, 0, 0)

surface_free(s)

#endregion

save_data = {
	score_num: 0,
	secret_count: 0,
	rank: 0
}

save_exists = false
spanwed_score = false

ini_open(global.savestring)

if ini_section_exists(level_name)
{
	save_exists = true
	save_data = {
		score_num: ini_read_real(level_name, "score", 0),
		secret_count: ini_read_real(level_name, "secret_count", 0),
		rank: ini_read_real(level_name, "rank", 0)
	}
	
	var toppin_arr = [
		{t_name: "shroom", idle: spr_shroomtoppin_idle, move: spr_shroomtoppin_move, taunt: spr_shroomtoppin_taunt},
		{t_name: "cheese", idle: spr_cheesetoppin_idle, move: spr_cheesetoppin_move, taunt: spr_cheesetoppin_taunt},
		{t_name: "tomato", idle: spr_tomatotoppin_idle, move: spr_tomatotoppin_move, taunt: spr_tomatotoppin_taunt},
		{t_name: "sausage", idle: spr_sausagetoppin_idle, move: spr_sausagetoppin_move, taunt: spr_sausagetoppin_taunt},
		{t_name: "pineapple", idle: spr_pineappletoppin_idle, move: spr_pineappletoppin_move, taunt: spr_pineappletoppin_taunt}
	]
	
	for (var i = 0; i < array_length(toppin_arr); i++)
	{
		var cur_toppin = toppin_arr[i]
		
		if ini_read_real(level_name, cur_toppin.t_name, 0)
		{
			with instance_create(x, y - 46, obj_gatetoppin)
			{
				sprs = {
					idle: cur_toppin.idle,
					move: cur_toppin.move,
					taunt: cur_toppin.taunt
				}
			}
		}
	}
}

ini_close()
