function scr_sound(snd, loop = false)
{
	var g = 1 //global.sfx_volume
	var played_snd = audio_play_sound(snd, 1, loop, g)
	
	return played_snd;
}

function scr_sound_pitched(snd, pitch_start = 0.95, pitch_end = 1.05)
{
	var g = 1
	var played_snd = audio_play_sound(snd, 1, 0, g)
	audio_sound_pitch(snd, random_range(pitch_start, pitch_end))
	
	return played_snd;
}

function scr_sound_3d(snd, x, y, loop = false)
{
	var g = 1
	
	var played_snd = audio_play_sound_at(snd, x, y, 0, 
		global.sound_3d.falloff_ref_dist,
		global.sound_3d.falloff_max_dist,
		global.sound_3d.falloff_factor,
		loop, 1, g
		)
	
	return played_snd;
}

function emitter_create_quick(x, y, follow_obj = noone, z = 0)
{
	var e = audio_emitter_create()
	audio_emitter_position(e, x, y, z)
	audio_emitter_falloff(e,
		global.sound_3d.falloff_ref_dist, 
		global.sound_3d.falloff_max_dist, 
		global.sound_3d.falloff_factor)
	
	array_push(obj_3d_sound.emitters, [e, follow_obj])
	
	return e;
}

function scr_sound_3d_on(emitter, snd, loop = false)
{
	var g = 1
	
	var played_snd = audio_play_sound_on(emitter, snd, loop, 1, g)
	
	return played_snd;
}

function scr_sound_3d_pitched(snd, x, y, pitch_start = 0.95, pitch_end = 1.05, loop = false)
{
	var g = 1
	
	var played_snd = audio_play_sound_at(snd, x, y, 0, 
		global.sound_3d.falloff_ref_dist,
		global.sound_3d.falloff_max_dist,
		global.sound_3d.falloff_factor,
		loop, 1, g, 0, random_range(pitch_start, pitch_end)
		)
	
	return played_snd;
}

function scr_sound_multiple(snd)
{
	if audio_is_playing(snd)
		audio_stop_sound(snd)
	
	var s = scr_sound(snd)
	
	return s;
}
