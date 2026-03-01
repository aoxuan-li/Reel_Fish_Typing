if (!enabled) exit;

for (var i = 0; i < seg_count - 1; i++) {
    draw_line(xpt[i], ypt[i], xpt[i+1], ypt[i+1]);
}