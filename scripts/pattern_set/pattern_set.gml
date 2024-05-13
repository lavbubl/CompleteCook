function pattern_set(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_pattern_set
{
	if (argument5 == -4)
		return;
	pattern_enable(1)
	pattern_set_pattern(argument5, 0)
	pattern_set_sprite(argument1, argument2, argument3, argument4)
	pattern_set_color_array(argument0)
	return;
}
