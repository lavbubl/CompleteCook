function reset_blendmode()
{
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha)
}

function reset_shader_fix()
{
	if (shader_current() != -1)
		shader_reset()
	shader_set(shd_alphafix)
}
	