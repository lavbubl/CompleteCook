draw_set_font(font)
draw_set_align(align.h, align.v)

var _x = x
var _y = y
var _mode = 0
var _len = string_length(str)
var _keyword_arr = ["[u]", "[l]", "[r]", "[d]", "[f]", "[b]", "[g]", "[m]", "[ds]", "[j]", "[t]", "[gp]", "[sj]", "{n}", "{u}", "{s}", ]
var _formatted_str = str
var _w_formated = 0
var _no_replace = false

for (var i = 0; i < array_length(_keyword_arr); i++)
{
	var _cur_keyword = _keyword_arr[i]
	
	if string_count(_cur_keyword, str) == 0
	{
		_no_replace = true
		continue;
	}
	
	_formatted_str = string_replace_all(_formatted_str, _cur_keyword, string_starts_with(_cur_keyword, "{") ? "" : " ")
}

_w_formated = string_width(_formatted_str)

var _nl = string_pos("\n", str)
if _nl != 0
	_w_formated = string_width(string_copy(str, 1, _nl))

if align.h == fa_right
	_x -= _w_formated
else if align.h == fa_center || align.h == fa_middle
	_x -= _w_formated / 2

var _h = string_height(_formatted_str)

if align.v == fa_bottom
	_y -= _h
else if align.v == fa_center || align.v == fa_middle
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
	var _char = string_char_at(str, i)
	var _keyword = ""
	var _i2 = i + 1
	switch string_ord_at(str, i)
	{
		case ord("["):
			while _i2 < string_length(str) && string_char_at(str, _i2) != "]"
			{
				_keyword += string_char_at(str, _i2)
				_i2++
			}
			var _key_ord = -1
			switch _keyword
			{
				case "u":
					_key_ord = global.keybinds.up
					break;
				case "l":
					_key_ord = global.keybinds.left
					break;
				case "r":
					_key_ord = global.keybinds.right
					break;
				case "d":
					_key_ord = global.keybinds.down
					break;
				case "f":
					_key_ord = dir == 1 ? global.keybinds.right : global.keybinds.left
					break;
				case "b":
					_key_ord = dir == -1 ? global.keybinds.right : global.keybinds.left
					break;
				case "g":
					_key_ord = global.keybinds.grab
					break;
				case "m": //mach
				case "ds": //dash
					_key_ord = global.keybinds.dash
					break;
				case "j":
					_key_ord = global.keybinds.jump
					break;
				/*case "s": unused
					_key_ord = global.keybinds.shoot
					break;*/
				case "t":
					_key_ord = global.keybinds.taunt
					break;
				case "gp":
					_key_ord = global.keybinds.groundpound
					break;
				case "sj":
					_key_ord = global.keybinds.superjump
					break;
			}
			i += string_length(_keyword) + 2
			if is_array(_key_ord)
			{
				for (var j = 0; j < array_length(_key_ord); j++) 
				{
					cc_draw_key(_x + _suboffset.x, _y + _suboffset.y, _key_ord[j])
					_x += sprite_get_width(spr_fontkey)
				}
			}
			else
			{
				cc_draw_key(_x + _suboffset.x, _y + _suboffset.y, _key_ord)
				_x += sprite_get_width(spr_fontkey)
			}
			break;
		case ord("{"):
			while _i2 < string_length(str) && string_char_at(str, _i2) != "}"
			{
				_keyword += string_char_at(str, _i2)
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
			var _end = string_pos(string_delete(str, 1, i), "\n")
			_x = x
			_y += string_height("M")
			if align.h == fa_center || align.h == fa_middle || align.h == fa_right
			{
				for (var j = 0; j < array_length(_keyword_arr); j++)
				{
					var _cur_keyword = _keyword_arr[j]
	
					if _no_replace
						continue;
	
					_formatted_str = string_replace_all(string_copy(str, j, _end - j), _cur_keyword, string_starts_with(_cur_keyword, "{") ? "" : " ")
				}
				_x -= string_width(_formatted_str) * (align.h == fa_right ? 1 : 0.5)
			}
			i++
			break;
		default:
			draw_text_colour(_x + _suboffset.x, _y + _suboffset.y, _char, image_blend, image_blend, image_blend, image_blend, image_alpha)
			_x += string_width(_char)
			i++
			break;
	}
}
