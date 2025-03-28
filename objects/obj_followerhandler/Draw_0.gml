for (var i = 0; i < array_length(followers); i++) 
{
	var follower = followers[i]
	var vs = obj_player.visual_size
	if (follower.sprite_index != noone && obj_player.visible)
		draw_sprite_ext(follower.sprite_index, follower.image_index, follower.x, follower.y, obj_player.xscale * vs, 1 * vs, 0, obj_player.image_blend, obj_player.image_alpha)
}
