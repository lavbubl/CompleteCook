if other.intransfo
{
	alarm[0] = 120
	
	with other
	{
		intransfo = false
		prev_transfo = false
		state = states.normal
		movespeed = abs(hsp)
		dir = xscale
		particle_create(x, y + 20, particles.genericpoof)
	}
	
	if ds_list_find_index(global.ds_saveroom, id) == -1
	{
		var _val = 500
		var _div = 10
		var _r = _val / _div
		global.score += _val
		global.combo.timer = 60
		
		repeat _div
		{
			var _range = 60
			var _type = choose("mushroom", "cheese", "pineapple", "sausage", "tomato")
			var c = {
				sprite_index: asset_get_index($"spr_{_type}collect"),
				image_index: 0,
				x: self.x - obj_camera.campos.x + random_range(-_range, _range),
				y: self.y - obj_camera.campos.y + random_range(-_range, _range),
				val: _r
			}
			
			array_push(obj_collect_got_visual.collects, c)
		}
		
		scr_sound_multiple(sfx_collect)
		instance_create(x, y, obj_collect_number).num = _val
		
		ds_list_add(global.ds_saveroom, id)
	}
	
	instance_create(obj_camera.campos.x, obj_camera.campos.y - 100, obj_priest_angel)
	scr_sound_3d(sfx_pray, x, y)
	reset_anim(spr_priest_pray)
}
