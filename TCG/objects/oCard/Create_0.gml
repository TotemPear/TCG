z = 0;
hoverable = false;
hovered = false;
selectable = false;
selected = false;
targetX = x;
targetY = y;
targetZ = z;
moveSpeed = 0.06;
startDepth = depth;
spriteOffsetX = 1;
spriteOffsetY = 1;

cardPositionCenter = room_width/2;
maxWidth = room_width/2;
cardSpriteIndex = sCardDefault
cardImageIndex = 0;
cardImageSpeed = 0;
switch(cardID){
	case -1: default:
	name = "Error";
	cost = 0;
	any = true;
	type = "Use";
	description = "Default Description"
	//show_message("Error card with ID of 0 obtained.");
	//game_end();
	break;
	case CARD.CHANTAL:
	name = "Chantal";
	cost = 1;
	any = false;
	type = "Summon"
	description = "As long as the card is on the board, switching characters will be considered a [c_aqua]fast action[/c].";
	cardSprite = sCard;
	break;
	case CARD.DAVID:
	name = "[rainbow]David";
	cost = 0;
	any = false;
	type = "[rainbow]Legendary";
	description = "[rainbow]The David."
}

if (status == 0){
	array_push(global.hand,cardID);
	arrayPosition = array_length(global.hand)-1;
	x = room_width/2;
	y = room_height/2;
	targetX = x;
	targetY = room_height-sprite_height;
}


output = false;