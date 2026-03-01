visible = true;

if (!active) exit;

var s = keyboard_string;
if (string_length(s) > 0) {
    for (var i = 1; i <= string_length(s); i++) {
        var ch = string_char_at(s, i);

        if (cursor <= string_length(target_text) && ch == string_char_at(target_text, cursor)) {
            cursor++;

            array_push(char_times, current_time);
            while (array_length(char_times) > wpm_chars) {
                array_delete(char_times, 0, 1);
            }
        }

        if (cursor > string_length(target_text)) {
            target_text = make_prompt(100);
            cursor = 1;
            scroll_char = 1;

            char_times = array_create(0);
            current_wpm = 0;
            reel_power = 0;

            break;
        }
    }
    keyboard_string = "";
}

var n = array_length(char_times);

if (n >= 2) {
    var t_first = char_times[0];
    var t_last  = char_times[n - 1];

    var idle_ms = current_time - t_last;

    var end_t = (idle_ms > 50) ? current_time : t_last;

    var dt_ms = max(1, end_t - t_first);

    var chars_per_min = (n / (dt_ms / 60000.0));
    var wpm_raw = chars_per_min / 5.0;

    if (idle_ms > 500) {
        wpm_raw = 0;
    }

    current_wpm = lerp(current_wpm, wpm_raw, wpm_smooth);
}
else {
    current_wpm = lerp(current_wpm, 0, 0.2);
}

var diff = current_wpm - wpm_threshold;
if (diff >= 0) reel_power = min(1, diff / 30.0);
else           reel_power = -min(1, (-diff) / 30.0);

var max_visible_chars = 70;
if (cursor - scroll_char > max_visible_chars) {
    scroll_char = cursor - max_visible_chars;
}
if (scroll_char < 1) scroll_char = 1;