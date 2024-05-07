function __init_global()
{
	gml_pragma("global", "__init_global();");
	
	layer_force_draw_depth(true, 0)
	draw_set_colour(c_black)
}
