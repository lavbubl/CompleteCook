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
	if instance_exists(obj_pillar)
	{
		if pillar_visible
		{
			if mu != -1
				audio_sound_gain(mu, 0, 2000)
			if (pillar_mu != -1)
				audio_sound_gain(pillar_mu, 1, 1000)
		}
		else
		{
			if mu != -1
				audio_sound_gain(mu, 1, 2000)
			if (pillar_mu != -1)
				audio_sound_gain(pillar_mu, 0, 1000)
		}
	}
	
	if panic_mu != -1
	{
		audio_stop_sound(panic_mu)
		panic_mu = -1
	}
	
	if panic_pinch_mu != -1
	{
		audio_stop_sound(panic_pinch_mu)
		panic_pinch_mu = -1
	}
	
	panic_music_initiated = false
	pinch_init = false
}

var pinch_point = 662

if global.panic
{
	if (!panic_music_initiated && !pinch_init)
	{
		panic_music_initiated = true
		audio_stop_sound(mu)
		audio_stop_sound(pillar_mu)
		mu = -1
		panic_mu = scr_sound(mu_pizzatime, true)
		audio_sound_loop_start(panic_mu, 47.96)
		audio_sound_loop_end(panic_mu, 159.94)
	}
	
	if (global.panic_timer < pinch_point && !pinch_init)
	{
		pinch_init = true
		
		var prevpos = audio_sound_get_track_position(panic_mu)
		prevmu = scr_sound(audio_sound_get_asset(panic_mu), true)
		audio_sound_set_track_position(prevmu, prevpos)
		audio_sound_gain(prevmu, 0, 2000)
		
		audio_stop_sound(panic_mu)
		panic_mu = -1
		
		panic_pinch_mu = scr_sound(mu_pizzatime)
		audio_sound_set_track_position(panic_pinch_mu, 170.63)
		audio_sound_gain(panic_pinch_mu, 0, 0)
		audio_sound_gain(panic_pinch_mu, 1, 2000)
	}
}
