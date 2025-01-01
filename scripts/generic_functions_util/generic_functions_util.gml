function wrap(m, n) {
  return n >= 0 ? n % m : (n % m + m) % m;
}

function approach(_start, _end, _shift) {
  if (_start < _end) {
    return min(_start + _shift, _end);
  } else {
    return max(_start - _shift, _end);
  }
}


function wave(from, to, duration, offset)
{
	var _wave = (to - from) * 0.5;

	return from + _wave + sin((((current_time * 0.001) + duration * offset) / duration) * (pi * 2)) * _wave;
}

function quick_shader_set_uniform_f(shader, uniform_name, val)
{
	var f = shader_get_uniform(shader, uniform_name)
	shader_set_uniform_f(f, val)
}

function shake_camera(_mag = 5, _mag_decel = 0.25)
{
	obj_camera.mag = _mag
	obj_camera.mag_decel = _mag_decel
}

function reset_anim(spr)
{
	sprite_index = spr
	image_index = 0
}

function reset_anim_on_end(spr)
{
	if (anim_ended())
		reset_anim(spr)
}

