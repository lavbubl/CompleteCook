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

// update input
update_input();

var movev = -ui_input.up.pressed + ui_input.down.pressed

if movev != 0
{
	var _p = 0.26
	scr_sound(sfx_step)
	scr_sound_pitched(sfx_ui_pausemove, 1 - _p, 1 + _p)
}

optionselected = wrap(array_length(options), optionselected + movev)

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
