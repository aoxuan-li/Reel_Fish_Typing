visible = false;
active  = false;
STATE_FREE   = 0;
STATE_HOOKED = 1;

state = STATE_FREE;
active = false;
move_spd = 6;

hooked_fish = noone;
offx = 0;
offy = 0;

attach_offx = 0;
attach_offy = 0;

if (sprite_index != -1) {
    attach_offx = ((sprite_get_bbox_left(sprite_index) + sprite_get_bbox_right(sprite_index)) * 0.5) - sprite_get_xoffset(sprite_index);
    attach_offy = (sprite_get_bbox_top(sprite_index)) - sprite_get_yoffset(sprite_index);
}