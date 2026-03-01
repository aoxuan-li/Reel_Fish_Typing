enabled = false;
visible  = false;

seg_len     = 18;
seg_count   = 25;
solve_iters = 8;
gravity     = 0.35;
drag        = 0.99;

cam = view_camera[0];

rod_x = camera_get_view_x(cam) + camera_get_view_width(cam) * 0.5;
rod_y = camera_get_view_y(cam) + 20;

xpt   = array_create(seg_count);
ypt   = array_create(seg_count);
xprev = array_create(seg_count);
yprev = array_create(seg_count);

hook_inst = instance_create_depth(rod_x, rod_y + seg_len * (seg_count - 1), 0, hook);
hook_inst.active = false;

for (var i = 0; i < seg_count; i++) {
    xpt[i]   = rod_x;
    ypt[i]   = rod_y + i * seg_len;
    xprev[i] = xpt[i];
    yprev[i] = ypt[i];
}