state = states.actor
pal_select = obj_player.pal_select
pattern_spr = obj_player.pattern_spr
isstick = irandom(100) <= 15

spr_idle = isstick ? spr_stick_exitidle : spr_gustavo_exitidle
spr_fall = isstick ? spr_stick_exitfall : spr_gustavo_exitfall

if obj_player.character == characters.noise
{
	spr_idle = isstick ? spr_noisette_exitidle : spr_noisey_exitidle
	spr_fall = isstick ? spr_noisette_exitfall : spr_noisey_exitfall
}

image_speed = 0.35
ystart = y
depth = 0
