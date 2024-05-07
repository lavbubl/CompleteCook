x += hsp
y += vsp

var num = collision_line_list(x, y, xprevious, yprevious, obj_haystack, 0, 1, global.instancelist, 0)
if (num > 0)
{
	for(var i = 0; i < num; i++)
	{
		var b = ds_list_find_value(global.instancelist, i)
		var t = 0
		with (b)
		{
			if (state == states.normal)
			{
				state = states.transitioncutscene
				if b.func(other.id, other)
					t = 1
				else
				{
					state = states.normal
					t = 0
				}
			}
		}
		if t
		{
			instance_destroy()
			break
		}
	}
}
ds_list_clear(global.instancelist)
