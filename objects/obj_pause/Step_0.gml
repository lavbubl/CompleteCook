if !pause
	exit;

get_input()

var movev = -uikey_up.pressed + uikey_down.pressed

optionselected = clamp(optionselected + movev, 0, array_length(options) - 1)

var cur_option = options[optionselected]

if ((uikey_left.pressed || uikey_right.pressed || uikey_accept.pressed) && cur_option.o_type == optiontypes.onoff)
{
	cur_option.val = !cur_option.val
	cur_option.func(cur_option.val)
}
else if (cur_option.o_type == optiontypes.slider)
{
	var move = -uikey_left.down + uikey_right.down
	cur_option.val = clamp(cur_option.val + move, 0, 100)
	if move != 0
		cur_option.func(cur_option.val)
}	
