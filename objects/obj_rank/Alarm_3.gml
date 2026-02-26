shake_camera(2, 3 / room_speed)
scr_sound(sfx_killingblow)

results[result_ix][2] = true
result_ix++

if result_ix >= array_length(results)
	alarm[1] = 150
else
	alarm[3] = 40
