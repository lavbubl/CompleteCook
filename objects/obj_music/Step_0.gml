if (prevmu != -1 && audio_sound_get_gain(prevmu) <= 0)
{
	audio_stop_sound(prevmu)
	prevmu = -1
}

if (mu != -1 && audio_sound_get_gain(mu) <= 0 && global.panic)
{
	audio_stop_sound(mu)
	mu = -1
}

var pillar_visible = false

with obj_pillar
{
	if bbox_in_camera()
	{
		pillar_visible = true
	}
}

if !global.panic
{
	if pillar_visible
	{
		audio_sound_gain(mu, 0, 1000)
		if (pillar_mu != -1)
			audio_sound_gain(pillar_mu, 1, 1000)
	}
	else
	{
		audio_sound_gain(mu, 1, 1000)
		if (pillar_mu != -1)
			audio_sound_gain(pillar_mu, 0, 1000)
	}
}

if global.panic && !panic_music_initiated
{
	panic_music_initiated = true
	audio_stop_sound(mu)
	audio_stop_sound(pillar_mu)
	mu = -1
	panic_mu = scr_sound(mu_pizzatime, true)
}
