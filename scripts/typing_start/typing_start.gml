function typing_start(_fish, _hook) {
    show_debug_message("typing_start CALLED");

    if (!instance_exists(obj_typing)) {
        instance_create_depth(0, 0, -100000, obj_typing);
        show_debug_message("typing_start created obj_typing");
    }

    with (obj_typing) {
        active = true;
        fish_ref = _fish;
        hook_ref = _hook;

        target_text = make_prompt(250);
        cursor = 1;

        keys_in_window = 0;
        window_start_time = current_time;
        current_wpm = 0;
        reel_power = 0;

        keyboard_string = "";
    }
}