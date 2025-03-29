old_x2 = x
old_y2 = y

if (obj_player.state == states.taunt && state != 1)
{
    storedstate = state
    storedsprite = sprite_index
    state = 1
    create_effect(x, y, spr_tinytaunt)
    sprite_index = sprs.taunt
    image_index = random(sprite_get_number(sprs.taunt) - 1)
}

switch state
{
    case 0:
        sprite_index = sprs.move
        if scr_solid(x + sign(hsp), y)
            image_xscale *= -1
        else if (!(place_meeting(x + image_xscale * 32, y + 31, obj_solid) || place_meeting(x + image_xscale * 32, y + 31, obj_platform)))
            image_xscale *= -1
        hsp = image_xscale * 2
        x += hsp
        break;
    case 2:
        sprite_index = sprs.idle
        hsp = 0
        break;
    case 1:
        hsp = 0
        if (obj_player.state != states.taunt)
        {
            state = storedstate
            sprite_index = storedsprite
        }
        break;
}
