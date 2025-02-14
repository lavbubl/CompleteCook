bg_surf = -1
image_speed = 0
depth = 20

bg_parallax = []

for (var i = 0; i < array_length(speed_array); i++) 
{
	var s = {
		spd: speed_array[i],
		x: 0
	}
	
    array_push(bg_parallax, s)
}
