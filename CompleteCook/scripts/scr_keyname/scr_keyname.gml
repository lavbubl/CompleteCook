function scr_keyname(keycode)
{
	switch keycode
	{
		case vk_up: return "UP";
		case vk_right: return "RIGHT";
		case vk_left: return "LEFT";
		case vk_down: return "DOWN";
		case vk_enter: return "ENTER";
		case vk_escape: return "ESCAPE";
		case vk_space: return "SPACE";
		case vk_rshift: return "SHIFT";
		case vk_lshift: return "SHIFT";
		case vk_shift: return "SHIFT";
		case vk_control: return "CONTROL";
		case vk_lcontrol: return "CONTROL";
		case vk_rcontrol: return "CONTROL";
		case vk_alt: return "ALT";
		case vk_lalt: return "ALT";
		case vk_backspace: return "BACKSPACE";
		case vk_tab: return "TAB";
		case vk_home: return "HOME";
		case vk_end: return "END";
		case vk_delete: return "DELETE";
		case vk_insert: return "INSERT";
		case vk_pageup: return "PAGE UP";
		case vk_pagedown: return "PAGE DOWN";
		case vk_pause: return "PAUSE";
		case vk_printscreen: return "PRINTSCREEN";
		case vk_f1: return "F1";
		case vk_f2: return "F2";
		case vk_f3: return "F3";
		case vk_f4: return "F4";
		case vk_f5: return "F5";
		case vk_f6: return "F6";
		case vk_f7: return "F7";
		case vk_f8: return "F8";
		case vk_f9: return "F9";
		case vk_f10: return "F10";
		case vk_f11: return "F11";
		case vk_f12: return "F12";
		case vk_numpad0: return "NUMPAD 0";
		case vk_numpad1: return "NUMPAD 1";
		case vk_numpad2: return "NUMPAD 2";
		case vk_numpad3: return "NUMPAD 3";
		case vk_numpad4: return "NUMPAD 4";
		case vk_numpad5: return "NUMPAD 5";
		case vk_numpad6: return "NUMPAD 6";
		case vk_numpad7: return "NUMPAD 7";
		case vk_numpad8: return "NUMPAD 8";
		case vk_numpad9: return "NUMPAD 9";
		case vk_multiply: return "MULTIPLY";
		case vk_divide: return "DIVIDE";
		case vk_add: return "ADD";
		case vk_subtract: return "SUBTRACT";
		case vk_decimal: return "DECIMAL";
		case -1: return "PRESS KEY";
	}
	return chr(keycode);
}

