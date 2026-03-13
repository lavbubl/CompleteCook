var isPanic = global.panic.active;

if isPanic && mu != noone
{
	fmod_studio_event_instance_release(mu)
	fmod_studio_event_instance_stop(mu, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT)
	mu = noone;
}

var pillar_visible = false

with obj_pillar
	pillar_visible = bbox_in_camera();

if !isPanic
{
	/*if instance_exists(obj_pillar)
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
	}*/
	
	if panic_mu != noone
	{
		fmod_studio_event_instance_release(panic_mu)
		fmod_studio_event_instance_stop(panic_mu, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
		panic_mu = noone;
	}
	
	panic_music_initiated = false
	lap2 = false
	lap2_init = false
}

var pinch_point = 662;

if isPanic
{
	if (!panic_music_initiated && !pinch_init && !lap2)
	{
		panic_music_initiated = true
		fmod_studio_event_instance_release(mu)
		fmod_studio_event_instance_stop(mu, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
		fmod_studio_event_instance_stop(pillar_mu, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
		mu = noone
		var _panic_event_ref = fmod_studio_system_get_event("event:/music/pizzatime")
		panic_mu = fmod_studio_event_description_create_instance(_panic_event_ref)
		fmod_studio_event_instance_start(event_desc)
	}
	
	if global.panic.timer < pinch_point && !pinch_init && !lap2
	{
		fmod_studio_event_instance_set_parameter_by_name(panic_mu, "pinch", true)
		pinch_init = true
	}
	
	if (lap2 && !lap2_init)
	{
		var prevpos = 0
		
		if panic_mu != noone
		{
			fmod_studio_event_instance_release(panic_mu)
			fmod_studio_event_instance_stop(panic_mu, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
			panic_mu = noone
		}
		
		panic_mu = scr_sound(mu_lap2, true)
		audio_sound_loop_start(panic_mu, 22.48)
		audio_sound_loop_end(panic_mu, 171.40)

		audio_sound_gain(panic_mu, 0, 0)
		audio_sound_gain(panic_mu, 1, 1500)
		
		lap2_init = true
	}
}
