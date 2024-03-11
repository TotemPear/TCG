text = "A new update is available!\nRestart the game to install it!"

draw_set_font(fGood);

yTarget = string_height(text) + 2
x = window_get_width() - 2;
y = 0;

timerMax = 600;
timer = timerMax;

accel = 0.025;