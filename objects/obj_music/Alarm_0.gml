panic_mu = scr_sound(mu_wwn, true)
audio_sound_loop_start(panic_mu, 22.48)
audio_sound_loop_end(panic_mu, 171.40)

audio_sound_gain(panic_mu, 0, 0)
audio_sound_gain(panic_mu, 1, 1500)
//emulating fmod's fuckass transition system