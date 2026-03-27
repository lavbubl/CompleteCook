shake_camera(2, 3 / room_speed)
fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/killingblow", screen_w / 2, screen_h / 2)

results[result_ix][2] = true
result_ix++

if result_ix >= array_length(results)
	alarm[1] = 150
else
	alarm[3] = 40
