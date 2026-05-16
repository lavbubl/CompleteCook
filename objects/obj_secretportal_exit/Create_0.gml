sprite_index = spr_secretportal_spawn
image_speed = 0.35
state = 0
global.level_data.secret_count++

var _str = $"{global.level_data.secret_count} secret"

if global.level_data.secret_count != 1
	_str += "s" //add an S
	
do_tip($"\{u}You have found {_str} out of 3!")