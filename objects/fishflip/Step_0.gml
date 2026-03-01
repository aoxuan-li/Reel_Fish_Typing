flip_timer--;
if (flip_timer <= 0) {
    image_xscale = -image_xscale;
    flip_timer = 24;
}