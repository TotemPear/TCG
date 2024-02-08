draw_set_font(menu_font);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++){
	var _offset = 2;
	var _txt = menu[i];
	var _menu_color;
	if (menu_cursor == i){
		_txt = string_insert("> ",_txt,0);
		_menu_color = color_selected;
	} else{
		_menu_color = color_unselected;
	}
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 1.5));
	draw_set_color(c_black);
	draw_text(xx-_offset,yy,_txt);
	draw_text(xx+_offset,yy,_txt);
	draw_text(xx,yy-_offset,_txt);
	draw_text(xx,yy+_offset,_txt);
	draw_set_color(_menu_color);
	draw_text_scribble(xx,yy,_txt);
}

draw_set_font(fDefault);