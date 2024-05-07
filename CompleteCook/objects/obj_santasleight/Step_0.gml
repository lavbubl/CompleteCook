if place_meeting(x, y, obj_file1)
{
	sprite_index = spr_santasleightpep
	with (obj_file1)
	{
		visible = false
		santaed = 1
	}
	if (!audio_is_playing(sfx_santa1))
		scr_soundeffect(sfx_santa1)
}
if (go == 1)
{
	hsp = 10
	vsp -= 0.05
}
x += hsp
y += vsp
