if (timermax > 1)
	timermax -= 2
if (timermax <= 5)
	timermax = 5
repeat round(explosionsnum)
{
	with (instance_create(irandom_range(50, (room_width - 50)), irandom_range(50, (room_height - 50)), obj_explosioneffect))
	{
		sprite_index = spr_bombexplosion
		var num = irandom_range(6, 10)
		image_speed = (other.explosionsnum / num)
		if (image_speed < 0.35)
			image_speed = 0.35
		repeat (3)
			create_debris(x, y, spr_debris)
	}
}
scr_soundeffect(sfx_explosion)
with (obj_camera)
{
	shake_mag = 30
	shake_mag_acc = (30 / room_speed)
}
explosionsnum += 0.5
alarm[0] = timermax
