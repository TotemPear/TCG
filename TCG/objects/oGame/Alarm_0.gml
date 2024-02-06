switch global.state{
	case STATE.MENU_MAIN: default:
		
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













