var t_str = ""

switch (toppin)
{
	case toppin_enum.shroom:
		t_str = "spr_shroomtoppin"
		break;
	case toppin_enum.cheese:
		t_str = "spr_cheesetoppin"
		break;
	case toppin_enum.tomato:
		t_str = "spr_tomatotoppin"
		break;
	case toppin_enum.sausage:
		t_str = "spr_sausagetoppin"
		break;
	case toppin_enum.pineapple:
		t_str = "spr_pineappletoppin"
		break;
}

var sprs = {
	idle: asset_get_index($"{t_str}_idle"),
	move: asset_get_index($"{t_str}_move"),
	panic: asset_get_index($"{t_str}_panic"),
	taunt: asset_get_index($"{t_str}_taunt"),
	intro: asset_get_index($"{t_str}_intro")
}

with obj_followerhandler
	array_push(followers, create_follower(other.x, other.y, sprs.idle, sprs.move, sprs.panic, sprs.taunt, sprs.intro))

instance_destroy()
