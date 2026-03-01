draw_set_font(fnt_massive);
draw_set_color(c_yellow);

var msg = "FISH ON!!";
var x1 = (display_get_gui_width() - string_width(msg)) * 0.5;
var y1 = 10;

draw_text(x1, y1, msg);