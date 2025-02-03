global.score += 10
global.combo.timer += 20
if (global.combo.timer > 60)
	global.combo.timer = 60
instance_destroy()
ds_list_add(global.saveroom, self.id)