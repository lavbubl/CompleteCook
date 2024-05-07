if (defused == 1)
	countdown -= 0.5
if (countdown < 50)
	sprite_index = bomblit_spr
if (countdown == 0)
	instance_destroy()
if (kickbuffer > 0)
{
	if (!(place_meeting(x, y, obj_player)))
		kickbuffer = 0
}
switch state
{
	case states.normal:
		hsp = (movespeed * image_xscale)
		if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_ratblock))))
			image_xscale *= -1
		if (place_meeting((x + hsp), y, obj_ratblock) or place_meeting(x, (y + vsp), obj_ratblock))
			instance_destroy()
		if (scr_solid((x + 1), y) or scr_solid((x - 1), y))
			drop = 1
		if grounded
		{
			if (movespeed > 0)
				movespeed -= 0.5
		}
		if place_meeting(x, (y + 1), obj_railparent)
		{
			var _railinst = instance_place(x, (y + 1), obj_railparent)
			hsp = (_railinst.movespeed * _railinst.dir)
		}
		if (vsp < 12)
			vsp += grav
		scr_collide()
		break
	case states.grabbed:
		grounded = false
		x = playerid.x
		y = (playerid.y - 40)
		image_xscale = playerid.xscale
		if (playerid.state != states.bombgrab && playerid.state != states.superslam)
			state = states.normal
		if (playerid.state == states.superslam)
		{
			if playerid.grounded
				instance_destroy()
		}
		break
	default:
		state = states.normal
		break
}

