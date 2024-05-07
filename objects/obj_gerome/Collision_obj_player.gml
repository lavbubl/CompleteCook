ds_list_add(global.saveroom, id)
global.gerome = true
scr_soundeffect(sfx_geromegot)
global.combotime = 60
instance_create(x, y, obj_baddietaunteffect)
instance_create(x, y, obj_geromefollow)
instance_destroy()
