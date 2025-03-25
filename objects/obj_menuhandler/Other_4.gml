with obj_menutvnode //this should be done with every obj_menutvnode
{
	var pos = other.tvs[self.number - 1]
	pos.x = self.x
	pos.y = self.y
	pos.sprs = {
		off: self.spr_off,
		whitenoise: self.spr_whitenoise,
		selected: self.spr_selected,
		confirm: self.spr_confirm
	}
	pos.filename = self.filename == "" ? string(number) : filename
}

show_debug_message(tvs)