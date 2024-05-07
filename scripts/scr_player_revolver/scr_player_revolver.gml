function scr_player_revolver()
{
	hsp = (xscale * movespeed)
	landAnim = 0
	if grounded
	{
		if (movespeed > 0)
			movespeed -= 0.1
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_revolverstart)
		sprite_index = spr_playerV_revolverhold
	if ((sprite_index == spr_playerV_revolverhold or sprite_index == spr_playerV_airrevolverstart or sprite_index == spr_playerV_revolverstart) && (!key_slap))
	{
		if grounded
			sprite_index = spr_playerV_revolvershoot
		else
			sprite_index = spr_playerV_airrevolver
		image_index = 0
		with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
		{
			is_solid = 0
			image_xscale = other.xscale
		}
		scr_soundeffect(sfx_killingblow)
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_revolvershoot)
	{
		image_index = 0
		state = states.normal
		sprite_index = spr_playerV_revolverend
		movespeed = 2
	}
	if ((sprite_index == spr_playerV_airrevolverend or sprite_index == spr_playerV_airrevolver or sprite_index == spr_playerV_airrevolverstart) && grounded)
	{
		if (key_attack && movespeed >= 6)
			state = states.mach2
		else
			state = states.normal
	}
	if (sprite_index == spr_playerV_revolverhold or sprite_index == spr_playerV_revolverstart)
	{
		if (key_down && grounded && global.attackstyle != 2)
		{
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale
			movespeed = 12
			crouchslipbuffer = 25
			grav = 0.5
			sprite_index = spr_crouchslip
			image_index = 0
			machhitAnim = 0
			state = states.tumble
		}
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_airrevolver)
	{
		if (key_attack && movespeed >= 6)
			state = states.mach2
		else
		{
			image_index = 0
			sprite_index = spr_playerV_airrevolverend
			state = states.jump
		}
	}
	image_speed = 0.4
	exit;
}

