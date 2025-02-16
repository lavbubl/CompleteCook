for (var i = 0; i < array_length(followers); i++) 
{
	var follower = followers[i]
	if follower.sprite_index != noone
		draw_sprite_ext(follower.sprite_index, follower.image_index, follower.x, follower.y, obj_player.xscale, 1, 0, obj_player.image_blend, obj_player.image_alpha)
}
