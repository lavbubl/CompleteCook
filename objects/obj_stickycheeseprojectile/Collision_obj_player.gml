alarm[0] = 60
sticked = 1
create_debris((x + random_range(-5, 5)), (y + random_range(-5, 5)), spr_slimedebris, 0)
x = other.x
y = other.y
with (other)
{
	cheesepeptimer = 2
	sprite_index = spr_cheesepepfall
	image_index = 0
	state = states.cheesepepjump
}
instance_destroy()
