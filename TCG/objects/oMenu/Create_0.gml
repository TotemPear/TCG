/// @desc GUI/Menu Setup Potato

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

color_selected = c_white;
color_unselected = c_gray;
color_chose = c_lime;

menu_x = gui_width+650;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 30; // lower is faster
menu_font = fHuge;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;

menu[0] = "Back";
switch(global.state){
	case STATE.MENU_MAIN: default:
		menu[3] = "Play";
		menu[2] = "Deck";
		menu[1] = "Account"
		menu[0] = "Exit";
		break;
		
	case STATE.MENU_GAME:
		menu[2] = "Play Online"
		menu[1] = "Play against AI"
		break;
		
	case STATE.MENU_ACCOUNT:
		if (!global.logedIn){
			menu[1] = "Log in";
		} else{
			menu[3] = "Log out";
			menu[2] = "Change username";
			menu[1] = "Change password";
		}
		break;
	
}
menu_items = array_length(menu);
menu_cursor = menu_items-1;




