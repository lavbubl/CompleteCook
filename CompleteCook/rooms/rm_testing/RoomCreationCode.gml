pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
global.pizzadelivery = 1
global.hp = 8
global.use_temperature = 1
if (!obj_secretmanager.init)
{
	obj_secretmanager.init = 1
	secret_add(function()
	{
		touchedtriggers = 0
		exit;
	}
, function()
	{
		if (touchedtriggers >= 2)
			secret_open_portal(0)
		exit;
	}
)
	secret_add(function()
	{
		hittriggers = 0
		exit;
	}
, function()
	{
		if (hittriggers >= 2)
			secret_open_portal(4)
		exit;
	}
)
	secret_add(-4, function()
	{
		if secret_check_trigger(1)
			secret_open_portal(1)
		exit;
	}
)
	secret_add(-4, function()
	{
		secret_open_portal(2)
		exit;
	}
)
	secret_add(-4, function()
	{
		if secret_check_trigger(3)
			secret_open_portal(3)
		else
			secret_close_portal(3)
		exit;
	}
)
	secret_add(function()
	{
		totems = 0
		exit;
	}
, function()
	{
		if (totems >= 3)
			secret_open_portal(5)
		exit;
	}
)
	secret_add(-4, function()
	{
		if secret_check_trigger(6)
			secret_open_portal(6)
		exit;
	}
)
	secret_add(-4, function()
	{
		if secret_check_trigger(7)
			secret_open_portal(7)
		exit;
	}
)
}
