global.cc_text_direction = 1

function cc_draw_text(_x, _y, _string)
{
	var _prev_halign = draw_get_halign()
	var _prev_valign = draw_get_valign()
	var _mode = 0
	var _len = string_length(_string)
	var _keyword_arr = ["[u]", "[l]", "[r]", "[d]", "[f]", "[b]", "[g]", "[m]", "[ds]", "[j]", "[t]", "[gp]", "[sj]", "[y]", "[c]", "[x]", "{n}", "{u}", "{s}"]
	var _formatted_str = _string
	var _w_formated = 0
	var _w_extra = 0
	
	var _nl = string_pos("\n", _string)
	if _nl != 0
		_formatted_str = string_copy(_string, 1, _nl)
	
	for (var i = 0; i < array_length(_keyword_arr); i++)
	{
		var _cur_keyword = _keyword_arr[i]
		
		var _count = string_count(_cur_keyword, _formatted_str)
		
		if _count == 0
			continue;
		
		if string_starts_with(_cur_keyword, "[")
			_w_extra += sprite_get_width(spr_fontkey) * _count
		
		_formatted_str = string_replace_all(_formatted_str, _cur_keyword, "")
	}
	
	_w_formated = string_width(_formatted_str) + _w_extra
	
	var _og_x = _x
	
	if _prev_halign == fa_right
		_x -= _w_formated
	else if _prev_halign == fa_center || _prev_halign == fa_middle
		_x -= _w_formated / 2
	
	var _h = string_height(_string)
	
	if _prev_valign == fa_bottom
		_y -= _h
	else if _prev_valign == fa_center || _prev_valign == fa_middle
		_y -= _h / 2
	
	var _suboffset = {}
	
	draw_set_align(fa_left, fa_top)
	
	for (i = 1; i <= _len;)
	{
		_suboffset = { x: 0, y: 0 }
		
		switch _mode
		{
			case 1:
				var d = ((i % 2) == 0) ? -1 : 1; //even = -1, odd = 1
				_suboffset.x = 0
				_suboffset.y = floor(wave(-1, 1, 0.1, 0)) * d;
				break;
			case 2:
				_suboffset.x = irandom_range(-2, 2)
				_suboffset.y = irandom_range(-2, 2)
				break;
		}
		
		var _char = string_char_at(_string, i)
		var _keyword = ""
		var _i2 = i + 1
		
		switch string_ord_at(_string, i)
		{
			case ord("["):
				while _i2 < string_length(_string) && string_char_at(_string, _i2) != "]"
				{
					_keyword += string_char_at(_string, _i2)
					_i2++
				}
				
				var _key_ord = -1
				switch _keyword
				{
					case "u":
						_key_ord = input_get_bind(INPUTS.up)
						break;
					case "l":
						_key_ord = input_get_bind(INPUTS.left)
						break;
					case "r":
						_key_ord = input_get_bind(INPUTS.right)
						break;
					case "d":
						_key_ord = input_get_bind(INPUTS.down)
						break;
					case "f":
						_key_ord = global.cc_text_direction == 1 ? input_get_bind(INPUTS.right) : input_get_bind(INPUTS.left)
						break;
					case "b":
						_key_ord = global.cc_text_direction == -1 ? input_get_bind(INPUTS.right) : input_get_bind(INPUTS.left)
						break;
					case "g":
						_key_ord = input_get_bind(INPUTS.grab)
						break;
					case "m": //mach
					case "ds": //dash
						_key_ord = input_get_bind(INPUTS.dash)
						break;
					case "j":
						_key_ord = input_get_bind(INPUTS.jump)
						break;
					/*case "s": unused
						_key_ord = input_get_bind(INPUTS.shoot
						break;*/
					case "t":
						_key_ord = input_get_bind(INPUTS.taunt)
						break;
					case "gp":
						_key_ord = input_get_bind(INPUTS.groundpound)
						break;
					case "sj":
						_key_ord = input_get_bind(INPUTS.superjump)
						break;
					case "y":
						_key_ord = input_get_bind(INPUTS.bind_reset)
						break;
					case "c":
						_key_ord = input_get_bind(INPUTS.ui_confirm)
						break;
					case "x":
						_key_ord = input_get_bind(INPUTS.ui_delete)
						break;
				}
				
				i += string_length(_keyword) + 2
				
				cc_draw_key(_x + _suboffset.x, _y + _suboffset.y, _key_ord[0])
				_x += sprite_get_width(spr_fontkey)
				break;
			case ord("{"):
				while _i2 < string_length(_string) && string_char_at(_string, _i2) != "}"
				{
					_keyword += string_char_at(_string, _i2)
					_i2++
				}
				switch _keyword
				{
					case "n": //normal/none
						_mode = 0
						break;
					case "u": //updown
						_mode = 1
						break;
					case "s": //shake
						_mode = 2
						break;
				}
				i += string_length(_keyword) + 2
				break;
			case ord("\n"):
				_x = _og_x
				_y += string_height("M")
				
				if _prev_halign == fa_center || _prev_halign == fa_middle || _prev_halign == fa_right
				{
					var _end = string_pos_ext("\n", _string, i + 1)
					
					if _end == 0
						_end = _len + 1
					
					_w_extra = 0
					_formatted_str = string_copy(_string, i + 1, _end - i - 1)
					
					for (var j = 0; j < array_length(_keyword_arr); j++)
					{
						var _cur_keyword = _keyword_arr[j]
						
						var _count = string_count(_cur_keyword, _formatted_str)
						
						if _count == 0
							continue;
						
						if string_starts_with(_cur_keyword, "[")
							_w_extra += sprite_get_width(spr_fontkey) * _count
						
						_formatted_str = string_replace_all(_formatted_str, _cur_keyword, "")
					}
					
					_x -= (string_width(_formatted_str) + _w_extra) * (_prev_halign == fa_right ? 1 : 0.5)
				}
				
				i++
				break;
			default:
				draw_text(_x + _suboffset.x, _y + _suboffset.y, _char)
				_x += string_width(_char)
				i++
				break;
		}
	}
	
	draw_set_align(_prev_halign, _prev_valign)
}

/// @function                cc_text_insert_values(_string, _val)
/// @description             Replace "%" in strings with the value(s) in _val.
/// @param {String}          _string    The string to modify.
/// @param {Any}			 _val		Value(s) of any type. When using multiple values, use an array.
/// @return {String}

function cc_text_insert_values(_string, _val)
{
	var _new_string = ""
	var _string_to_add = ""
	var _i = 1
	var _j = 0
	
	while _i <= string_length(_string)
	{
		show_debug_message(_i)
		_string_to_add = string_char_at(_string, _i)
		
		if string_ord_at(_string, _i) == ord("%")
		{
			if is_array(_val)
			{
				_string_to_add = string(_val[_j])
				_j++
			}
			else
				_string_to_add = string(_val)
		}
		
		_new_string = string_join("", _new_string, _string_to_add)
		
		_i++
	}
	
	return _new_string;
}
