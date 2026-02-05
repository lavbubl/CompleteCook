draw_set_font(font)
draw_set_align(fa_center, fa_middle)

var _mode = 0
var _len = string_length(str)
var _w = string_width(str)
var _x = x
var _y = y
var _offset = {}

for (var i = 1; i <= _len;)
{
	_offset = { x: 0, y: 0 }
	switch _mode
	{
		case 1:
			var d = ((i % 2) == 0) ? -1 : 1; //even = -1, odd = 1
			_offset.x = 0
			_offset.y = floor(wave(-1, 1, 0.1, 0)) * d;
			break;
		case 2:
			_offset.x = irandom_range(-2, 2)
			_offset.y = irandom_range(-2, 2)
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
					cc_draw_key(_x + _offset.x, _y + _offset.y, _key_ord[j])
					_x += sprite_get_width(spr_fontkey)
				}
			}
			else
			{
				cc_draw_key(_x + _offset.x, _y + _offset.y, _key_ord)
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
			_x = x
			_y += string_height("S")
			i++
			break;
		default:
			draw_text_colour(_x + _offset.x, _y + _offset.y, _char, image_blend, image_blend, image_blend, image_blend, image_alpha)
			_x += string_width(_char)
			i++
			break;
	}
}

draw_set_align(align.h, align.v)
