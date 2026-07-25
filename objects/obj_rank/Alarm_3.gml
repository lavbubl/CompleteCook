shake_camera(2, 3 / room_speed)
fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/killingblow", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

results[result_ix][2] = true
result_ix++

if result_ix >= array_length(results)
	alarm[1] = 150
else
	alarm[3] = 40
