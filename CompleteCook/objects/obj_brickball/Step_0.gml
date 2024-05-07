hsp = (image_xscale * movespeed)
instance_destroy(instance_place((x + 16), y, obj_metalblock))
instance_destroy(instance_place((x + hsp), y, obj_metalblock))
if (!kicked)
{
	x = (obj_player1.x + (xoffset * obj_player1.xscale))
	y = obj_player1.y
	if scr_solid(x, y)
		x = obj_player1.x
}
if (blur_effect > 0)
	blur_effect--
else
{
	blur_effect = 2
	with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), image_xscale))
		playerid = other.id
}
if (hitbox == 0)
{
	with (instance_create(x, y, obj_shotgunbullet))
	{
		brick = 1
		visible = false
		mask_index = spr_lonebrick_roll
		image_index = other.image_index
		brickid = other.id
		other.hitbox = 1
	}
}
if (scr_solid(x, (y + 1)) && bounce == 0)
{
	vsp = -5
	bounce = 1
}
if (scr_solid((x + image_xscale), y) && kicked && (!(place_meeting((x + image_xscale), y, obj_destructibles))) && (!(place_meeting((x + image_xscale), y, obj_slope))))
	instance_destroy()
with (instance_place((x + image_xscale), y, obj_destructibles))
{
	if (object_index != obj_onewaybigblock)
		instance_destroy()
	else if other.kicked
	{
		var x1 = other.x
		var y1 = other.y
		var _col = collision_line((x + (35 * image_xscale)), (y + (16 * image_yscale)), x1, y1, obj_solid, false, true)
		if (_col == -4)
			instance_destroy()
		else
			instance_destroy(other)
	}
}
