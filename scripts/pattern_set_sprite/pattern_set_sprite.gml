function pattern_set_sprite(argument0, argument1, argument2, argument3) //gml_Script_pattern_set_sprite
{
	var _tex = sprite_get_texture(argument0, argument1)
	var _uvs = sprite_get_uvs(argument0, argument1)
	shader_set_uniform_f(global.Pattern_Spr_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3])
	shader_set_uniform_f(global.Pattern_Spr_Tex_Data, _uvs[4], _uvs[5], (texture_get_width(_tex) / texture_get_texel_width(_tex)), (texture_get_height(_tex) / texture_get_texel_height(_tex)))
	shader_set_uniform_f(global.Pattern_Spr_Scale, argument2, argument3)
	return;
}
