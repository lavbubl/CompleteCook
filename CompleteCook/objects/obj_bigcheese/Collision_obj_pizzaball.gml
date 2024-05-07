if (state != states.throwing && (other.hsp != 0 or other.thrown or other.state == states.tumble))
{
	pizzaball = 1
	golfid = other.id
	shot = 0
	state = states.throwing
	sprite_index = spr_bigcheese_walk
	image_index = 0
}
