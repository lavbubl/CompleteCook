scr_collide()
if (grounded && vsp > 0 && (!instance_exists(blockID)) && (!(place_meeting(x, y, obj_player))))
{
	with (instance_create(x, y, obj_solid))
	{
		visible = false
		sprite_index = other.sprite_index
		mask_index = other.mask_index
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale
		other.blockID = id
	}
}
