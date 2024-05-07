prevpillar_on_camera = pillar_on_camera
if instance_exists(obj_hungrypillar)
{
	var p = 0
	with (obj_hungrypillar)
	{
		if bbox_in_camera(view_camera[0], 0)
			p = 1
	}
	if (p != pillar_on_camera)
		pillar_on_camera = p
}
else
	pillar_on_camera = 0
if (prevpillar_on_camera != pillar_on_camera)
{
	if pillar_on_camera
	{
		audio_sound_gain(pillarmusicID, (0.6 * global.option_music_volume), 2000)
		audio_sound_gain(musicID, 0, 2000)
	}
	else
	{
		audio_sound_gain(pillarmusicID, 0, 2000)
		audio_sound_gain(musicID, (0.6 * global.option_music_volume), 2000)
	}
}
if global.panic
{
	if (music != mu_pizzatime && music != mu_finalescape && !global.lap)
	{
		music = mu_pizzatime
		audio_stop_sound(musicID)
		musicID = scr_music(music)
		if (pillarmusicID != -4)
			audio_stop_sound(pillarmusicID)
		pillarmusicID = -4
	}
	else if (music != mu_chase && global.lap)
	{
		music = mu_chase
		audio_sound_gain(musicID, 0, 2000)
		if (audio_sound_get_gain(mu_pizzatime) <= 0)
		{
			audio_stop_sound(mu_pizzatime)
		}
		musicID = scr_music(music)
	}
}
