if (other.object_index == obj_player1)
	global.collect += 25
else
	global.collectN += 25
global.heattime += 25
global.heattime = clamp(global.heattime, 0, 60)
with (obj_camera)
	healthshaketime = 40
with (instance_create((x + 16), y, obj_smallnumber))
	number = string(25)
if audio_is_playing(sfx_collecttopping)
	audio_stop_sound(sfx_collecttopping)
scr_soundeffect(sfx_collecttopping)
instance_destroy()
