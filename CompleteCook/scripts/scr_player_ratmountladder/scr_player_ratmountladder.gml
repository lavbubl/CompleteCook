function scr_player_ratmountladder()
{
	movespeed = 0
	hsp = 0
	if key_up
	{
		sprite_index = spr_lonegustavo_ladder
		vsp = -6
		image_speed = 0.35
	}
	else if key_down
	{
		sprite_index = spr_lonegustavo_ladderdown
		vsp = 10
		image_speed = -0.35
	}
	else
	{
		sprite_index = spr_lonegustavo_ladder
		vsp = 0
		image_speed = 0
	}
	ladderbuffer = 20
	if ((!(place_meeting(x, y, obj_ladder))) && (!(place_meeting(x, y, obj_stairs))))
	{
		state = states.ratmountjump
		sprite_index = spr_player_ratmountgroundpoundfall
		image_index = 0
		vsp = 0
	}
	if key_jump
	{
		ladderbuffer = 20
		state = states.ratmountjump
		sprite_index = spr_player_ratmountgroundpound
		if key_down
			vsp = 5
		else
			vsp = -9
		image_index = 0
	}
	if (key_down && grounded && (!(place_meeting(x, y, obj_platform))))
	{
		sprite_index = spr_player_ratmountgroundpoundfall
		state = states.ratmountjump
		image_index = 0
	}
	exit;
}

