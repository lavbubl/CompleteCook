visible = true
state = states.stun
escape_frozen = false
stun_timer = 100
particle_create(x, y, particles.genericpoof)
fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/pillarspawn", x, y)
