if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create(x, y, obj_sausageman_dead))
	{
		image_xscale = other.image_xscale
		sprite_index = other.spr_dead
	}
	scr_soundeffect(sfx_killenemy)
	var x1 = ((x - sprite_xoffset) + (sprite_width / 2))
	var y1 = ((y - sprite_yoffset) + (sprite_height / 2))
	global.combo += 1
	global.combotime = 60
	repeat (3)
	{
		with (create_debris(x1, y1, spr_slapstar))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
		}
	}
	var combototal = (10 + round((10 * (global.combo * 0.5))))
	global.collect += combototal
	global.comboscore += combototal
	instance_create(x1, y1, obj_bangeffect)
	with (obj_camera)
	{
		shake_mag = 3
		shake_mag_acc = (3 / room_speed)
	}
	with (obj_player1)
		supercharge += 1
	ds_list_add(global.saveroom, id)
}
