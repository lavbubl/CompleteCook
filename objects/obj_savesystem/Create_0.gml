depth = -400
if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}
showicon = 0
ini_str = ""
state = 0
icon_index = 0
icon_max = sprite_get_number(spr_pizzaslice)
