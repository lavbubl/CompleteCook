function scr_player_hurt()
{
	if (sprite_index == spr_hurtjump)
		hsp = (xscale * movespeed)
	if (sprite_index == spr_hurt)
		hsp = ((-xscale) * movespeed)
	freefallsmash = 0
	combo = 0
	mach2 = 0
	bounce = 0
	jumpAnim = 1
	dashAnim = 1
	if grounded
		landAnim = 0
	else
		landAnim = 1
	jumpstop = 0
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	hit_connected = 0
	hurted = 1
	turning = 0
	skateboarding = 0
	alarm[5] = 2
	alarm[7] = 80
	if (grounded && vsp > 0)
	{
		movespeed = 0
		state = states.normal
	}
	if scr_solid((x + hsp), y)
		movespeed = 0
	image_speed = 0.35
	exit;
}

