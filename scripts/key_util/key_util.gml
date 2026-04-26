function cc_draw_key(_x, _y, key)
{
	if key == vk_nokey
		return;
	
	var _prevfont = draw_get_font()
	var _prevalign = {h: draw_get_halign(), v: draw_get_valign()}
	var _prevcolor = draw_get_color()
	var _prevalpha = draw_get_alpha()
	
	var _func = cc_draw_keyboard_key
	if global.input_type == INPUT_TYPE.CONTROLLER
		_func = cc_draw_gamepad_key
	
	_func(_x, _y, key, _prevfont, _prevalign, _prevcolor, _prevalpha)
}

function cc_draw_key_arr(_x, _y, _key) //draw a key without needing a check in every draw event
{
	if is_array(_key)
	{
		var _w = sprite_get_width(spr_fontkey)
		_x -= ((array_length(_key) - 1) * _w) / 2
		for (var i = 0; i < array_length(_key); i++)
		{
		    cc_draw_key(_x, _y, _key[i])
			_x += _w
		}
	}
	else
		cc_draw_key(_x, _y, _key)
}

function cc_draw_keyboard_key(_x, _y, key, _prevfont, _prevalign, _prevcolor, _prevalpha)
{
	if is_string(key) //check if its just "#"
		key = ord(key)
	
	var key_str = ""
	var ix = -1
	
	try
		key_str = global.keycodes[0][key]
	catch(_e)
		key_str = "Undefined"
	
	var specialkeys = [ //make sure these comply with scr_keytostring's naming conventions
		"Undefined",
		"Shift",
		"Control",
		"Space",
		"Up",
		"Down",
		"Right",
		"Left",
		"Escape",
		"Backspace",
		"Enter"
	]
	
	for (var i = 0; i < array_length(specialkeys); i++) 
	{
		if key_str == specialkeys[i]
		{
		   ix = i
		   break;
		}
	}
	
	switch _prevalign.h
	{
		case fa_center:
		case fa_middle:
			_x -= sprite_get_width(spr_fontkey) / 2
			break;
		case fa_right:
			_x -= sprite_get_width(spr_fontkey)
			break;
	}
	
	switch _prevalign.v
	{
		case fa_center:
		case fa_middle:
			_y -= sprite_get_height(spr_fontkey) / 2
			break;
		case fa_bottom:
			_y -= sprite_get_height(spr_fontkey)
			break;
	}
	
	if ix == -1
	{
		draw_set_font(global.tutorialfont)
		draw_set_align(fa_center, fa_middle)
		draw_sprite_ext(spr_fontkey, 0, _x, _y, 1, 1, 0, _prevcolor, _prevalpha)
		draw_set_color(c_black)
		draw_text(_x + 16, _y + 18, string_upper(key_str))
		draw_set_font(_prevfont)
		draw_set_align(_prevalign.h, _prevalign.v)
		draw_set_color(_prevcolor)
	}
	else if key_str == " "
		draw_sprite_ext(spr_fontkey, 0, _x, _y, 1, 1, 0, _prevcolor, _prevalpha)
	else
		draw_sprite_ext(spr_fontkey_special, ix, _x, _y, 1, 1, 0, _prevcolor, _prevalpha)
}

function cc_draw_gamepad_key(_x, _y, key, _prevfont, _prevalign, _prevcolor, _prevalpha)
{	
	var key_str = ""
	var ix = -1
	
	try
		key_str = global.keycodes[1][key]
	catch(_e)
		key_str = "Undefined"
		
	show_debug_message(key_str)
	
	var specialkeys = [ //make sure these comply with scr_keytostring's naming conventions
		"Undefined",
		"Face 1",
		"Face 2",
		"Face 3",
		"Face 4",
		"LSldrTgr",
		"RSldrTgr",
		"RSldrBtn",
		"LSldrBtn",
		"LStick",
		"RStick",
		"D-padUp",
		"D-padRight",
		"D-padDown",
		"D-padLeft",
		"Start",
		"Select"
	]
	
	for (var i = 0; i < array_length(specialkeys); i++) 
	{
		if key_str == specialkeys[i]
		{
		   ix = i
		   break;
		}
	}
	
	switch _prevalign.h
	{
		case fa_center:
		case fa_middle:
			_x -= sprite_get_width(spr_fontkey) / 2
			break;
		case fa_right:
			_x -= sprite_get_width(spr_fontkey)
			break;
	}
	
	switch _prevalign.v
	{
		case fa_center:
		case fa_middle:
			_y -= sprite_get_height(spr_fontkey) / 2
			break;
		case fa_bottom:
			_y -= sprite_get_height(spr_fontkey)
			break;
	}
	
	if ix == -1
	{
		draw_set_font(global.tutorialfont)
		draw_set_align(fa_center, fa_middle)
		draw_sprite_ext(spr_fontbutton, 0, _x, _y, 1, 1, 0, _prevcolor, _prevalpha)
		draw_set_color(c_black)
		draw_text(_x + 16, _y + 19, string_upper(key_str))
		draw_set_font(_prevfont)
		draw_set_align(_prevalign.h, _prevalign.v)
		draw_set_color(_prevcolor)
	}
	else if key_str == " "
		draw_sprite_ext(spr_fontbutton, 0, _x, _y, 1, 1, 0, _prevcolor, _prevalpha)
	else
		draw_sprite_ext(spr_fontbutton_special, ix, _x, _y, 1, 1, 0, _prevcolor, _prevalpha)
}
