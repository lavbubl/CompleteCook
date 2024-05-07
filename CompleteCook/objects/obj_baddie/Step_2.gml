if (state == states.grabbed)
	scr_enemy_grabbed()
else if (state == states.lungeattack)
	scr_enemy_lungeattack()
else if (state == states.secret)
	scr_enemy_secret()
scr_squash()
if (state != states.stun && state != states.hit)
	linethrown = false
if (state == states.stun && (!thrown))
	linethrown = false
if (object_index != obj_pizzaball && (place_meeting((x + 1), y, obj_spike) or place_meeting((x - 1), y, obj_spike) or place_meeting(x, (y + 1), obj_spike) or place_meeting(x, (y - 1), obj_spike)))
	instance_destroy()
if (state != states.grabbed && state != states.pummel && object_index != obj_pepbat && object_index != obj_ghoul && object_index != obj_fakesanta && use_collision)
	scr_collide()
if (invtime > 0)
	invtime--
if (sprite_index == walkspr && hsp != 0 && floor(image_index) == (image_number - 1) && object_index != obj_ghoul)
	create_particle((x - (image_xscale * 20)), (y + 43), particle.cloudeffect, 0)
if (state == states.walk)
	image_speed = (0.35 + (global.baddiespeed * 0.05))
else if (state != states.charge)
	image_speed = 0.35
if (dodgebuffer > 0)
	dodgebuffer--
with (instance_nearest(x, y, obj_player))
{
	if (state == states.backbreaker)
	{
		other.stunned = 0
		if (other.state != states.pizzagoblinthrow && (!other.provoked) && other.bombreset > 0)
		{
			other.bombreset = 0
			other.provoked = 1
		}
		other.scaredbuffer = 0
	}
	else if (other.state != states.pizzagoblinthrow)
		other.provoked = 0
}
if (y > (room_height + 100))
	instance_destroy()
if (thrown && (x > (room_width + 100) or x < -100 or y < -100))
	instance_destroy()
