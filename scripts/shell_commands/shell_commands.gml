var i = 0
while room_exists(i)
{
	global.roomlist[i] = room_get_name(i)
	i++
}

function sh_panic (args) {
	var panic = false
	
	if (args[1] == "true" || args[1] == true)
		panic = true
	
	global.panic.active = args[1]
	global.panic.timer = args[2]
	global.panic.timer_max = args[2]
}

function meta_panic() {
	return {
		description: "Activates pizza time",
		arguments: ["active", "time"],
		suggestions: [
			["true", "false"],
			["5000"]
		],
		argumentDescriptions: [
			"activates or deactivates panic timer",
			"time to use"
		],
		hidden: false,
		deferred: false
	}
}

function sh_noclip (args) {
	obj_player.state = states.noclip
}

function meta_noclip() {
	return {
		description: "Resets state and you can move anywhere",
		hidden: false,
		deferred: false
	}
}

function sh_room_goto (args) {
	room_goto(asset_get_index(args[1]))
	obj_player.spawn = args[2]
}

function meta_room_goto() {
	return {
		description: "Goes to any room",
		arguments: ["room", "door"],
		suggestions: [
			global.roomlist,
			["a", "b", "c", "d", "e", "f", "g"]
		],
		hidden: false,
		deferred: false
	}
}

function sh_togglecollisions (args) {
	var visibility = false
	
	if (args[1] == "true" || args[1] == true)
		visibility = true
	
	global.showcollisions = visibility
	
	for (var i = 0; i < ds_list_size(global.col_obj_list); i++) 
	{
		var _id = ds_list_find_value(global.col_obj_list, i)
		if instance_exists(_id)
		{
			switch (_id.object_index)
			{
				case obj_solid:
				case obj_platform:
				case obj_slope:
				case obj_slopeplatform:
					_id.visible = visibility
					break;
			}
		}
	}
	if instance_exists(obj_doorpoint)
		obj_doorpoint.visible = visibility
}

function meta_togglecollisions() {
	return {
		description: "Toggles the visibility of collision objects",
		arguments: ["visible"],
		suggestions: [
			["true", "false"],
		],
		hidden: false,
		deferred: false
	}
}

function sh_set_combo (args) {
	global.combo.count = real(args[1])
	global.combo.timer = real(args[2])
	
	if args[1] == 0 || args[1] >= 10
		obj_player.supertauntcount = 10
}

function meta_set_combo() {
	return {
		description: "Set the combo and fill ammount",
		arguments: ["count", "fill"],
		suggestions: [
			["10", "0"],
			["60"]
		],
		hidden: false,
		deferred: false
	}
}
