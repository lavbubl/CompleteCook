if sprite_index != spr_gerome_collected
	exit;

instance_destroy()
with obj_followerhandler
	array_push(followers, create_follower(other.x, other.y, spr_gerome_keyidle, spr_gerome_keymove, spr_gerome_keyidle, spr_gerome_taunt))
