function pattern_set_pattern(argument0, argument1) //gml_Script_pattern_set_pattern
{
	/*if (argument0 == global.Pattern_Texture_Indexed && global.Pattern_Texture_Indexed != -4)
		return;
	if (argument0 == -4)
		return;*/
	global.Pattern_Texture_Indexed = argument0
	var _tex = sprite_get_texture(argument0, argument1)
	texture_set_stage(global.Pattern_Texture, _tex)
	texture_set_interpolation_ext(global.Pattern_Texture, 0)
	var _uvs = sprite_get_uvs(argument0, argument1)
	shader_set_uniform_f(global.Pattern_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3])
	shader_set_uniform_f(global.Pattern_Tex_Data, _uvs[4], _uvs[5], (texture_get_width(_tex) / texture_get_texel_width(_tex)), (texture_get_height(_tex) / texture_get_texel_height(_tex)))
	return;
}