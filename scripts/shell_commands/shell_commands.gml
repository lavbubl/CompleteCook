function sh_panic (args) {
	global.panic.active = args[1]
	global.panic.timer = args[2]
	global.panic.timer_max = args[2]
}

function meta_panic() {
	return {
		description: "Activates pizza time",
		arguments: ["active", "time"],
		suggestions: [
			"true",
			""
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
			function() {
				return "S"
			},
			["a", "b", "c", "d", "e", "f", "g"]
		],
		hidden: false,
		deferred: false
	}
}

