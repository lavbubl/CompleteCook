function scr_enemy_stun()
{
	if (object_index == obj_ninja)
		attack = 1
	switch global.stylethreshold
	{
		case 0:
			stunned -= 0.5
			break
		case 1:
			stunned -= 0.65
			break
		case 2:
			stunned -= 0.8
			break
		case 3:
			stunned -= 1
	}

	if (stuntouchbuffer > 0)
		stuntouchbuffer--
	var t = thrown
	if (sprite_index != spr_tank_hitwall)
	{
		if (thrown == false)
			sprite_index = stunfallspr
		else
			sprite_index = spr_dead
	}
	else if (floor(image_index) == (image_number - 1) && sprite_index == spr_tank_hitwall)
	{
		state = states.walk
		stunned = 0
		sprite_index = spr_tank_walk
	}
	image_speed = 0.35
	if linethrown
	{
		if thrown
		{
			if (abs(hithsp) > abs(hitvsp))
				hitvsp = 0
			hsp = hithsp
			vsp = hitvsp
			if (hithsp != 0)
				scr_destroy_destructibles(hithsp, 0)
			if (hitvsp != 0)
				scr_destroy_destructibles(0, hitvsp)
			if (hithsp != 0 && hitvsp != 0)
				scr_destroy_destructibles(hithsp, hitvsp)
		}
	}
	if ((grounded or (grounded && (!(place_meeting(x, y, obj_platform))))) && vsp > 0 && (!(place_meeting((x + hsp), y, obj_destructibles))))
	{
		if (thrown == true)
		{
			vsp = -5
			if (((!elite) or elitehit <= 0) && destroyable)
				instance_destroy()
			thrown = false
		}
	}
	if (hitvsp < 0 && place_meeting(x, (y - 1), obj_solid) && (!(place_meeting(x, (y - 1), obj_destructibles))))
	{
		if (thrown == true)
		{
			if (((!elite) or elitehit <= 0) && destroyable)
				instance_destroy()
			thrown = false
		}
	}
	if (hithsp != 0 && place_meeting((x + hithsp), y, obj_solid) && (!(place_meeting((x + hithsp), y, obj_destructibles))))
	{
		if (thrown == true)
		{
			if (((!elite) or elitehit <= 0) && destroyable)
				instance_destroy()
			thrown = false
		}
	}
	if (blur_effect > 0)
		blur_effect--
	else if thrown
	{
		blur_effect = 2
		with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), image_xscale))
			playerid = other.id
	}
	if (t != thrown && t && elite)
	{
		elitehit--
		if (elitehit < 0)
			elitehit = 0
		if (elitehit > 0)
		{
			event_perform(ev_destroy, 0)
			var b = ds_list_find_index(global.baddieroom, id)
			if (b != -1)
				ds_list_delete(global.baddieroom, b)
			image_xscale *= -1
			hsp = (5 * (-image_xscale))
			flash = 0
		}
		else if destroyable
			instance_destroy()
	}
	if (grounded && elite)
		stunned -= 5
	if (stunned <= 0 && grounded)
	{
		vsp = 0
		image_index = 0
		sprite_index = walkspr
		state = states.walk
		stunned = 0
	}
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = (_railinst.movespeed * _railinst.dir)
		if (grounded && (!thrown))
			hsp = railmovespeed
	}
	else
	{
		railmovespeed = Approach(railmovespeed, 0, 0.5)
		if grounded
			hsp = Approach(hsp, 0, 0.3)
	}
	if (!thrown)
		grav = 0.5
	if (abs(hsp) > 4 && grounded)
	{
		if (!instance_exists(dashcloudid))
		{
			with (instance_create(x, y, obj_dashcloud))
			{
				image_xscale = sign(other.hsp)
				other.dashcloudid = id
			}
		}
	}
	exit;
}

