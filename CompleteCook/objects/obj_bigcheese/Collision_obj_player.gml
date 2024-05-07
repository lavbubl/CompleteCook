if (state != states.throwing)
{
	pizzaball = 0
	playerid = other.id
	shot = 0
	state = states.throwing
	sprite_index = spr_bigcheese_walk
	image_index = 0
	other.state = states.tumble
	other.sprite_index = other.spr_tumble
}
