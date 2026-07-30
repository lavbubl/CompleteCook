enum languages
{
	english,
	spanish
}

#macro langspr_tv_c_bubble lang_sprite_get(spr_tv_c_bubble)
#macro langspr_combotitles lang_sprite_get(spr_combotitles)

global.language = languages.spanish

global.language_json_map_bboxmode = ds_map_create()

ds_map_add(global.language_json_map_bboxmode, "auto", bboxmode_automatic)
ds_map_add(global.language_json_map_bboxmode, "fullimage", bboxmode_fullimage)
ds_map_add(global.language_json_map_bboxmode, "manual", bboxmode_manual)

global.language_json_map_speedtype = ds_map_create()

ds_map_add(global.language_json_map_speedtype, "per_second", spritespeed_framespersecond)
ds_map_add(global.language_json_map_speedtype, "per_game_frame", spritespeed_framespergameframe)

global.language_json_map_tilemode = ds_map_create()

ds_map_add(global.language_json_map_tilemode, "stretch", nineslice_stretch)
ds_map_add(global.language_json_map_tilemode, "repeat", nineslice_repeat)
ds_map_add(global.language_json_map_tilemode, "mirror", nineslice_mirror)
ds_map_add(global.language_json_map_tilemode, "blank", nineslice_blank)
ds_map_add(global.language_json_map_tilemode, "hide", nineslice_hide)

function lang_init()
{
	var _language_folder = ""
	
	switch global.language
	{
		case languages.english:
			return;
		case languages.spanish:
			_language_folder = "Spanish"
	}
	
	global.language_directory = working_directory + "Language\\" + _language_folder + "\\"
	
	show_debug_message("Loading language assets from directory " + global.language_directory)
	
	global.language_sprites = []
	
	var _sprites = [spr_tv_c_bubble,
					spr_combotitles]
	
	for (var i = 0; i < array_length(_sprites); i++)
	{
		var _cur_sprite = _sprites[i]
		var _name = sprite_get_name(_cur_sprite)
		
		global.language_sprites[_cur_sprite] = lang_sprite_load(_name)
	}
}

#region Sprite Functions

