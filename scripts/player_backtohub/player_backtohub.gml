function player_backtohub()
{
    hsp = 0
    movespeed = 0
	if (sprite_index == spr_player_slipbanana1)
    {
        if (y < ystart)
        {
            y += 20
            if y >= ystart
            {
                scr_sound(sfx_groundpound)
                create_effect(x, y, spr_landeffect)
                y = ystart
                sprite_index = spr_player_rockethitwall
                vsp = -14
                particle_create(x, y + 39, particles.bang)
                image_index = 0
                shake_camera(3, 5 / room_speed)
            }
        }
    }
    else if (sprite_index == spr_player_rockethitwall)
    {
        y += vsp
        if vsp < 20
            vsp += grav
        if (y >= ystart && vsp > 0)
        {
            y = ystart
            sprite_index = spr_player_slipbanana2
            image_index = 0
            vsp = 0
            particle_timer = 25
        }
    }
    else if (sprite_index == spr_player_slipbanana2 && anim_ended())
    {
        image_index = image_number - 1
		image_speed = 0
        if (particle_timer > 0)
            particle_timer--
        else
            state = states.normal
    }
}
