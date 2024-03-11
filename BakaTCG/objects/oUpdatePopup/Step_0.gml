if (timer > timerMax/3){
	y = lerp(y,yTarget,accel);
} else{
	y = lerp(y,0,accel);
	if (timer < 0){
		instance_destroy();
	}
}

timer--;

