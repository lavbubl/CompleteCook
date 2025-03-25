if (timer > 0)
    timer--
else
{
    timer = timer_max
    if (comboscore > 0)
    {
        if (combominus <= 1)
            combominus = 1
        comboscore -= round(combominus)
        if (comboscore < 0)
            comboscore = 0
			
		var type = choose("mushroom", "cheese", "pineapple", "sausage", "tomato")
		var col_spr = asset_get_index($"spr_{type}collect")
		
		var c = {
			sprite_index: col_spr,
			image_index: self.image_index,
			x: self.x,
			y: self.y + 20,
			val: round(combominus)
		}
		
		global.score += round(combominus)

		array_push(obj_collect_got_visual.collects, c)
	}
    else if (alarm[1] == -1)
        alarm[1] = 50
}
if (global.combo.timer > 0 && global.combo.count > 0)
    y = approach(y, (ystart + 100), 10)
title_index += 0.35
if (title_index >= 2)
    title_index = frac(title_index)
if (room == rank_room || room == rm_timesup)
    instance_destroy()
