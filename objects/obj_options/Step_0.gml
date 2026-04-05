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

update_input();

var _back_arr = [-1, 0, 0, 0, 0, 2] //array of indexes to get based on list index
_back_arr[64] = 0
back_ix = _back_arr[list_ix] //get matching back index

if ui_input.deny.pressed
{
	scr_sound(sfx_ui_back)
	if back_ix <= -1
	{
		instance_destroy()
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
		}
	}
}

var snd_select = choose(sfx_ui_accept1, sfx_ui_accept2, sfx_ui_accept3)

cur_list = list_arr[list_ix]

moving = false

var moveh = -ui_input.left.pressed + ui_input.right.pressed
var movev = -ui_input.up.pressed + ui_input.down.pressed

var _prevos = optionselected

optionselected = clamp(optionselected + movev, 0, array_length(cur_list) - 1)

if _prevos != optionselected
	scr_sound(sfx_step)

var cur_option = cur_list[optionselected]

switch cur_option.o_type
{
	case types.onoff:
		if ui_input.left.pressed || ui_input.right.pressed || ui_input.accept.pressed
		{
			cur_option.val = !cur_option.val
			cur_option.func(cur_option.val)
			scr_sound(snd_select)
		}
		break;
	case types.slider:
		var move = -ui_input.left.check + ui_input.right.check
		cur_option.val = clamp(cur_option.val + move, 0, 100)
		if move != 0
		{
			moving = true
			cur_option.func(cur_option.val)
		}
		break;
	case types.func:
		if ui_input.accept.pressed
		{
			cur_option.func(cur_option.val)
			scr_sound(snd_select)
		}
		break;
	case types.multichoice:
		var prev_val = cur_option.val[0]
		if ui_input.accept.pressed
		{
			cur_option.val[0] += 1
			scr_sound(snd_select)
		}
		if moveh != 0
			scr_sound(sfx_step)
		
		cur_option.val[0] = wrap(array_length(cur_option.val[1]), cur_option.val[0] + moveh)
		if prev_val != cur_option.val[0]
			cur_option.func(cur_option.val)
		break;
	case types.change:
		if ui_input.accept.pressed
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
			scr_sound(snd_select)
		}
		break;
}

if list_ix == 1 && movev == 0 && optionselected >= 1 && optionselected <= 3 && moving
{
	if snd_frogscream == noone
	{
		snd_frogscream = scr_sound(v_option_frog, true)
		audio_sound_loop_start(snd_frogscream, 0.40)
		audio_sound_loop_end(snd_frogscream, 0.62)
	}
	if optionselected != 1
		audio_sound_gain(snd_frogscream, optionselected == 3 ? global.option_sfx_volume : global.option_music_volume)
}
else
{
	audio_stop_sound(v_option_frog)
	snd_frogscream = noone
}
