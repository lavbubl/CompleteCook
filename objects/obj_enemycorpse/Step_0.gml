if (vsp < 20)
    vsp += grav;

x += hsp;
y += floor(vsp);

if !bbox_in_camera()
	instance_destroy()

if buffer-- <= 0
{
	var p = obj_player.id
	if p.instakill && place_meeting(x, y, p)
	{
		hsp = random_range(10, 18) * sign(x - p.x)
		vsp = random_range(-10, -18)
		grav = 0.4
		buffer = 10
		image_xscale = p.x > x ? 1 : -1
		alarm[0] = 5
		particle_create(x, y, particles.bang)
	}
}