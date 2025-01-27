function sh_panic (args) {
	global.panic = args[1]
	global.panic_timer = args[2]
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
