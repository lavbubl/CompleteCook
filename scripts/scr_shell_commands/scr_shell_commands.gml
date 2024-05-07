//obj_shell commands to use ingame
#region Roomnames
var i = 0;
while room_exists(i)
{
	global.roomlist[i] = room_get_name(i)
	i++
}	
#endregion	

#region Collision

function sh_toggle_collisions(args) 
{
	var arg1 = args[1]	
	switch arg1
	{
		case "true": 
		case "1":
		arg1 = true 
		break;
		case "false": 
		case "0":
		arg1 = false 
		break;
		default: 
		arg1 = !global.showcollisions
		break;		
	}	
	global.showcollisions = arg1 
	toggle_collision_function()
}
function meta_toggle_collisions() 
{
	return {
		description: "toggles collision object visibility",
		arguments: ["<bool>"],
		suggestions: [
			["true","false"]
		],
		argumentDescriptions: [
			"toggles visibility"
		]
	}
}
function toggle_collision_function()
{
	if !variable_global_exists("showcollisionarray")
	{	
		var i = 0;
		global.showcollisionarray[i++] = obj_solid;
		global.showcollisionarray[i++] = obj_slope;
		global.showcollisionarray[i++] = obj_platform;
		global.showcollisionarray[i++] = obj_secretbigblock;
		global.showcollisionarray[i++] = obj_secrettrigger;
		global.showcollisionarray[i++] = obj_secretblock;
		global.showcollisionarray[i++] = obj_secretdestroyable;
		global.showcollisionarray[i++] = obj_secretmetalblock;
		global.showcollisionarray[i++] = obj_crashplaneblock;
		global.showcollisionarray[i++] = obj_mach3solid;
		global.showcollisionarray[i++] = obj_iceblock;
		global.showcollisionarray[i++] = obj_iceblockslope;
	}
	var array  = global.showcollisionarray
	var length = array_length(array)
	//Start from the end to the start (more optimized)

	for (var i = length - 1; i >= 0; --i)
	{
		with array[i]
		{
			if (object_index == array[i])
				visible = global.showcollisions
		}
	}
	layer_set_visible("Tiles_Solid",global.showcollisions)
}
#endregion

#region Hitboxes

function sh_toggle_hitboxes(args) 
{
	var arg1 = args[1]	
	switch arg1
	{
		case "true": 
		case "1":
		arg1 = true 
		break;
		case "false": 
		case "0":
		arg1 = false 
		break;
		default: 
		arg1 = !global.showhitboxes
		break;		
	}	
	global.showhitboxes = arg1 
	toggle_hitboxes_function()
}
function meta_toggle_hitboxes() 
{
	return {
		description: "toggles hitbox object visibility",
		arguments: ["<bool>"],
		suggestions: [
			["true","false"]
		],
		argumentDescriptions: [
			"toggles visibility for hitboxes"
		]
	}
}
function toggle_hitboxes_function()
{
	if !variable_global_exists("showcollisionarray")
	{	
		var i = 0;
		global.showhitboxesarray[i++] = obj_slaphitbox;
		global.showhitboxesarray[i++] = obj_bosshitbox;
		global.showhitboxesarray[i++] = obj_chargeenemyhitbox;
		global.showhitboxesarray[i++] = obj_moustachehitbox;
		global.showhitboxesarray[i++] = obj_weeniehitbox;
		global.showhitboxesarray[i++] = obj_millionpunchhitbox;
		global.showhitboxesarray[i++] = obj_pineabreakdancehitbox;
		global.showhitboxesarray[i++] = obj_playersmokehitbox;
		global.showhitboxesarray[i++] = obj_wordhitbox;
		global.showhitboxesarray[i++] = obj_lungehitbox;
		global.showhitboxesarray[i++] = obj_mouthhitbox;
		global.showhitboxesarray[i++] = obj_swordhitbox;
		global.showhitboxesarray[i++] = obj_slaphitbox2;
		global.showhitboxesarray[i++] = obj_swingdinghitbox;
		global.showhitboxesarray[i++] = obj_morthitbox;
		global.showhitboxesarray[i++] = obj_pepgoblin_kickhitbox;
		global.showhitboxesarray[i++] = obj_minijohn_hitbox;
		global.showhitboxesarray[i++] = obj_parryhitbox;
		global.showhitboxesarray[i++] = obj_pineahitbox;
		global.showhitboxesarray[i++] = obj_forkhitbox;
		global.showhitboxesarray[i++] = obj_baddieragehitbox;
		global.showhitboxesarray[i++] = obj_peasantohitbox;
		global.showhitboxesarray[i++] = obj_enguardehitbox;
	}
	var array  = global.showhitboxesarray
	var length = array_length(array)
	//Start from the end to the start (more optimized)

	for (var i = length - 1; i >= 0; --i)
	{
		with array[i]
		{
			if (object_index == array[i])
				visible = global.showhitboxes
		}
	}
}
#endregion

#region Room Goto
	///commands[arrayi++] = "room_goto [roomname] [targetdoor]"
	function sh_room_goto(args) 
	{
		var arg1 = asset_get_index(args[1]), arg2 = args[2]	
		//Error Check 
		if asset_get_type(args[1]) != asset_room { return "Can't find room " + string(args[1]); } //Shamelessy took this from Ethgaming
		//Go to Room
		if asset_get_type(args[1]) = asset_room
		{
			obj_player1.targetRoom = arg1
			obj_player2.targetRoom = arg1
			obj_player1.targetDoor = arg2
			obj_player2.targetDoor = arg2
			instance_create(0, 0, obj_fadeout) 			
		}
	}
	function meta_room_goto() 
	{	
		return {
			description: "allows you to go to another room",
			arguments: ["<room>","<door>"],
			suggestions: [
				global.roomlist,
				["N/A","A","B","C","D","E","F","G","H","I","J","K","start"]
			],
			argumentDescriptions: [
				"sets targetRoom",
				"sets targetDoor"
			]
		}
	}	


	#endregion
	
#region Noclip
	function sh_noclip() 
	{
		obj_player.state = states.debugstate
	}
	function meta_noclip() 
	{	
		return {
			description: "allows you to go through walls"
		}
	}

#endregion

#region Panic
	function sh_panic(args) {
		var fill = args[1]
		global.panic = true
		global.fill = fill
		with (obj_tv)
			chunkmax = global.fill
	}
	function meta_panic() 
	{	
		return {
			description: "activates pizza time",
			arguments: ["<fill>"],
			suggestions: [
				4000
			],
			argumentDescriptions: [
				"sets fill timer",
			]
		}
	}	
#endregion
