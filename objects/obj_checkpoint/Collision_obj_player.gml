if sprite_index == spr_checkpoint
{
	reset_anim(spr_checkpoint_activation)
	fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/checkpoint", x, y)
	other.xstart = self.x
	other.ystart = self.y
}
