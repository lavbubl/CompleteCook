if obj_player.state != states.actor
	global.combo.timer = clamp(approach(global.combo.timer, 0, 0.1), 0, 60)

#macro combo_active global.combo.count > 0

global.combo.timer = max(global.combo.timer, 0)

if global.combo.timer <= 0
{
	global.combo.count = 0
}

combo_score = ((global.combo.count ^ 2) * 0.25) + (10 * global.combo.count)
