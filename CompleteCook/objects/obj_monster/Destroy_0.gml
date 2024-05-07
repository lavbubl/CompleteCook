if destroy
{
	repeat (3)
	{
		with (create_debris(x, y, spr_slapstar))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
		}
	}
	scr_soundeffect(sfx_killenemy)
	instance_create(x, y, obj_bangeffect)
	with (obj_camera)
	{
		shake_mag = 3
		shake_mag_acc = (3 / room_speed)
	}
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = other.spr_dead
}
