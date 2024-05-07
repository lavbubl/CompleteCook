if instance_exists(baddieID)
{
	scr_soundeffect(sfx_killenemy)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_bangeffect)
	instance_destroy(baddieID)
	instance_destroy()
}
