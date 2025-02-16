image_alpha = 0;
savedx = x;
savedy = y;
savedcx = camera_get_view_x(view_camera[0]);
savedcy = camera_get_view_y(view_camera[0]);
if instance_exists(obj_player)
{
	x = obj_player.x;
	y = obj_player.y;
}
//if room == rank_room
if !global.panic.active
	instance_destroy()