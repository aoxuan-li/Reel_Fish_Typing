visible = true;
if (!active) exit;

draw_set_alpha(1);
draw_set_color(c_white);

var gw = display_get_gui_width();
var gh = display_get_gui_height();

var margin = 20;
var panel_h = 200;

var x0 = margin;
var y0 = gh - margin - panel_h;
var x1 = gw - margin;
var y1 = gh - margin;

draw_set_alpha(0.80);
draw_set_color(c_black);
draw_rectangle(x0, y0, x1, y1, false);

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(-1);
draw_set_font(fnt_typing_med);
draw_text(x0 + 16, y0 + 12,
    "WPM: " + string(round(current_wpm)) + " / " + string(wpm_threshold) +
    " | reel=" + string(reel_power) + " | Campfire London"
);


var max_w = (x1 - x0) - 50;
var start_idx = scroll_char;

draw_set_font(fnt_typing_big);

while (start_idx < cursor) {
    var typed_slice = string_copy(target_text, start_idx, cursor - start_idx);
    if (string_width(typed_slice) <= max_w - 40) break;
    start_idx++;
}
scroll_char = start_idx;

var slice_len = 240;
var slice = string_copy(target_text, scroll_char, slice_len);

var typed_count = clamp(cursor - scroll_char, 0, string_length(slice));
var typed_part  = string_copy(slice, 1, typed_count);
var rest_part   = string_copy(slice, typed_count + 1, string_length(slice) - typed_count);

var header_h = 34;
var pad_x = 16;
var pad_y = 12;

var inner_top = y0 + pad_y + header_h;
var inner_bot = y1 - pad_y;
var inner_h   = inner_bot - inner_top;

var line_h = string_height("Hg");

var ty = inner_top + max(0, (inner_h - line_h) * 0.5);
var tx = x0 + pad_x;

draw_set_color(c_lime);
draw_text(tx, ty, typed_part);

var typed_w = string_width(typed_part);

draw_set_color(c_white);
draw_text(tx + typed_w, ty, rest_part);
draw_text(tx + typed_w, ty, "|");

draw_set_font(-1);