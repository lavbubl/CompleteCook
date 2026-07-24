if instance_exists(obj_keyconfig) || instance_exists(obj_windowmodeconfirm)
{
	inputbuffer = 2
	exit;
}

if inputbuffer > 0
{
	inputbuffer--
	exit;
}

// update input

var _back_arr = [-1, 0, 0, 0, 0, 2, 4, 4, 7] //array of indexes to get based on list index
_back_arr[64] = 0
back_ix = _back_arr[list_ix] //get matching back index

if input_check_pressed(INPUTS.ui_back)
{
	fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_back")
	if back_ix <= -1
	{
		instance_destroy()
		if instance_exists(obj_menuhandler)
		{
			with obj_menuhandler
				audio_sound_gain(obj_menuhandler.static_snd, tvs[cur_selected - 1].state == 1 ? 1 : 0)
		}
		exit;
	}
	else
	{
		optionselected = 0
		list_ix = back_ix
		if list_ix == 0
		{
			prev_bg_ix = bg_ix
			bg_ix = 0
			bg_alpha = 1
			bg_spd = 0.1
			optionselected = settingselected
		}
	}
}

cur_list = list_arr[list_ix]

moving = false

var moveh = -input_direction_check_pressed(INPUTS.ui_left) + input_direction_check_pressed(INPUTS.ui_right)
var movev = -input_direction_check_pressed(INPUTS.ui_up) + input_direction_check_pressed(INPUTS.ui_down)

var _prevos = optionselected

optionselected = clamp(optionselected + movev, 0, array_length(cur_list) - 1)

if list_ix = 0 
	settingselected = clamp(settingselected + movev, 0, array_length(cur_list) - 1)

if _prevos != optionselected
	fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_step")

var cur_option = cur_list[optionselected]

switch cur_option.o_type
{
	case types.onoff:
		if input_direction_check_pressed(INPUTS.ui_left) || input_direction_check_pressed(INPUTS.ui_right) || input_check_pressed(INPUTS.ui_confirm)
		{
			cur_option.val = !cur_option.val
			cur_option.func(cur_option.val)
			fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_accept")
		}
		break;
	case types.slider:
		var move = -input_direction_check(INPUTS.ui_left) + input_direction_check(INPUTS.ui_right)
		cur_option.val = clamp(cur_option.val + (0.01 * move), 0, 1)
		if move != 0
		{
			moving = true
			cur_option.func(cur_option.val)
		}
		break;
	case types.func:
		if input_check_pressed(INPUTS.ui_confirm)
		{
			cur_option.func(cur_option.val)
			fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_accept")
		}
		break;
	case types.multichoice:
		var prev_val = cur_option.val[0]
		if input_check_pressed(INPUTS.ui_confirm)
		{
			cur_option.val[0] += 1
			fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_accept")
		}
		if moveh != 0
			fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_step")
		
		cur_option.val[0] = wrap(array_length(cur_option.val[1]), cur_option.val[0] + moveh)
		if prev_val != cur_option.val[0]
			cur_option.func(cur_option.val)
		break;
	case types.change:
		if input_check_pressed(INPUTS.ui_confirm)
		{
			if list_ix == 0 || list_ix == 64 || cur_option.val == 0
			{
				prev_bg_ix = bg_ix
				bg_ix = 0
				bg_alpha = 1
				bg_spd = 0.05
			}
			if list_ix == 0
			{
				bg_ix = optionselected + 1
				array_foreach(cur_list, function(_element, _index) { //resetting their alpha
					_element.iconalpha = 0
				})
			}
			
			list_ix = cur_option.val
			optionselected = 0
			fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_accept")
			if list_ix = 0
				optionselected = settingselected
		}
		break;
}

if list_ix == 1 && movev == 0 && optionselected >= 1 && optionselected <= 3 && moving
{
	if fmod_studio_event_instance_get_playback_state(frog_snd) == FMOD_STUDIO_PLAYBACK_STATE.STOPPED
		fmod_studio_event_instance_start(frog_snd)
	
	var _v = 1 //max volume, for the master volume slider
	
	if optionselected == 2
		_v = global.option_music_volume
	else if optionselected == 3
		_v = global.option_sfx_volume
	
	fmod_studio_event_instance_set_volume(frog_snd, _v)
}
else
	fmod_studio_event_instance_stop(frog_snd, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT)
