with (other)
{
	if (other.visible)
	{
		switch character
		{
			case "P":
				character = "V"
				break;
			case "V":
				character = "P"
				break;
		}
		other.respawn = 200
		other.visible = false
		scr_characterspr()
	}
}
