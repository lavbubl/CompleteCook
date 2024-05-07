with (other)
{
	if shotgunAnim
	{
		shotgunAnim = 0
		with (instance_create(x, y, obj_sausageman_dead))
			sprite_index = spr_shotgunback
	}
}
