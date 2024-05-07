function scr_player_stunned()
{
	hsp = 0
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
	movespeed = 0
	turning = 0
	hurted = 1
	turning = 0
	alarm[5] = 2
	alarm[7] = 60
	image_speed = 0.35
	if (floor(image_index) == (image_number - 1))
	{
		mask_index = spr_player_mask
		state = states.normal
		sprite_index = spr_idle
		image_index = 0
	}
	exit;
}

