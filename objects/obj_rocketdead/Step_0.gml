if (vsp < 20)
	vsp += grav
x += hsp
y += vsp
angle += (sign(hsp) * 10)
if scr_solid(x, (y + 1))
{
	vsp = 0
	hsp = 0
	angle = 0
	if (sprite_index != spr_bombexplosion)
	{
		scr_soundeffect(sfx_explosion)
		image_index = 0
		sprite_index = spr_bombexplosion
	}
}
