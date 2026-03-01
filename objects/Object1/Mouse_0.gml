layer_background_visible(bg_boat, false);

layer_background_visible(bg_mid, true);
layer_background_alpha(bg_mid, 1);

instance_destroy();

if (bg_start_layer != -1) {
    layer_background_visible(bg_start_layer, false);
}

if (!audio_is_playing(waves)) {
    audio_play_sound(waves, 1, false);
	audio_sound_gain(waves, 2.00, 0);
}

with (fishline) {
    enabled = true;
    visible = true;
    if (instance_exists(hook_inst)) {
        hook_inst.active  = true;
        hook_inst.visible = true;
    }
}

with (fish) {
    active  = true;
    visible = true;
}

with (obj_typing) {
	visible = true; 
}