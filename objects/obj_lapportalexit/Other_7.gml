if sprite_index == spr_pizzaportalentrancestart
{
	with obj_player
	{
		state = states.normal
		visible = true
	}
	
	sprite_index = spr_pizzaportal_disappear
}
else if sprite_index == spr_pizzaportal_disappear
{
	instance_destroy()
	instance_create(0, 0, obj_lapflag)
}
