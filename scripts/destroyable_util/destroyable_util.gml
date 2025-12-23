function break_destroyables()
{
	var d_pos = { //destroyable_position
		x: x + hsp + xscale,
		y: y + vsp + sign(vsp)
	}
	
	var d_list = ds_list_create()
	instance_place_list(d_pos.x, d_pos.y, obj_destroyable, d_list, false)
	
	var horizontal_states = [
		states.mach2,
		states.mach3,
		states.grab,
		states.tumble,
		states.punch,
		states.hit,
		states.swingding
	]
	
	var vertical_states = [
		states.groundpound,
		states.punch,
		states.climbwall,
		states.hit,
		states.piledriver
	]
	
	var is_h_state = false
	var is_v_state = false
	
	for (var i = 0; i < array_length(horizontal_states); i++) 
	{
	    if (state == horizontal_states[i])
			is_h_state = true
	}
	
	for (i = 0; i < array_length(vertical_states); i++) 
	{
	    if (state == vertical_states[i])
			is_v_state = true
	}
	
	if state == states.superjump && sprite_index == spr_player_superjump
		is_v_state = true
	
	for (i = 0; i < ds_list_size(d_list); i++) 
	{
		var d_id = ds_list_find_value(d_list, i)
		
		if (place_meeting(d_pos.x, y, d_id) && is_h_state)
			instance_destroy(d_id)
			
		if (place_meeting(x, d_pos.y, d_id) && is_v_state)
			instance_destroy(d_id)
		
		if place_meeting(x, y - abs(vsp), d_id)
		{
			instance_destroy(d_id)
			vsp = 0
		}
	}
	
	ds_list_destroy(d_list)
}