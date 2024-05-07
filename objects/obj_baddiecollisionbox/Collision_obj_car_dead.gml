if (instance_exists(baddieID) && other.thrown == true && baddieID.destroyable)
{
	instance_destroy()
	instance_destroy(baddieID)
}
