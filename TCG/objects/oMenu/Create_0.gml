/// @desc GUI/Menu Setup

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

color_selected = c_white;
color_unselected = c_gray;
color_chose = c_lime;

menu_x = gui_width+400;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25; // lower is faster
menu_font = fHuge;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;

switch(global.state){
	case STATE.MENU_MAIN: default:
		menu[3] = "Play";
		menu[2] = "Deck";
		menu[1] = "Account"
		menu[0] = "Exit";
		break;
	
}
menu_items = array_length(menu);
menu_cursor = menu_items-1;




