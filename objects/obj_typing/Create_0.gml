visible = true;

active = false;
target_text = "WAITING FOR HOOK...";
cursor = 1;

wpm_chars = 25;
char_times = array_create(0);
current_wpm = 0;

wpm_window_ms = 2000;
wpm_update_ms = 250;
wpm_last_update = current_time;

keys_in_window = 0;
window_start_time = current_time;

current_wpm = 0;
wpm_smooth = 0.25;
wpm_threshold = 80;
reel_power = 0;

scroll_char = 1;

fish_ref = noone;
hook_ref = noone;

word_bank = [
    "ocean","reef","bubble","kelp","current","tide","depth","coral","shell","wave",
    "blue","school","drift","anchor","splash","shadow","sand","stone","fish","hook",
    "algae","foam","shark", "orca", "campfire", "london"
];

keyboard_string = "";