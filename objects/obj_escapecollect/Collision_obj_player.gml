if (room == rm_editor)
	exit;
if (image_alpha == 1)
{
	if (other.state != states.gotoplayer)
	{
		if audio_is_playing(sfx_collecttopping)
			audio_stop_sound(sfx_collecttopping)
		scr_soundeffect(sfx_collecttopping)
		global.heattime += 10
		global.heattime = clamp(global.heattime, 0, 60)
		global.combotime += 10
		global.combotime = clamp(global.combotime, 0, 60)
		with (obj_camera)
			healthshaketime = 30
		var val = heat_calculate(10)
		if (other.object_index == obj_player1)
			global.collect += val
		else
			global.collectN += val
		create_collect(x, y, sprite_index, val)
		with (instance_create((x + 16), y, obj_smallnumber))
			number = string(val)
		instance_destroy()
	}
}
