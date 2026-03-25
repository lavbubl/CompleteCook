fmod_studio_bus_set_volume(pause_bus_music, global.option_music_volume)
fmod_studio_bus_set_volume(pause_bus_sfx, global.option_sfx_volume)

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

ui_input.up.update(global.keybinds.ui_up);
ui_input.down.update(global.keybinds.ui_down);
ui_input.accept.update(global.keybinds.ui_accept);
ui_input.deny.update(global.keybinds.ui_deny);

var movev = -ui_input.up.pressed + ui_input.down.pressed

if movev != 0
{
	fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_step")
	fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_pausemove")
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
