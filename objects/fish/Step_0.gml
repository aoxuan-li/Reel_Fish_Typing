if (!active) exit;

x += vx;
y += vy;

vx *= drag;
vy *= drag;

var spd = point_distance(0, 0, vx, vy);
if (spd > 2.0) {
	vx += random_range(-0.4, 0.4);
    vy += random_range(-0.3, 0.3);
}

if (irandom(60) == 0) {
    vx += random_range(-0.4, 0.4);
    vy += random_range(-0.3, 0.3);
}
if (is_hooked && instance_exists(hook_inst)) {

    vx *= hook_drag;
    vy *= hook_drag;

    var tx, ty;

	if (variable_global_exists("line_anchor_x")) {
		tx = global.line_anchor_x;
		ty = global.line_anchor_y;
	} else {
		var cam2 = view_camera[0];
		tx = camera_get_view_x(cam2) + camera_get_view_width(cam2) * 0.5;
		ty = camera_get_view_y(cam2) + 20;
	}

    var dx = tx - x;
    var dy = ty - y;
    var d  = max(1, sqrt(dx*dx + dy*dy));

    var nx = dx / d;
    var ny = dy / d;

    var p = 0;
    if (instance_exists(obj_typing)) p = obj_typing.reel_power;

    var force = p * 1.2 * hook_force_scale;
    vx += nx * force;
    vy += ny * force;

    var spd = sqrt(vx*vx + vy*vy);
    if (spd > hook_max_spd) {
        vx = vx / spd * hook_max_spd;
        vy = vy / spd * hook_max_spd;
    }
}

var cam = view_camera[0];
var vx0 = camera_get_view_x(cam);
var vy0 = camera_get_view_y(cam);
var vw  = camera_get_view_width(cam);
var vh  = camera_get_view_height(cam);

var margin = 80;

if (is_hooked) {
	var tx = global.line_anchor_x;
	var ty = global.line_anchor_y;

	if (point_distance(x, y, tx, ty) < 30) { 
	    if (!global.room_switching) {
	        global.room_switching = true;
			audio_stop_sound(main_theme);
	        room_goto(rm_win);
	    }
	}
    if (x < vx0 - margin || x > vx0 + vw + margin || y < vy0 - margin || y > vy0 + vh + margin) {
        is_hooked = false;
		if (!global.room_switching) {
			global.room_switching = true;
			audio_stop_sound(main_theme);
			room_goto(rm_lose);
		}

        if (instance_exists(hook_inst)) {
            hook_inst.state = hook_inst.STATE_FREE;
            hook_inst.hooked_fish = noone;
        }

        if (instance_exists(obj_typing)) obj_typing.active = false;
    }
}
if (!is_hooked) {

    vx += random_range(-err_wander, err_wander);
    vy += random_range(-err_wander, err_wander);

    err_timer--;
    if (err_timer <= 0) {
        var ang = random(360);
        vx += lengthdir_x(err_kick, ang);
        vy += lengthdir_y(err_kick, ang);

        err_timer = irandom_range(10, 45);
    }

    var spd = sqrt(vx*vx + vy*vy);
    if (spd > err_max_spd) {
        vx = vx / spd * err_max_spd;
        vy = vy / spd * err_max_spd;
    }
}