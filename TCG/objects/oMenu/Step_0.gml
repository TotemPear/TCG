/// @desc Control

// Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

// Keyboard Controls
if (menu_control){
	if (keyboard_check_pressed(vk_up)){
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (keyboard_check_pressed(vk_down)){
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}
	
	if (keyboard_check_pressed(vk_enter)){
		menu_x_target = gui_width+400;
		menu_committed = menu_cursor;
		menu_control = false;
		color_selected = color_chose;
	}
}

if (menu_x > gui_width+380) && (menu_committed != -1){
	switch (global.state){
		case STATE.MENU_MAIN: default:
			switch (menu_committed){
				case 4:
					url_open($"https://github.com/TotemPear/TCG/releases/download/v{global.newVersion}{SUB_VERSION}/TCG.exe")
					game_end();
				case 3: default:
					switch_state(STATE.GAME)
					break;
				case 2:
					switch_state(STATE.MENU_DECK);
					break;
				case 1:
					switch_state(STATE.MENU_ACCOUNT);
					break;
				case 0:
					game_end();
					break;
			}
			break;
	}
}


switch(global.state){
	case STATE.MENU_MAIN: default:
		if (global.isNewVersion){
			menu[4] = "[rainbow]Update";
		}
		break;
	
}

menu_items = array_length(menu);
