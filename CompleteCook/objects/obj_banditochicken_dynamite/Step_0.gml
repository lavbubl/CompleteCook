hsp = (image_xscale * movespeed)
mask_index = spr_player_mask
if (scr_solid(x, (y + 1)) && vsp > 0)
{
	vsp = -5
	if (movespeed > 0)
		movespeed -= 1
}
if (place_meeting((x + hsp), y, obj_solid) or place_meeting((x + hsp), (y + vsp), obj_destructibles) or place_meeting(x, y, obj_baddie))
	image_xscale *= -1
if place_meeting(x, y, obj_player)
	instance_destroy()
if (countdown <= 0)
	instance_destroy()
if (sprite_index == spr_dynamite && countdown < 60)
	sprite_index = spr_dynamiteabouttoexplode
if (countdown > 0)
	countdown--
scr_collide()
