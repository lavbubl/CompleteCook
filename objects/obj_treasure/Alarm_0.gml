obj_player.state = states.normal
global.score += 3000
with instance_create(x, y, obj_collect_number)
	num = 3000
	
global.combo.timer = 60
global.level_data.treasure = true

if obj_music.mu != noone
	audio_sound_gain(obj_music.mu, 1, 250)
	
if obj_music.panic_mu != noone
	audio_sound_gain(obj_music.panic_mu, 1, 250)
	
instance_destroy()