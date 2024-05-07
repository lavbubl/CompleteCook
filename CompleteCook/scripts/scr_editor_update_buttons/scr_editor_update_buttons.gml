function scr_editor_update_buttons()
{
	button = noone
	with (obj_button)
	{
		if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self)
		{
			other.button = id
			hovered = 1
		}
		else
			hovered = 0
	}
	with (button)
		other.info = info
	if (button == noone)
		info = -4
	if key_mbleft2
	{
		if (button != noone)
		{
			with (obj_button)
			{
				if (id == other.button)
				{
					if (!selected)
					{
						selected = 1
						if (OnSelect != -4)
							OnSelect()
					}
					else
					{
						selected = 0
						if (OnDeselect != -4)
							OnDeselect()
					}
				}
				else if (other.button.parent != id)
				{
					if selected
					{
						if (OnDeselect != -4)
							OnDeselect()
					}
					selected = 0
				}
			}
		}
		else
		{
			with (obj_button)
			{
				if selected
				{
					if (OnDeselect != -4)
						OnDeselect()
				}
				selected = 0
			}
		}
	}
	exit;
}

