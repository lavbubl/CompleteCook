if obj_player.state != states.actor
	global.combo.timer = clamp(approach(global.combo.timer, 0, 0.1), 0, 60)

global.combo.timer = max(global.combo.timer, 0)

if global.combo.timer <= 0
{
	if global.combo.started
		global.combo.wasted = true
	global.combo.count = 0
}

combo_score = ((global.combo.count ^ 2) * 0.25) + (10 * global.combo.count)
