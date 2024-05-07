function scr_player_ratmountattack()
{
	image_speed = 0.35
	hsp = (xscale * movespeed)
	vsp = 0
	move = (key_left + key_right)
	landAnim = 0
	if (movespeed < 10 && grounded)
		movespeed += 0.5
	else if (!grounded)
		movespeed = 10
	if (key_jump && (!doublejump))
	{
		doublejump = 1
		vsp = -11
		state = states.ratmountjump
		jumpstop = 0
		sprite_index = spr_player_ratmountwalljump
	}
	if (floor(image_index) == (image_number - 1))
		state = states.ratmount
	if (scr_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + xscale), y, obj_destructibles))))
		ledge_bump((vsp >= 0 ? 32 : 22))
	exit;
}

