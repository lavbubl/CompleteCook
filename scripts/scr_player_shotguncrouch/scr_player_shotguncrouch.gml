function scr_player_shotguncrouch()
{
	image_speed = 0.35
	mask_index = spr_crouchmask
	move = (key_left + key_right)
	hsp = (move * movespeed)
	movespeed = 4
	if (move != 0)
		xscale = move
	if key_jump
		input_buffer_jump = 0
	if (sprite_index != spr_shotgungoduck)
	{
		if (move != 0)
			sprite_index = spr_shotguncrawl
		else
			sprite_index = spr_shotgunduck
	}
	else if (floor(image_index) == (image_number - 1))
		sprite_index = spr_shotgunduck
	if ((!grounded) && input_buffer_jump >= 8)
	{
		state = states.shotguncrouchjump
		movespeed = 0
		sprite_index = spr_crouchfall
		image_index = 0
	}
	if (grounded && input_buffer_jump < 8)
	{
		input_buffer_jump = 8
		sprite_index = spr_crouchjump
		image_index = 0
		state = states.shotguncrouchjump
		vsp = -8
	}
	if (grounded && vsp > 0 && (!key_down) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
	{
		state = states.shotgun
		landAnim = 1
		sprite_index = spr_shotgunland
		image_index = 0
	}
	if key_slap2
	{
		state = states.shotgunshoot
		sprite_index = spr_shotgunshoot
		image_index = 0
		with (instance_create(x, y, obj_pistoleffect))
			image_xscale = other.xscale
		with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
		{
			image_xscale = other.xscale
			shotgun = 1
		}
		with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
		{
			image_xscale = other.xscale
			spdh = 4
			shotgun = 1
		}
		with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
		{
			image_xscale = other.xscale
			spdh = -4
			shotgun = 1
		}
	}
}
