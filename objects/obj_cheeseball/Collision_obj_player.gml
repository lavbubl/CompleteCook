if (other.state != states.gotoplayer && other.state != states.chainsaw)
{
	if (other.state == states.knightpep or other.state == states.knightpepslopes or other.state == states.cheeseball)
	{
		repeat (8)
		{
			with (create_debris(x, y, spr_slimedebris))
			{
				vsp = random_range(-5, 0)
				hsp = random_range(-3, 3)
			}
		}
		instance_destroy()
	}
	else
	{
		tv_push_prompt_once(tv_create_prompt("This is the cheeseball transformation text", tvprompt.transfo, spr_tv_cheeseball, 3), "cheeseball")
		other.xscale = image_xscale
		other.hsp = hsp
		other.vsp = vsp
		other.movespeed = 8
		other.x = x
		other.y = y
		other.state = states.cheeseball
		other.stop_buffer = other.stop_max
		repeat (8)
		{
			with (create_debris(x, y, spr_slimedebris))
			{
				vsp = random_range(-5, 0)
				hsp = random_range(-3, 3)
			}
		}
		instance_destroy()
	}
}
