function scr_pepperman_walk()
{
	hsp = 0
	sprite_index = spr_pepperman_idle
	if (idle_timer > 10000)
	{
		if (point_in_camera(x, y, view_camera[0]) && (!instance_exists(marbledeathID)))
			marbledeathID = instance_create(x, -64, obj_pepper_marbleblock)
	}
	if (idle_timer > 0)
		idle_timer--
	else
	{
		idle_timer = (idle_max - (wastedhits * 10))
		var b = targetplayer
		if (distance_to_object(targetblock) < 300)
			b = targetblock
		if (distance_to_object(b) < 400 && b.y > (y - 64) && b.y < (y + 8))
		{
			state = states.shoulderbash
			sprite_index = spr_pepperman_shoulderstart
			image_index = 0
			if (b.x != x)
				image_xscale = sign((b.x - x))
		}
		else
			pepperman_nearestspot()
	}
	exit;
}

function pepperman_nearestspot()
{
	if (elitehit > 1)
	{
		if instance_exists(obj_pepper_marbleblock)
			targetspot = instance_nearest(x, y, obj_pepper_marbleblock).parentID
		if (targetspot == oldtargetspot)
		{
			do
			{
				targetspot = instance_nearest_random(obj_pepper_groundpoundspot, 3)
			} until (targetspot != oldtargetspot && targetspot != undefined);
		}
	}
	else
		targetspot = instance_nearest(obj_player1.x, obj_player1.y, obj_pepper_groundpoundspot)
	state = states.jump
	jump_speed = floor((distance_to_object(targetspot) * 0.04))
	if (jump_speed < 20)
		jump_speed = 20
	jump_speed += floor((wastedhits / 2))
	calculate_jump_velocity((targetspot.x + 16), ((targetspot.y + 16) - 200), jump_speed, grav)
	if (hsp > -2 && hsp < 2)
		vsp = (-jump_speed)
	trace(hsp, " ", vsp)
	sprite_index = spr_pepperman_jump
	image_index = 0
	exit;
}

function scr_pepperman_jump()
{
	if (hsp != 0)
		image_xscale = sign(hsp)
	if (x >= (targetspot.x - 32) && x <= (targetspot.x + 32) && y < (targetspot.y - 48) && (!(place_meeting(x, y, obj_solid))))
	{
		state = states.freefall
		sprite_index = spr_pepperman_groundpound
		vsp = 11
		hsp = 0
		grounded = false
	}
	if (sprite_index == spr_pepperman_jump && floor(image_index) == (image_number - 1))
		sprite_index = spr_pepperman_fall
	exit;
}

function scr_pepperman_freefall()
{
	vsp = 20
	if grounded
	{
		scr_soundeffect(sfx_groundpound)
		oldtargetspot = targetspot
		state = states.walk
		if point_in_camera(x, y, 329)
		{
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (5 / room_speed)
			}
		}
		var first_spot = 0
		if (elitehit > 1)
		{
			repeat marbleblockmax
			{
				b = 0
				var t = instance_random(obj_pepper_marblespot)
				if (!first_spot)
				{
					t = instance_nearest(x, y, obj_pepper_marblespot)
					first_spot = 1
				}
				with (t)
				{
					if (!instance_exists(blockID))
					{
						b = 1
						with (instance_create(x, -64, obj_pepper_marbleblock))
						{
							parentID = instance_nearest(x, y, obj_pepper_groundpoundspot)
							other.blockID = id
							spotID = t
						}
					}
				}
				if (marbleblockmax >= instance_number(obj_pepper_marblespot) or (instance_number(obj_pepper_marbleblock) + instance_number(obj_pepper_marblestatue)) == instance_number(obj_pepper_marblespot))
					b = 1
				if b
				{
				}
				else
				{
					do
					{
						var t = instance_random(obj_pepper_marblespot)
						if (!first_spot)
						{
							t = instance_nearest(x, y, obj_pepper_marblespot)
							first_spot = 1
						}
						with (t)
						{
							if (!instance_exists(blockID))
							{
								b = 1
								with (instance_create(x, -64, obj_pepper_marbleblock))
								{
									parentID = instance_nearest(x, y, obj_pepper_groundpoundspot)
									other.blockID = id
									spotID = t
								}
							}
						}
						if (marbleblockmax >= instance_number(obj_pepper_marblespot) or (instance_number(obj_pepper_marbleblock) + instance_number(obj_pepper_marblestatue)) == instance_number(obj_pepper_marblespot))
							b = 1
					} until b;
				}
			}
			idle_timer /= 3
			idle_timer = floor(idle_timer)
		}
		else
			idle_timer = 100000
	}
	exit;
}

function scr_pepperman_shoulderbash()
{
	hsp = (image_xscale * (8 + wastedhits))
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_pepperman_shoulderstart)
		sprite_index = spr_pepperman_shoulderloop
	if ((place_meeting((x + hsp), y, obj_solid) or scr_solid_slope((x + hsp), y) or place_meeting((x + hsp), y, obj_pepper_marbleblock)) && (!(place_meeting((x + hsp), y, obj_destructibles))))
	{
		with (instance_place((x + hsp), y, obj_pepper_marbleblock))
		{
			hp--
			if (hp <= 0)
				instance_destroy()
			else
				other.idle_timer = 10
		}
		state = states.stun
		hsp = ((-image_xscale) * 5)
		vsp = -8
		stunned = 30
	}
	exit;
}

