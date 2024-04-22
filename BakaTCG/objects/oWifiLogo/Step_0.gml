if (global.connected){
	yTarget = window_get_height + 2;
	alphaTarget = -0.02;
}

y = approach(y, yTarget, accel);
image_alpha = approach(image_alpha, 1, alphaAccel);

show_debug_message($"{image_alpha} < 0");
show_debug_message($"{y} > {window_get_height()}");

if (image_alpha < 0 ) || (y > window_get_height()){
	show_debug_message("WHYY")
	instance_destroy();
}