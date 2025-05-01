global.score = max(0, global.score)
shake_mag = max(shake_mag - 0.5, 0)

visible = true

if (string_starts_with(room_get_name(room), "tower") || room == rank_room || room == rm_timesup || room == mainmenu)
	visible = false

if global.boss_room
	visible = false

x = 121 + irandom_range(shake_mag, -shake_mag)
y = 90 + irandom_range(shake_mag, -shake_mag)
