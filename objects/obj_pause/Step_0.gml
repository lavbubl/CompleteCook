if !pause
	exit;

if instance_exists(obj_keyconfig)
	exit;

// update input
ui_input.left.update([global.keybinds.ui_left]);
ui_input.right.update([global.keybinds.ui_right]);
ui_input.up.update([global.keybinds.ui_up]);
ui_input.down.update([global.keybinds.ui_down]);
ui_input.accept.update([global.keybinds.ui_accept]);
ui_input.deny.update([global.keybinds.ui_deny]);

var movev = -ui_input.up.pressed + ui_input.down.pressed

optionselected = clamp(optionselected + movev, 0, array_length(options) - 1)

var cur_option = options[optionselected]

if ((ui_input.left.pressed || ui_input.right.pressed || ui_input.accept.pressed) && cur_option.o_type == optiontypes.onoff)
{
	cur_option.val = !cur_option.val
	cur_option.func(cur_option.val)
}
else if (cur_option.o_type == optiontypes.slider)
{
	var move = -ui_input.left.check + ui_input.right.down
	cur_option.val = clamp(cur_option.val + move, 0, 100)
	if move != 0
		cur_option.func(cur_option.val)
}	
else if (cur_option.o_type == optiontypes.input)
{
	if ui_input.accept.pressed && inputbuffer <= 0
		cur_option.func()
}	

inputbuffer = max(inputbuffer - 1, 0)

//MAKE SWITCH STATEMENT