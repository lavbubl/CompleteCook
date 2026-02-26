depth = -15
image_speed = 0.1
talking = false
padding = 30
text_padding = 20
text_width = 15
text_height = 30
vsp = 0

wave_timer = 0

bubble = {
	x: padding,
	y: -screen_h,
	w: screen_w - (padding * 2),
	h: text_height + padding
}

var h_start = bubble.h

state = 0

internal_y = bubble.y

var xx = 0
var prev_i = 1

str_arr = []

draw_set_font(global.tutorialfont)

for (var i = 1; i <= string_length(text); i++) 
{
	xx += string_width(string_char_at(text, i))
	if (xx >= bubble.w - text_padding - padding || i == string_length(text))
	{
		xx = 0
		bubble.h += text_height
		var count = i - prev_i
		
		if i == string_length(text)
			count ++ // HACK
		
		array_push(str_arr, string_copy(text, prev_i, count))
		prev_i = i
	}
}

bg_pos = {
	x: 0,
	y: 0
}

bubble_surf = noone
