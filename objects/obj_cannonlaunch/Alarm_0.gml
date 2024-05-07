with (obj_camera)
{
	shake_mag = 20
	shake_mag_acc = (40 / room_speed)
}
scr_soundeffect(sfx_explosion)

//it will create a visual object, not a cheeseslime
//a visual that shoes the player being launched into the distance
instance_create(x, y, obj_cheeseslime)
