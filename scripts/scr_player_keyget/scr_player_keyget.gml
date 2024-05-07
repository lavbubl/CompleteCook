function scr_player_keyget()
{
	hsp = 0
	vsp = 0
	image_speed = 0.35
	movespeed = 0
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	machhitAnim = 0
	sprite_index = spr_keyget
	if (!keysound && floor(image_index) >= 16)
	{
		keysound = true
		scr_soundeffectpitched(choose(sfx_pepvoice6, sfx_pepvoice3, sfx_pepvoice5), 0.9, 1.1)
	}
	if (floor(image_index) == (image_number - 1))
	{
		instance_create(x, y, obj_keyfollow)
		global.keyget = 0
		state = states.normal
		image_index = 0
	}
	exit;
}

