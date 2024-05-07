if (vsp > 0)
{
	var val = heat_calculate(10)
	if (other.object_index == obj_player1)
		global.collect += val
	else
		global.collectN += val
	global.combotime += 10
	global.combotime = clamp(global.combotime, 0, 60)
	with (obj_camera)
		healthshaketime = 40
	with (instance_create((x + 16), y, obj_smallnumber))
		number = string(val)
	if audio_is_playing(sfx_collecttopping)
		audio_stop_sound(sfx_collecttopping)
	scr_soundeffect(sfx_collecttopping)
	instance_destroy()
}
