scr_sound(sfx_collecttoppin)
instance_destroy()
with obj_followerhandler
	array_push(followers, create_follower(other.x, other.y, spr_shroomtoppin_idle, spr_shroomtoppin_move, spr_shroomtoppin_panic, spr_shroomtoppin_taunt))

global.score += 1000

with instance_create(x, y, obj_collect_number)
	num = 1000