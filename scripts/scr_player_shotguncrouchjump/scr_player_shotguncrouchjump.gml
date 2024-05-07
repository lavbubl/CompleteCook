function scr_player_shotguncrouchjump()
{
	image_speed = 0.35
	mask_index = spr_crouchmask
	move = (key_left + key_right)
	hsp = (move * movespeed)
	movespeed = 4
	if (move != 0)
		xscale = move
	if (sprite_index == spr_crouchjump && floor(image_index) == (image_number - 1))
		sprite_index = spr_crouchfall
	if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
	{
		vsp /= 2
		jumpstop = 1
	}
	if (scr_solid(x, (y - 1)) && (!jumpstop))
	{
		vsp = grav
		jumpstop = 1
	}
	if grounded
	{
		state = states.shotguncrouch
		sprite_index = spr_shotgungoduck
		image_index = 0
		scr_soundeffect(sfx_step)
	}
	exit;
}

