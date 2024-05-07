if instance_exists(obj_pepperman)
{
	if (obj_pepperman.hp <= 6 && start == 0)
	{
		alarm[0] = 500
		start = 1
	}
}
else
	instance_destroy()
