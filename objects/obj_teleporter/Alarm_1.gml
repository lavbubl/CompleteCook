if instance_exists(obj_teleporterexit)
{
	with obj_teleporterexit
	{
		if warptag == other.warptag
		{
			var p = other.playerid
			
			p.visible = true
			p.warping = false
			p.state = other.prev_state
			p.image_index = other.prev_ix
			
			repeat 8
				create_effect(x + random_range(50, -50), y + random_range(50, -50), spr_teleportdebris)
			create_effect(p.x, p.y, spr_teleporteffect)
			
			scr_sound_3d(sfx_teleportexit, x, y)
		}
	}
}
