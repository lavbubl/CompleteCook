function cutscene_move_player(argument0, argument1, argument2, argument3)
{
	var player = argument0
	var x_to = argument1
	var max_hsp = argument2
	var threshold = argument3
	var finish = 0
	with (player)
	{
		sprite_index = spr_move
		image_speed = 0.6
		if (x < (x_to - threshold))
		{
			xscale = 1
			if (hsp < max_hsp)
				hsp += 0.5
			else
				hsp = max_hsp
		}
		else if (x > (x_to + threshold))
		{
			xscale = -1
			if (hsp > (-max_hsp))
				hsp -= 0.5
			else
				hsp = (-max_hsp)
		}
		else
		{
			hsp = 0
			finish = 1
		}
		if place_meeting((x + hsp), y, obj_solid)
			finish = 1
	}
	if finish
		cutscene_end_action()
	with (player)
	{
		if (move != 0 && (floor(image_index) == 3 or floor(image_index) == 8) && steppy == 0 && character != "V")
		{
			instance_create(x, (y + 43), obj_cloudeffect)
			steppy = 1
		}
		if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
			steppy = 0
	}
	exit;
}

