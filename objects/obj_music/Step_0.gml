var isPanic = global.panic.active;

if isPanic && mu != noone && audio_sound_get_gain(mu) <= 0
{
	audio_stop_sound(mu);
	mu = noone;
}

if prevmu != noone && audio_sound_get_gain(prevmu) <= 0
{
	audio_stop_sound(prevmu);
	prevmu = noone;
}

var pillar_visible = false

with obj_pillar
	pillar_visible = bbox_in_camera();

if !isPanic
{
	if instance_exists(obj_pillar)
	{
		if pillar_visible
		{
			if mu != noone
				audio_sound_gain(mu, 0, 2000);
			if pillar_mu != noone
				audio_sound_gain(pillar_mu, 1, 1000);
		}
		else
		{
			if mu != noone
				audio_sound_gain(mu, 1, 2000);
			if pillar_mu != noone
				audio_sound_gain(pillar_mu, 0, 1000);
		}
	}
	
	if panic_mu != noone
	{
		audio_stop_sound(panic_mu);
		panic_mu = noone;
	}
	
	if panic_pinch_mu != noone
	{
		audio_stop_sound(panic_pinch_mu);
		panic_pinch_mu = noone;
	}
	
	panic_music_initiated = false
	pinch_init = false
	lap2 = false
	lap2_init = false
}

var pinch_point = 662;

if isPanic
{
	if (!panic_music_initiated && !pinch_init && !lap2)
	{
		panic_music_initiated = true
		audio_stop_sound(mu)
		audio_stop_sound(pillar_mu)
		mu = noone
		panic_mu = scr_sound(mu_pizzatime, true)
		audio_sound_loop_start(panic_mu, 47.96)
		audio_sound_loop_end(panic_mu, 159.94)
	}
	
	if (global.panic.timer < pinch_point && !pinch_init && !lap2)
	{
		pinch_init = true
		
		var prevpos = audio_sound_get_track_position(panic_mu)
		prevmu = scr_sound(audio_sound_get_asset(panic_mu), true)
		audio_sound_set_track_position(prevmu, prevpos)
		audio_sound_gain(prevmu, 0, 2000)
		
		audio_stop_sound(panic_mu)
		panic_mu = noone
		
		panic_pinch_mu = scr_sound(mu_pizzatime)
		audio_sound_set_track_position(panic_pinch_mu, 170.63)
		audio_sound_gain(panic_pinch_mu, 0, 0)
		audio_sound_gain(panic_pinch_mu, 1, 2000)
	}
	
	if (lap2 && !lap2_init)
	{
		var prevpos = 0
		
		if panic_mu != noone
		{
			prevpos = audio_sound_get_track_position(panic_mu)
			prevmu = scr_sound(audio_sound_get_asset(panic_mu), true)
			audio_sound_set_track_position(prevmu, prevpos)
			audio_sound_gain(prevmu, 0, 2000)
			
			audio_stop_sound(panic_mu)
			panic_mu = noone
		}
		
		if panic_pinch_mu != noone
		{
			prevpos = audio_sound_get_track_position(panic_pinch_mu)
			prevmu = scr_sound(audio_sound_get_asset(panic_pinch_mu), true)
			audio_sound_set_track_position(prevmu, prevpos)
			audio_sound_gain(prevmu, 0, 2000)
			
			audio_stop_sound(panic_pinch_mu)
			panic_pinch_mu = noone
		}
		
		panic_mu = scr_sound(mu_lap2, true)
		audio_sound_loop_start(panic_mu, 22.48)
		audio_sound_loop_end(panic_mu, 171.40)
		
		audio_sound_gain(panic_mu, 0, 0)
		alarm[0] = 45
		
		lap2_init = true
	}
}
