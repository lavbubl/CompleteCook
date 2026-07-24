fmod_3d_attributes.attributes.position.x = camera_get_view_x(view_camera[0]) + (screen_w / 2)
fmod_3d_attributes.attributes.position.y = camera_get_view_y(view_camera[0]) + (screen_h / 2)

if (USE_FMOD_STUDIO) {
	/*
		If you are only using Studio you need this.
        This call will update the STUDIO system and the underlying CORE system.
	*/
	fmod_studio_system_set_listener_attributes(0, fmod_3d_attributes.attributes);
	fmod_studio_system_update();
}
else {
	/*
		If you are only using Core you only need this.
	*/
	fmod_system_update();
	//fmod_system_set_3d_listener_attributes(0, fmod_3d_attributes.attributes.position, fmod_3d_attributes.attributes.velocity, )
}
