if (room == Realtitlescreen or room == hub_loadingscreen or room == rank_room)
	exit;
if (instance_exists(obj_pause) && obj_pause.pause)
	exit;
draw_set_color(c_white)
var seconds = 0
var minutes = 0
var s_str = ""
var m_str = ""
seconds = global.level_seconds
minutes = global.level_minutes
var mm = frac(seconds)
mm = string(mm)
mm = string_copy(mm, 3, string_length(mm) - 3)
while (string_length(mm) < 1)
	mm += "0"
while (string_length(mm) > 2)
	mm = string_delete(mm, string_length(mm), 1)
var sd = floor(seconds)
if (sd < 10)
	s_str = concat(0, sd)
else
	s_str = string(sd)
minutes = floor(minutes)
for (var hours = 0; minutes > 59; hours++)
	minutes -= 60
if (minutes < 10)
	m_str = concat(0, minutes)
else
	m_str = string(minutes)
if (hours < 10)
	hours = concat(0, hours)
else
	hours = string(hours)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_set_font(global.smallfont)
draw_set_alpha(1)
draw_set_color(c_white)
var finalstr = concat(hours, ":", m_str, ":", s_str, ".", mm)
draw_text(960 - ((string_length(finalstr) - 1) * string_width("A")), 540 - 8, finalstr)
