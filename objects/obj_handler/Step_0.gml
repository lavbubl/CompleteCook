global.combo.timer = approach(global.combo.timer, 0, 0.1)

#macro combo_active global.combo.timer > 0

if global.combo.timer <= 0
	global.combo.count = 0