function lang_sprite_load(_sprite_name)
{
	var _default_sprite = asset_get_index(_sprite_name)
	
	var _path = global.language_directory + "Sprites\\" + _sprite_name
	
	show_debug_message("Attempting to load sprite " + _sprite_name)
	
	if file_exists(_path + ".png")
	{
		var _frames = sprite_get_number(_default_sprite)
		var _removeback = false
		var _smooth = false
		var _offset_x = sprite_get_xoffset(_default_sprite)
		var _offset_y = sprite_get_yoffset(_default_sprite)
		var _bbox_mode = sprite_get_bbox_mode(_default_sprite)
		var _bbox_left = sprite_get_bbox_left(_default_sprite)
		var _bbox_top = sprite_get_bbox_top(_default_sprite)
		var _bbox_right = sprite_get_bbox_right(_default_sprite)
		var _bbox_bottom = sprite_get_bbox_bottom(_default_sprite)
		var _speed_fps = sprite_get_speed(_default_sprite)
		var _speed_type = sprite_get_speed_type(_default_sprite)
		var _nineslice = sprite_get_nineslice(_default_sprite)
		
		if file_exists(_path + ".json")
		{
			show_debug_message("Attatched JSON file found, setting up data")
			
			var _json_file = file_text_read_string(file_text_open_read(_path + ".json"));
			var _sprite_data = json_parse(_json_file)
			
			if struct_exists(_sprite_data, "frames")
				_frames = _sprite_data.frames
			
			if struct_exists(_sprite_data, "removeback")
				_removeback = _sprite_data.removeback
			
			if struct_exists(_sprite_data, "smooth")
				_smooth = _sprite_data.smooth
			
			if struct_exists(_sprite_data, "offset")
			{
				if struct_exists(_sprite_data.offset, "x")
					_offset_x = _sprite_data.offset.x
				
				if struct_exists(_sprite_data.offset, "y")
					_offset_y = _sprite_data.offset.y
			}
			
			if struct_exists(_sprite_data, "bbox")
			{
				if struct_exists(_sprite_data.bbox, "mode")
					_bbox_mode = global.language_json_map_bboxmode[? _sprite_data.bbox.mode]
				
				if struct_exists(_sprite_data.bbox, "left") 
					_bbox_left = _sprite_data.bbox.left
				
				if struct_exists(_sprite_data.bbox, "top") 
					_bbox_top = _sprite_data.bbox.top
				
				if struct_exists(_sprite_data.bbox, "right") 
					_bbox_right = _sprite_data.bbox.right
				
				if struct_exists(_sprite_data.bbox, "bottom")
					_bbox_bottom = _sprite_data.bbox.bottom
			}
			
			if struct_exists(_sprite_data, "speed")
			{
				if struct_exists(_sprite_data.speed, "type")
					_speed_type = global.language_json_map_speedtype[? _sprite_data.speed.type]
				
				if struct_exists(_sprite_data.speed, "fps") 
					_speed_fps = _sprite_data.speed.fps
			}
			
			if struct_exists(_sprite_data, "nineslice")
			{
				if struct_exists(_sprite_data.nineslice, "enabled") 
					_nineslice.enabled = _sprite_data.nineslice.enabled
				
				if struct_exists(_sprite_data.nineslice, "left") 
					_nineslice.left = _sprite_data.nineslice.left
				
				if struct_exists(_sprite_data.nineslice, "top") 
					_nineslice.top = _sprite_data.nineslice.top
				
				if struct_exists(_sprite_data.nineslice, "right") 
					_nineslice.right = _sprite_data.nineslice.right
				
				if struct_exists(_sprite_data.nineslice, "bottom") 
					_nineslice.bottom = _sprite_data.nineslice.bottom
				
				if struct_exists(_sprite_data.nineslice, "tile_mode")
				{
					if struct_exists(_sprite_data.nineslice.tile_mode, "left") 
						_nineslice.tilemode[nineslice_left] = global.language_json_map_tilemode[? _sprite_data.nineslice.tile_mode.left]
					
					if struct_exists(_sprite_data.nineslice.tile_mode, "top") 
						_nineslice.tilemode[nineslice_top] = global.language_json_map_tilemode[? _sprite_data.nineslice.tile_mode.top]
					
					if struct_exists(_sprite_data.nineslice.tile_mode, "right") 
						_nineslice.tilemode[nineslice_right] = global.language_json_map_tilemode[? _sprite_data.nineslice.tile_mode.right]
					
					if struct_exists(_sprite_data.nineslice.tile_mode, "bottom") 
						_nineslice.tilemode[nineslice_bottom] = global.language_json_map_tilemode[? _sprite_data.nineslice.tile_mode.bottom]
					
					if struct_exists(_sprite_data.nineslice.tile_mode, "center") 
						_nineslice.tilemode[nineslice_center] = global.language_json_map_tilemode[? _sprite_data.nineslice.tile_mode.center]
				}
			}
		}
		
		var _sprite = sprite_add(_path + ".png", _frames, _removeback, _smooth, _offset_x, _offset_y)
		
		sprite_set_bbox_mode(_sprite, _bbox_mode)
		sprite_set_bbox(_sprite, _bbox_left, _bbox_top, _bbox_right, _bbox_bottom)
		sprite_set_speed(_sprite, _speed_fps, _speed_type)
		sprite_set_nineslice(_sprite, _nineslice)
		
		show_debug_message("Sprite loaded")
		
		return _sprite;
	}
	else
	{
		show_debug_message("Failed to load. Falling back to default sprite")
		return _default_sprite;
	}
}

function lang_sprite_get(_sprite)
{
	if global.language == languages.english
		return _sprite;
	else
		return global.language_sprites[_sprite];
}

#endregion
