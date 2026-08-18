var _move = -input_direction_check_pressed(INPUTS.ui_left) + input_direction_check_pressed(INPUTS.ui_right)

selected = wrap(array_length(languages_array), selected + _move)

var _offset = 5

if _move == -1
	left_arrow_x -= _offset
else if _move == 1
	right_arrow_x += _offset

if input_check_pressed(INPUTS.ui_back)
	instance_destroy()
else if input_check_pressed(INPUTS.ui_confirm)
{
	var _target_language = languages_array[selected][0]
	
	fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_accept")
	if global.language != _target_language
	{
		global.language = _target_language
		loading = true
		alarm[0] = 1
	}
	else
		instance_destroy()
}
