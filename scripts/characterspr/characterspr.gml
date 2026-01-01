function get_characterprefix(_char = character) {
	var _prefixes = ["P", "N"] // Add character prefixes here
	return _prefixes[_char]
}

function get_charactersprite(_sprite, _char = character, _prefix = "spr_player") {
	_char = get_characterprefix(_char)
	var _sprName = sprite_get_name(_sprite)

	_sprName = string_delete(_sprName, 1, string_length(_prefix) + 2)
	_sprName = string("{0}{1}_{2}", _prefix, _char, _sprName)
	_sprName = asset_get_index(_sprName)
	
	if sprite_exists(_sprName)
		return _sprName
	else
		return _sprite
}

function get_charactersprites(_char = character) {
	// Add new sprites here
	return {
		idle: get_charactersprite(spr_playerP_idle, _char),
		move: get_charactersprite(spr_playerP_move, _char),
		jump: get_charactersprite(spr_playerP_jump, _char),
		fall: get_charactersprite(spr_playerP_fall, _char),
		
		// Character specific sprites
		wallbounce: get_charactersprite(spr_playerN_wallbounce, _char),
		divebomb: get_charactersprite(spr_playerN_divebomb, _char),
		divebombfall: get_charactersprite(spr_playerN_divebombfall, _char),
		divebombland: get_charactersprite(spr_playerN_divebombland, _char),
	}
}