var temp = {
	x: 0, 
	y: 0,
	filename: "",
	sprs: {
		off: noone,
		whitenoise: noone,
		selected: noone,
		confirm: noone
	},
	state: 0,
	sprite_index: noone,
	image_index: 0,
	buffer: 30
}

tvs = []

cur_selected = 1

repeat 3
	array_push(tvs, temp)
