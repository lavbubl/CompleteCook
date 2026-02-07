global.score = max(0, global.score)
shake_mag = max(shake_mag - 0.5, 0)

visible = hud_get_visible()

var y_goto = 90
if (obj_player.x < 250 && obj_player.y < 175)
	y_goto = -500

display_y = approach(display_y, y_goto, 25)

x = 121 + irandom_range(shake_mag, -shake_mag)
y = display_y + irandom_range(shake_mag, -shake_mag)
