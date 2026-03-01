global.room_switching = false;
is_hooked = false;
hook_inst = noone; 
visible = false;
active  = false;

err_timer = irandom_range(10, 40);
err_max_spd = 3.5;
err_kick = 1.2;
err_wander = 0.25;

vx = random_range(-0.6, 0.6);
vy = random_range(-0.4, 0.4);
drag = 0.985;
max_spd = 2.0;

active = true;
target_text = "THIS SHOULD SHOW";
cursor = 1;

hook_drag = 0.92;
hook_max_spd = 1;
hook_force_scale = 0.5;