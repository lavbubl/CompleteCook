enum notification_type
{
	unknown_value0,
	unknown_value1
}

if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}
achievements_update = ds_list_create()
achievements_notify = ds_list_create()
notify_queue = ds_queue_create()
