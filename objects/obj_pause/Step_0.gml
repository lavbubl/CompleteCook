if !pause || room == mainmenu
	exit;
else if instance_exists(obj_shell)
{
	if obj_shell.isOpen
		exit;
}

if instance_exists(obj_options)
{
	inputbuffer = 2
	exit;
}
else if inputbuffer > 0
{
	inputbuffer--
	exit;
}

if instance_exists(obj_keyconfig)
	exit;
	
ui_input.up.update(global.keybinds.ui_up);
ui_input.down.update(global.keybinds.ui_down);
ui_input.accept.update(global.keybinds.ui_accept);
ui_input.deny.update(global.keybinds.ui_deny);

var movev = -ui_input.up.pressed + ui_input.down.pressed

optionselected = clamp(optionselected + movev, 0, array_length(options) - 1)

var cur_option = options[optionselected]

if ui_input.accept.pressed && cur_option.o_func != undefined
	cur_option.o_func()
	
if angel_timer > 0
	angel_timer--
else
{
	angel_timer = irandom_range(60, 480)
	instance_create(irandom_range(0, screen_w), screen_h - 100, obj_pause_angel)
}
