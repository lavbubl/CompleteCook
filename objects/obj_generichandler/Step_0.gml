if obj_player.state != states.actor
	global.combo.timer = approach(global.combo.timer, 0, 0.1)

#macro combo_active global.combo.count > 0

global.combo.timer = max(global.combo.timer, 0)

if global.combo.timer <= 0
	global.combo.count = 0
	
if (array_length(gamepadarr) > 1) {
	for (var i = 0; i < 9; i++) {
		if (keyboard_check_pressed(ord(string(i))) && i < array_length(gamepadarr)) {
			global.maingamepad = gamepadarr[i]
			show_message("Switched to controller " + string(i))
		}
	}
}
if (keyboard_check(vk_backspace)) {
	gamepadarr = []
	var p = 0
	for (var i = 0; i < gamepad_get_device_count(); i++) {
		if (gamepad_is_connected(i)) {
			array_push(gamepadarr, i)
		}
	}
	show_debug_message(gamepadarr)
	if (array_length(gamepadarr) > 0) {
		global.maingamepad = gamepadarr[p]
		show_message("Switched to controller " + string(p))
	}
	else {
		global.maingamepad = 0
		show_message("No controllers found")
	}
}