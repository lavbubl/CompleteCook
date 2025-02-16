function break_destroyables()
{
	var d_pos = { //destroyable_position
		x: x + hsp + sign(hsp),
		y: y + vsp + sign(vsp)
	}
	
	if state == states.grab
		d_pos.x = x + hsp + xscale
	
	var d_list = ds_list_create()
	instance_place_list(d_pos.x, d_pos.y, obj_destroyable, d_list, false)
	
	var horizontal_states = [
		states.mach2,
		states.mach3,
		states.grab,
		states.tumble,
		states.punch,
		e_states.hit
	]
	
	var vertical_states = [
		states.groundpound,
		states.punch,
		states.superjump,
		e_states.hit
	]
	
	var is_h_state = false
	var is_v_state = false
	
	for (var i = 0; i < array_length(horizontal_states); i++) 
	{
	    if (state == horizontal_states[i])
			is_h_state = true
	}
	
	for (var i = 0; i < array_length(vertical_states); i++) 
	{
	    if (state == vertical_states[i])
			is_v_state = true
	}
	
	for (var i = 0; i < ds_list_size(d_list); i++) 
	{
		var d_id = ds_list_find_value(d_list, i)
		
		if (place_meeting(d_pos.x, y, d_id) && is_h_state)
			instance_destroy(d_id)
			
		if (place_meeting(x, d_pos.y, d_id) && is_v_state)
			instance_destroy(d_id)
	}
	
	ds_list_destroy(d_list)
}