if (ds_list_find_index(global.baddieroom, id) == -1)
{
	create_particle(x, y, particle.genericpoofeffect)
	ds_list_add(global.baddieroom, id)
	switch type
	{
		case 0:
			global.collect += 50
			with (instance_create(x, y, obj_smallnumber))
				number = "50"
			break
		case 1:
			global.collect += 100
			with (instance_create(x, y, obj_smallnumber))
				number = "100"
			break
		case 2:
			global.collect += 150
			with (instance_create(x, y, obj_smallnumber))
				number = "150"
			break
	}
}
