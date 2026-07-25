fmod_studio_bus_set_volume(pause_bus_music, global.option_music_volume)
fmod_studio_bus_set_volume(pause_bus_sfx, global.option_sfx_volume)

if !pause || room == mainmenu || instance_exists(obj_titlecard)
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

var movev = -input_direction_check_pressed(INPUTS.ui_up) + input_direction_check_pressed(INPUTS.ui_down)

if movev != 0
{
	fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_step")
	fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_pausemove")
}

optionselected = wrap(array_length(options), optionselected + movev)

var cur_option = options[optionselected]

if input_check_pressed(INPUTS.ui_confirm) && cur_option.o_func != undefined
	cur_option.o_func()
	
if angel_timer > 0
	angel_timer--
else
{
	angel_timer = irandom_range(60, 480)
	instance_create(irandom_range(0, SCREEN_WIDTH), SCREEN_HEIGHT - 100, obj_pause_angel)
}
