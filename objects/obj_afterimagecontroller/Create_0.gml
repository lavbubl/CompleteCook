enum afterimage
{
	afterimage,
	mach3effect,
	heatattack,
	firemouth,
	blue,
	blur,
	
	enum_length // used to check how many afterimage types there are
}
depth = 1
global.afterimage_list = ds_list_create()
alpha = array_create(afterimage.enum_length, 1)
alpha[afterimage.heatattack] = 0.5
shd_alpha = shader_get_uniform(shd_firemouth_afterimage, "newAlpha")
