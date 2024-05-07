if ((other.hsp != 0 or other.vsp != 0) && instance_exists(baddieID) && baddieID.destroyable)
{
	instance_destroy(baddieID)
	scr_soundeffect(sfx_punch)
	if (!baddieID.important)
	{
		global.style += (5 + global.combo)
		global.combotime = 60
		global.heattime = 60
	}
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
}
