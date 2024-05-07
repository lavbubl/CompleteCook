function scr_player_ratmounthurt()
{
	hsp = ((-xscale) * movespeed)
	landAnim = 0
	jumpAnim = 0
	hurted = 1
	if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting(x, (y + sign(hsp)), obj_slope))))
		movespeed = 0
	alarm[5] = 2
	alarm[7] = 20
	if (grounded && vsp > 0)
	{
		state = states.ratmount
		movespeed = 0
	}
	if brick
		sprite_index = spr_player_ratmounthurt
	else
		sprite_index = spr_lonegustavo_hurt
	image_speed = 0.35
}
