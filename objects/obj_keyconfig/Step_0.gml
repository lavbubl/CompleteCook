if !binding
	selected = clamp(selected + (-input_check_pressed(INPUTS.ui_up) + input_check_pressed(INPUTS.ui_down)), -1, array_length(binds) - 1)

if input_check_pressed(INPUTS.ui_up) || 
   input_check_pressed(INPUTS.ui_down)
	scr_sound(sfx_step)

if input_check_pressed(INPUTS.ui_up) && selected == -1
	back_selected_target = 0

if selected != -1 && input_check_pressed(INPUTS.ui_left)
{
	back_selected_target = selected
	selected = -1
	scr_sound(sfx_step)
}

if selected == -1
{
	if input_check_pressed(INPUTS.ui_accept) || input_check_pressed(INPUTS.ui_deny)
		instance_destroy()
	else if input_check_pressed(INPUTS.ui_right)
	{
		selected = back_selected_target
		scr_sound(sfx_step)
	}
	exit;
}

var _bindname = binds[selected].bindname
var _cur_bind = variable_clone(global.bindslist[$ _bindname][0])

if binding 
{
	if gamepad_check_any()
		binding = false
	else if keyboard_check_pressed(vk_anykey)
	{
		if _cur_bind == vk_nokey
			_cur_bind = keyboard_key
		else
		{
			if is_real(_cur_bind)
				_cur_bind = [_cur_bind] //convert it to array
			else if is_string(_cur_bind)
				_cur_bind = [ord(_cur_bind)]
			
			if !array_contains(_cur_bind, keyboard_key) //check if the key isnt set already
				array_push(_cur_bind, keyboard_key) //then add the key
		}
		
		binding = false
		
		global.bindslist[$ _bindname][0] = _cur_bind
	}
}
else
{
	if input_check_pressed(config_buttons[1][0])
		binding = true
	else if input_check_pressed(config_buttons[2][0])
		global.bindslist[$ _bindname][0] = vk_nokey
	else if input_check_pressed(config_buttons[0][0])
	{
		for (var i = 0; i < array_length(binds); i++)
		{
			global.bindslist[$ binds[i].bindname][0] = binds[i].defaultbind
		}
	}
	if input_check_pressed(INPUTS.ui_deny)
		instance_destroy()
}
