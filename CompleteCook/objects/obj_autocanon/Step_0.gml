if (cooldown <= 0 && (escape == false or global.panic == true))
{
	with (instance_create((x + (image_xscale * 15)), y, obj_canongoblinbomb))
	{
		other.ID = id
		image_xscale = other.image_xscale
	}
	if (cooldownrandom == 1)
		cooldownmax = random_range(50, 150)
	cooldown = cooldownmax
	sprite_index = spr_canonbot_shoot
	image_index = 0
}
if (cooldown > 0)
	cooldown--
if (floor(image_index) == (image_number - 1) && sprite_index == spr_canonbot_shoot)
	sprite_index = spr_canonbot
