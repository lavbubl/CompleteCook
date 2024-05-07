sprite_index = spr_canongoblin_walk
scene_info = [[cutscene_do_dialog, [dialog_create("Lets blow this thing then")]], [cutscene_waitfor_dialog], [cutscene_set_player_actor], [cutscene_wait, 20], [function()
{
	anarchist = 128596
	with (anarchist)
	{
		with (instance_create(x, y, obj_pizzagoblinbomb))
		{
			defused = 1
			state = states.normal
			movespeed = 7
			vsp = -8
		}
	}
	cutscene_end_action()
	exit;
}
], [function()
{
	if (!instance_exists(obj_pizzagoblinbomb))
		cutscene_end_action()
	exit;
}
], [cutscene_wait, 10], [cutscene_do_dialog, [dialog_create("Let's go fella", -4, function()
{
	global.anarchistcutscene2 = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "anarchist2", 1)
	exit;
}
)]], [cutscene_waitfor_dialog], [cutscene_set_player_actor], [function()
{
	with (anarchist)
	{
		x += 8
		if (x >= room_width)
		{
			instance_destroy()
			with (other)
				cutscene_end_action()
		}
	}
	exit;
}
], [cutscene_set_player_normal]]
dialog_func = function()
{
	do_dialog_cutscene(scene_info)
	exit;
}

if (global.anarchistcutscene1 == -4)
	global.anarchistcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "anarchist1", 0)
if (!global.anarchistcutscene1)
	instance_destroy()
if (global.anarchistcutscene2 == -4)
	global.anarchistcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "anarchist2", 0)
if global.anarchistcutscene2
	instance_destroy()
