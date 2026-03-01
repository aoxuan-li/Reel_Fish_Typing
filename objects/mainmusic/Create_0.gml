if (!audio_is_playing(main_theme)) {
    audio_play_sound(main_theme, 0, true);
}
audio_sound_gain(main_theme, 0.50, 0);