with (instance_create(x, y, obj_enemycorpse))
{
	fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/kill", x, y)
    sprite_index = other.sprite_index
    image_xscale = other.image_xscale
}
instance_destroy()
