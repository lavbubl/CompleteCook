state = 0
white_fade_alpha = 0
brown_alpha = 0
image_index = image_number - 1
image_speed = 0
depth = -8
rank_score = 0
rank_ix = 0
rank_data = [
	{sprite: spr_rankD, song: mu_rankd},
	{sprite: spr_rankC, song: mu_rankc},
	{sprite: spr_rankB, song: mu_rankb},
	{sprite: spr_rankA, song: mu_ranka},
	{sprite: spr_rankS, song: mu_ranks},
	{sprite: spr_rankP, song: mu_rankp}
]

t_ystart = screen_h + 216
var x_start = screen_w - 437
var offset = 89

toppins = []

var i = 0

var t = global.level_data.toppins
var toppin_list = [t.shroom, t.cheese, t.tomato, t.sausage, t.pineapple]

repeat 5
{
	var s = {
		x: x_start + (offset * i), 
		y: t_ystart,
		image_index: i,
		image_yscale: 1,
		image_blend: toppin_list[i] ? c_white : c_black
	}
	
	array_push(toppins, s)
	i++
}

toppin_ix = 0

results = [
	["HIGHSCORE: ", 0, false],
	["TIME: ", 0, false],
	["DAMAGE: ", 0, false],
	["HIGHEST COMBO: ", 0, false]
]

result_ix = 0
