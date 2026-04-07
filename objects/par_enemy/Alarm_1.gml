visible = true
if object_index != obj_minijohn {
	state = states.stun
	stun_timer = 100
}
escape_frozen = false
particle_create(x, y, particles.genericpoof)
scr_sound_3d_pitched(sfx_pillarspawn, x, y)
