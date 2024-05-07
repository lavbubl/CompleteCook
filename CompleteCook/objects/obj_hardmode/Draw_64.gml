if (global.hardmode && (!((room == strongcold_endscreen or room == rank_room or room == timesuproom or room == Realtitlescreen or room == characterselect))))
	draw_sprite(asset_get_index(("spr_heatmeter" + string((global.heatmeter_threshold + 1)))), 0, 480, 96)
