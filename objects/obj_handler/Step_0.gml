if obj_player.state != states.actor
	global.combo.timer = approach(global.combo.timer, 0, 0.1)

#macro combo_active global.combo.count > 0

if global.combo.timer <= 0
	global.combo.count = 0
