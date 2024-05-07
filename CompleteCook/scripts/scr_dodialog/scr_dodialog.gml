function do_dialog(argument0)
{
	with (instance_create(x, y, obj_dialogcontroller))
	{
		npcID = other.id
		dialog = argument0
		dialogsprite = dialog[0][1]
		currenttext = scr_calculate_text(dialog[0][0])
		dialogheight = scr_calculate_height(currenttext)
	}
	with (obj_player)
	{
		if (state == states.ghostpossess)
		{
			visible = true
			with (possessID)
			{
				state = states.stun
				stunned = 50
			}
		}
		sprite_index = spr_idle
		image_speed = 0.35
		state = states.actor
		hsp = 0
		vsp = 0
		movespeed = 0
	}
	exit;
}

function npc_do_dialog()
{
	do_dialog(dialog)
	exit;
}

function vigilante_add_battle()
{
	if (global.vigilantecutscene1 == -4 or (!global.vigilantecutscene1))
	{
		global.vigilantecutscene1 = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "vigilante1", 1)
	}
	exit;
}

function do_dialog_cutscene(argument0, argument1, argument2)
{
	if (argument1 == undefined)
		argument1 = 0
	if (argument2 == undefined)
		argument2 = 0
	with (instance_create(argument1, argument2, obj_cutscene_handler))
	{
		scene_info = argument0
		for (var i = 0; i < array_length(scene_info); i++)
			scene_info[i][0] = method(id, scene_info[i][0])
	}
	exit;
}

