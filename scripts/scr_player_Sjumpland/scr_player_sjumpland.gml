function scr_player_Sjumpland()
{
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	movespeed = 0
	start_running = 1
	alarm[4] = 14
	vsp = 0
	hsp = 0
	if (floor(image_index) == 6)
	{
		sprite_index = spr_machfreefall
		state = states.jump
		jumpAnim = 0
	}
	exit;
}

