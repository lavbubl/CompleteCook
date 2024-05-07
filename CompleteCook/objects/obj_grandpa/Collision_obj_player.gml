with (obj_player)
{
	if (state == states.knightpep or state == states.knightpepslopes)
	{
		global.combotime = 60
		instance_destroy(other)
	}
}
if (other.state != states.ghost)
{
	sprite_index = spr_grandpa_punch
	image_index = 0
	other.hurted = 0
	scr_hurtplayer(other)
}
else
{
	global.combotime = 60
	instance_destroy()
}
