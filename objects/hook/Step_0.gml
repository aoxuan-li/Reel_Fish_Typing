if (active && state == STATE_FREE) {
    var dx = keyboard_check(vk_right) - keyboard_check(vk_left);
    var dy = keyboard_check(vk_down)  - keyboard_check(vk_up);

    x += dx * move_spd;
    y += dy * move_spd;
}

if (state == STATE_FREE) {
    var f = instance_place(x, y, fish);
    if (f != noone) {
        state = STATE_HOOKED;
        hooked_fish = f;

        offx = x - f.x;
        offy = y - f.y;

        f.is_hooked = true;
        f.hook_inst = id;

        typing_start(f, id);
        show_debug_message("HOOKED -> typing_start called | fish_id=" + string(f.id));
    }
}
else {
    if (!instance_exists(hooked_fish)) {
        state = STATE_FREE;
        hooked_fish = noone;

        if (instance_exists(obj_typing)) obj_typing.active = false;
        show_debug_message("UNHOOKED (fish destroyed) -> typing UI off");
    } else {
        x = hooked_fish.x + offx;
        y = hooked_fish.y + offy;

        if (variable_instance_exists(hooked_fish, "is_hooked") && !hooked_fish.is_hooked) {
            state = STATE_FREE;
            hooked_fish = noone;

            if (instance_exists(obj_typing)) obj_typing.active = false;
            show_debug_message("UNHOOKED (fish escaped flag) -> typing UI off");
        }
    }
}