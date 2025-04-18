mag -= mag_decel

var target = obj_player

if instance_exists(obj_player)
{
	var target_spd = 0
	var appr_spd = 10
	
	if target.hitstun <= 0
	{
		if (target.state == states.mach2 || target.state == states.mach3)
		{
			target_spd = target.xscale * ((target.movespeed / 4) * 50)
			appr_spd = 0.35
		}
		else if ((abs(target.hsp) >= 16 || (target.state == states.taunt && abs(target.prev.hsp) >= 16)) && target.state != states.climbwall && target.state != states.superjump)
		{
			target_spd = (target.xscale * ((abs(target.movespeed) / 4) * 50))
			appr_spd = 2
			if ((target_spd > 0 && cam_charge < 0) || (target_spd < 0 && cam_charge > 0))
				appr_spd = 8
		}
	}
	
	cam_charge = approach(cam_charge, target_spd, appr_spd)
}
