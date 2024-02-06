switch global.state{
	case STATE.MENU_MAIN: default:
	
		// make_menu(
		//	room_width/2,
		//	room_height/2,
		//	[["Potato",show_debug_message("Potato")],["Yes",show_debug_message("why")]],
		//	fPixelMenu,
		//	,
		//	,
			
		//);
		
		if instance_exists(oMenu) instance_destroy(oMenu);
		instance_create_depth(x,y,depth,oMenu);
		break;
	
	case STATE.MENU_ACCOUNT:
		
		if instance_exists(oMenu) instance_destroy(oMenu);
		instance_create_depth(x,y,depth,oMenu);
		break;
		
	case STATE.MENU_PAUSE:
		
		break;
		
	case STATE.GAME:
		global.enemyID = stateArgument1;
		
		break;
	
}













