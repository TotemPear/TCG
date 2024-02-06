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
		menu_x_target = gui_width+650;
		menu_committed = menu_cursor;
		menu_control = false;
		color_selected = color_chose;
	}
}

if (menu_x > gui_width+630) && (menu_committed != -1){
	switch (global.state){
		case STATE.MENU_MAIN: default:
			switch (menu_committed){
				case 4:
					url_open($"https://github.com/TotemPear/TCG/releases/download/v{global.newVersion}{SUB_VERSION}/TCG.exe");
					game_end();
				case 3: default:
					switch_state(STATE.GAME);
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
		
		case STATE.MENU_ACCOUNT:
			switch (menu_committed){
				case 3:
					// Log out
					
					// Loged out succesfuly!
					
					switch_state(STATE.MENU_ACCOUNT);
					break;
				case 2:
					// Change username
					
					// Username changed succesfuly!
					
					switch_state(STATE.MENU_ACCOUNT);
					break;
				case 1:
					if (global.logedIn){
						// Change password
						
						// Password changed succesfuly!
						
						switch_state(STATE.MENU_ACCOUNT);
					} else{
						var _correct = false;
						var _inputString = "Enter your username:";
						var _username = -1;
						while !_correct{
							_username = get_string(_inputString, ""); // CHANGE
							
							if (_username == ""){
								break;
							} else if(string_length(_username) < 3){
								_inputString = "The username must be at least 3 characters long.\nEnter your username:";
							} else{
								var _ok1 = true;
								var _allowedCharacters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","_"];
							    for (var i = 1; i <= string_length(_username); i++){
							    	var _ok2 = false;
							    	for (var ii = 0; ii < array_length(_allowedCharacters); ii++){
							    		if (string_lower(string_char_at(_username,i)) == _allowedCharacters[ii]){
							    			_ok2 = true;
							    			break;
							    		}
							    	}
							    	if (!_ok2){
							    		var _ok1 = false;
							    		break;
							    	}
							    }
							    if (!_ok1){
							    	_inputString = "The username must only include letters, numbers and underscores.\nEnter your username:";
							    }
							    _correct = _ok1;
							}
						}
					}
						
						
					// Username already used or not
					
					// Get password
					
					// Store password online
					
					// Store password in save
					
					// Loged in succesfuly!
					
					switch_state(STATE.MENU_MAIN);
					break;
					
				case 0: default:
					switch_state(STATE.MENU_MAIN)
					break;
			}
		break;
	}
}


switch(global.state){
	case STATE.MENU_MAIN: default:
		if (global.isNewVersion){
			menu[4] = "[rainbow]Update";
		} else if (array_length(menu) == 5){
			array_delete(menu,4,1);
		}
		break;
}

menu_items = array_length(menu);
