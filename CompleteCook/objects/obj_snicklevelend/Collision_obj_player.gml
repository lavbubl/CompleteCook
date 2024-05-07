if (image_index == 0)
{
	image_speed = 0.35
	image_index = 0
	global.panic = false
	global.snickchallenge = 0
	if instance_exists(obj_snickexe)
		instance_destroy(obj_snickexe)
	audio_stop_sound(mu_pizzatime)
	audio_stop_sound(mu_snickchallenge)
	audio_stop_sound(mu_snickchallengeend)
}
