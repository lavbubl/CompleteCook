/// @param {string} path
function fmod_studio_event_instance_oneshot(_path)
{
	var _event_ref = fmod_studio_system_get_event(_path)
	var _event_desc = fmod_studio_event_description_create_instance(_event_ref)
	fmod_studio_event_instance_start(_event_desc)
	fmod_studio_event_instance_release(_event_desc)
}

/// @param {string} path
/// @param {real} x
/// @param {real} y
function fmod_studio_event_instance_oneshot_3d(_path, _x, _y)
{
	var _event_ref = fmod_studio_system_get_event(_path)
	var _event_desc = fmod_studio_event_description_create_instance(_event_ref)
	var _attributes = fmod_studio_event_instance_get_3d_attributes(_event_desc)
	_attributes.position.x = _x
	_attributes.position.y = _y
	fmod_studio_event_instance_start(_event_desc)
	fmod_studio_event_instance_set_3d_attributes(_event_desc, _attributes)
	fmod_studio_event_instance_release(_event_desc)
}
