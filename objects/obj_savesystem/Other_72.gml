var ident = ds_map_find_value(async_load, "id")
var status = ds_map_find_value(async_load, "status")
var error = ds_map_find_value(async_load, "error")
switch state
{
	case 1:
		if (ident == saveid)
		{
			buffer_delete(savebuff)
			trace("Save status: ", status, ", error: ", error)
			state = 0
		}
		break
	case 2:
		if (ident == loadid)
		{
			var buffstring = buffer_read(loadbuff, buffer_string)
			ini_open_from_string(buffstring)
			global.entrancecutscene = ini_read_real("cutscene", "entrance", 0)
			global.medievalcutscene = ini_read_real("cutscene", "medieval", 0)
			global.ruincutscene = ini_read_real("cutscene", "ruin", 0)
			global.dungeoncutscene = ini_read_real("cutscene", "dungeon", 0)
			global.desertcutscene = ini_read_real("cutscene", "desert", 0)
			global.graveyardcutscene = ini_read_real("cutscene", "graveyard", 0)
			global.farmcutscene = ini_read_real("cutscene", "farm", 0)
			global.spacecutscene = ini_read_real("cutscene", "space", 0)
			global.beachcutscene = ini_read_real("cutscene", "beach", 0)
			global.forestcutscene = ini_read_real("cutscene", "forest", 0)
			global.pinballcutscene = ini_read_real("cutscene", "pinball", 0)
			global.golfcutscene = ini_read_real("cutscene", "golf", 0)
			global.streetcutscene = ini_read_real("cutscene", "street", 0)
			global.sewercutscene = ini_read_real("cutscene", "sewer", 0)
			global.factorycutscene = ini_read_real("cutscene", "factory", 0)
			global.freezercutscene = ini_read_real("cutscene", "freezer", 0)
			global.chateaucutscene = ini_read_real("cutscene", "chateau", 0)
			global.mansioncutscene = ini_read_real("cutscene", "mansion", 0)
			global.kidspartycutscene = ini_read_real("cutscene", "kidsparty", 0)
			global.warcutscene = ini_read_real("cutscene", "war", 0)
			global.entrancetreasure = ini_read_real("Treasure", "entrance", 0)
			global.medievaltreasure = ini_read_real("Treasure", "medieval", 0)
			global.ruintreasure = ini_read_real("Treasure", "ruin", 0)
			global.dungeontreasure = ini_read_real("Treasure", "dungeon", 0)
			global.deserttreasure = ini_read_real("Treasure", "desert", 0)
			global.graveyardtreasure = ini_read_real("Treasure", "graveyard", 0)
			global.farmtreasure = ini_read_real("Treasure", "farm", 0)
			global.spacetreasure = ini_read_real("Treasure", "space", 0)
			global.beachtreasure = ini_read_real("Treasure", "beach", 0)
			global.foresttreasure = ini_read_real("Treasure", "forest", 0)
			global.pinballtreasure = ini_read_real("Treasure", "pinball", 0)
			global.golftreasure = ini_read_real("Treasure", "minigolf", 0)
			global.streettreasure = ini_read_real("Treasure", "street", 0)
			global.sewertreasure = ini_read_real("Treasure", "sewer", 0)
			global.factorytreasure = ini_read_real("Treasure", "factory", 0)
			global.freezertreasure = ini_read_real("Treasure", "freezer", 0)
			global.chateautreasure = ini_read_real("Treasure", "chateau", 0)
			global.mansiontreasure = ini_read_real("Treasure", "mansion", 0)
			global.kidspartytreasure = ini_read_real("Treasure", "kidsparty", 0)
			global.wartreasure = ini_read_real("Treasure", "war", 0)
			with (obj_achievementtracker)
			{
				achievements_load(achievements_update)
				achievements_load(achievements_notify)
			}
			ini_str = ini_close()
			buffer_delete(loadbuff)
			trace("inistr: ", ini_str)
			trace("buffstring: ", buffstring)
			state = 0
		}
		break
}

