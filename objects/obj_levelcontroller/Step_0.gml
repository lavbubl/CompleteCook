if obj_player.state != states.actor
	global.combo.timer = clamp(approach(global.combo.timer, 0, 0.1), 0, 60)

global.combo.timer = max(global.combo.timer, 0)

if (global.combo.count != prev_combo_count)
{
	if global.combo.count > global.combo.record
		global.combo.record = global.combo.count
	prev_combo_count = global.combo.count
	if (global.combo.count % 5 == 0 && global.combo.count > 0)
	{
		if instance_exists(obj_combotitle)
			instance_destroy(obj_combotitle)
		with (instance_create(x, y, obj_combotitle))
			title = floor(global.combo.count / 5)
	}
}

combo_score = ((global.combo.count ^ 2) * 0.25) + (10 * global.combo.count)

if global.combo.timer <= 0
{
	if global.combo.count > 0
	{
		global.combo.wasted = true
		
		with (instance_create(x, y, obj_comboend))
		{
		    combo = global.combo.count
		    comboscore = other.combo_score
		    comboscoremax = comboscore
		    combominus = round(comboscore / 50)
		}
	}
	
	global.combo.count = 0
}

global.savestring = $"saves/saveData{global.savefile}.ini"

//move all of this combo stuff to its own object
