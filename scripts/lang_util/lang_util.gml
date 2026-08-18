enum languages
{
	english,
	latam_spanish
}

#macro text_menu_loading global.language_text_map[? "menu_loading"]

#macro text_option_on global.language_text_map[? "option_on"]
#macro text_option_off global.language_text_map[? "option_off"]
#macro text_option_yes global.language_text_map[? "option_yes"]
#macro text_option_no global.language_text_map[? "option_no"]
#macro text_option_none global.language_text_map[? "option_none"]

#macro text_option_timer_level global.language_text_map[? "option_timer_level"]
#macro text_option_timer_save global.language_text_map[? "option_timer_save"]
#macro text_option_timer_levelsave global.language_text_map[? "option_timer_levelsave"]

#macro text_option_binding global.language_text_map[? "option_binding_tip"]
#macro text_option_controls_saved global.language_text_map[? "option_controls_saved"]
#macro text_option_controls_reset global.language_text_map[? "option_controls_resetted"]
#macro text_option_press_any global.language_text_map[? "option_press_any"]

#region Global initialization

ini_open("globalsave.ini")

global.language = ini_read_real("options", "language", languages.english)

ini_close()

global.language_text_map = ds_map_create()

global.language_sprites = [spr_tv_c_bubble,
						  spr_combotitles,
						  spr_combovery,
						  spr_comboend,
						  spr_menustatus,
						  spr_menupause,
						  spr_menuquit,
						  spr_menudelete,
						  spr_menustatus_judgement]

global.language_sprite_backups_english = []

for (var i = 0; i < array_length(global.language_sprites); i++) { global.language_sprite_backups_english[global.language_sprites[i]] = sprite_duplicate(global.language_sprites[i]) }

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

#endregion

function lang_load()
{
	var _language_folder = ""
	
	switch global.language
	{
		case languages.english:
			_language_folder = "English"
			break;
		case languages.latam_spanish:
			_language_folder = "Latam Español"
			break;
	}
	
	global.language_directory = working_directory + "Language\\" + _language_folder + "\\"
	
	show_debug_message("Loading language assets from directory " + global.language_directory)
	
	lang_text_apply()
	
	for (var i = 0; i < array_length(global.language_sprites); i++)
	{ 
		var _loaded_sprite = lang_sprite_load(global.language_sprites[i])
		sprite_assign(global.language_sprites[i], _loaded_sprite) 
		sprite_delete(_loaded_sprite)
	}
}

#region Text Functions

function lang_text_apply()
{
	var _buffer = buffer_load(global.language_directory + "Text.json")
	
	if _buffer == -1
	{
		show_debug_message("Could not find text map, not applied. Strings may be undefined and not show.")
		return;
	}
	
	show_debug_message("Found and applied text map.")
	var _string_map = buffer_read(_buffer, buffer_text)
	global.language_text_map = json_decode(_string_map)
	buffer_delete(_buffer)
}

#endregion

#region Sprite Functions

function lang_sprite_load(_sprite)
{
	var _default_sprite = global.language_sprite_backups_english[_sprite]
	
	if global.language == languages.english
		return sprite_duplicate(_default_sprite);
	
	var _sprite_name = sprite_get_name(_sprite)
	
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

			var _buff = buffer_load(_path + ".json")
			var _json_file = buffer_read(_buff, buffer_text)
			var _sprite_data = json_parse(_json_file)
			buffer_delete(_buff)
			
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
		
		var _lang_sprite = sprite_add(_path + ".png", _frames, _removeback, _smooth, _offset_x, _offset_y)
		
		sprite_set_bbox_mode(_lang_sprite, _bbox_mode)
		sprite_set_bbox(_lang_sprite, _bbox_left, _bbox_top, _bbox_right, _bbox_bottom)
		sprite_set_speed(_lang_sprite, _speed_fps, _speed_type)
		sprite_set_nineslice(_lang_sprite, _nineslice)
		
		show_debug_message("Sprite loaded")
		
		return _lang_sprite;
	}
	else
	{
		show_debug_message("Failed to load. Falling back to default sprite")
		return sprite_duplicate(_default_sprite);
	}
}

#endregion
