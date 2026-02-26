if other.sprite_index == spr_player_dead
	exit;

with other
{
	sprite_index = spr_player_dead
	image_speed = 0.35
	vsp = -8
	hsp = -4
}
