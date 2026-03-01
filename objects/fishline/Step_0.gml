cam = view_camera[0];
rod_x = camera_get_view_x(cam) + camera_get_view_width(cam) * 0.5;
rod_y = camera_get_view_y(cam) + 20;
global.line_anchor_x = rod_x;
global.line_anchor_y = rod_y;
if (!enabled) exit;

for (var i = 1; i < seg_count; i++) {
    var vx = (xpt[i] - xprev[i]) * drag;
    var vy = (ypt[i] - yprev[i]) * drag;

    xprev[i] = xpt[i];
    yprev[i] = ypt[i];

    xpt[i] += vx;
    ypt[i] += vy + gravity;
}

for (var it = 0; it < solve_iters; it++) {
    xpt[0] = rod_x;
    ypt[0] = rod_y;

    if (instance_exists(hook_inst)) {
        if (hook_inst.state == hook_inst.STATE_FREE) {
            var hx = hook_inst.x + hook_inst.attach_offx;
			var hy = hook_inst.y + hook_inst.attach_offy;

			xpt[seg_count - 1] = hx;
			ypt[seg_count - 1] = hy;
        } else {
            var hx = hook_inst.x + hook_inst.attach_offx;
			var hy = hook_inst.y + hook_inst.attach_offy;

			xpt[seg_count - 1] = hx;
			ypt[seg_count - 1] = hy;
        }
    }

    for (var i = 0; i < seg_count - 1; i++) {
        var dx = xpt[i+1] - xpt[i];
        var dy = ypt[i+1] - ypt[i];
        var d  = max(0.0001, sqrt(dx*dx + dy*dy));
        var diff = (d - seg_len) / d;

        var ox = dx * 0.5 * diff;
        var oy = dy * 0.5 * diff;

        if (i != 0) { xpt[i] += ox; ypt[i] += oy; }
        xpt[i+1] -= ox; ypt[i+1] -= oy;
    }
}