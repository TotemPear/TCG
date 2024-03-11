/// @desc Draw text

draw_set_alpha(1);
draw_set_font(fGood);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

draw_set_color(c_black);
draw_text(x-1, y-1, text);
draw_text(x+1, y-1, text);
draw_text(x-1, y+1, text);
draw_text(x+1, y+1, text);

draw_set_color(c_aqua);
draw_text(x, y, text);
