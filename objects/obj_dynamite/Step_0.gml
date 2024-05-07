hsp = (image_xscale * movespeed)
mask_index = spr_player_mask
if (scr_solid(x, (y + 1)) && vsp > 0)
{
	vsp = -5
	if (movespeed > 0)
		movespeed -= 1
}
if (obj_explosion != obj_dynamiteexplosion_boss && obj_explosion != obj_canonexplosion && playerid.key_shoot2 && playerid.state != states.dynamite)
{
	instance_destroy()
	instance_create(x, y, obj_explosion)
}
if (place_meeting((x + hsp), y, obj_solid) or place_meeting((x + hsp), (y + vsp), obj_destructibles) or (obj_explosion != obj_canonexplosion && place_meeting(x, y, obj_baddie)))
	image_xscale *= -1
if (place_meeting((x + hsp), (y + vsp), obj_destructibles) or place_meeting((x + hsp), (y + vsp), obj_metalblock) or place_meeting((x + hsp), (y + vsp), obj_ratblock) or (obj_explosion != obj_canonexplosion && place_meeting(x, y, obj_baddie)))
{
	instance_destroy()
	instance_create(x, y, obj_explosion)
}
if (countdown <= 0)
{
	instance_destroy()
	instance_create(x, y, obj_explosion)
}
if (sprite_index == spr_dynamite && countdown < 60)
	sprite_index = spr_dynamiteabouttoexplode
if (sprite_index == spr_dynamite or sprite_index == spr_dynamiteabouttoexplode)
	countdown--
scr_collide()
