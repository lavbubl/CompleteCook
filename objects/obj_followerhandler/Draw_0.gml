for (var i = array_length(followers) - 1; i >= 0; i--) //go reverse for depth
{
	var follower = followers[i]
	var vs = obj_player.visual_size
	if (follower.sprite_index != noone && obj_player.visible)
		draw_sprite_ext(follower.sprite_index, follower.image_index, follower.x, follower.y, obj_player.xscale * vs, 1 * vs, 0, obj_player.image_blend, obj_player.image_alpha)
}
