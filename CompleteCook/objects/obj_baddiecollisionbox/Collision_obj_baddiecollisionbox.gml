if (instance_exists(baddieID) && instance_exists(other.baddieID) && baddieID.thrown != 1 && (!other.baddieID.mach3destroy) && baddieID.state != states.hit && other.baddieID.thrown == true && other.baddieID.state != states.hit && baddieID.killbyenemy && baddieID != other.id && baddieID.state != states.grabbed && (!baddieID.invincible) && baddieID.instantkillable && ((global.attackstyle != 2 && (!global.kungfu)) or baddieID.hp <= 0) && (!global.kungfu))
{
	scr_soundeffect(sfx_punch)
	if (!baddieID.important)
	{
		global.style += (5 + global.combo)
		global.combotime = 60
		global.heattime = 60
	}
	var lag = 5
	if (baddieID.object_index != obj_tank or baddieID.hp <= 0)
	{
		baddieID.hitLag = lag
		baddieID.hitX = baddieID.x
		baddieID.hitY = baddieID.y
		if (baddieID.object_index != obj_tank or baddieID.hp <= 0)
			baddieID.hp -= 1
		instance_create(baddieID.x, baddieID.y, obj_parryeffect)
		baddieID.alarm[3] = 3
		baddieID.state = states.hit
		baddieID.image_xscale = other.baddieID.image_xscale
		instance_create(x, y, obj_slapstar)
		instance_create(x, y, obj_slapstar)
		instance_create(x, y, obj_slapstar)
		instance_create(x, y, obj_baddiegibs)
		instance_create(x, y, obj_baddiegibs)
		instance_create(x, y, obj_baddiegibs)
		with (obj_camera)
		{
			shake_mag = 3
			shake_mag_acc = (3 / room_speed)
		}
		baddieID.hitvsp = -8
		baddieID.hithsp = ((-other.baddieID.image_xscale) * 15)
		if (baddieID.destroyable && ((!baddieID.elite) or baddieID.elitehit <= 0))
			instance_destroy(baddieID)
	}
}
