image_speed = 0.5
alarm[0] = 700
alarm[2] = 400
depth = -8
var mins = global.level_minutes
if (mins < 10)
	mins = concat("0", mins)
else
	mins = concat(mins)
var secs = floor(global.level_seconds)
if (secs < 10)
	secs = concat("0", secs)
else
	secs = concat(secs)
text = [
	[false, concat("HIGHSCORE: ", global.collect)], 
	[false, concat("TIME: ", mins, ":", secs, ".", floor(frac(global.level_seconds) * 100))], 
	[false, concat("DAMAGE: ", global.player_damage)], 
	[false, concat("HIGHEST COMBO: ", global.highest_combo)]
]
text_pos = 0
brown = false
brownfade = 0
