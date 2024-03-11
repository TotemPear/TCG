type = irandom_range(1,8);
targetX = x-sprite_width-16;
targetY = y;
moveSpeed = 0.01;
hovered = false;
switch(type){
	case ELEMENT.GIGACHAD:
	sprite_index = sDieGigachad;
	break;
	case ELEMENT.BOZO:
	sprite_index = sDieBozo;
	break;
	case ELEMENT.DUMBASS:
	sprite_index = sPlaceholder;
	break;
	case ELEMENT.OLD:
	sprite_index = sDieOld;
	break;
	case 4:
	sprite_index = sPlaceholder;
	break;
	case 5:
	sprite_index = sPlaceholder;
	break;
	case 6:
	sprite_index = sPlaceholder;
	break;
	case ELEMENT.OMNI:
	sprite_index = sDieOmni;
	break;
}
