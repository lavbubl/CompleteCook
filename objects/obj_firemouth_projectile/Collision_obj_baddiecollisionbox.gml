with (other)
{
	if (instance_exists(baddieID) && baddieID.state != states.grabbed && baddieID.object_index != obj_tank && (!baddieID.invincible))
	{
		instance_destroy()
		instance_destroy(baddieID)
	}
}
instance_destroy()
