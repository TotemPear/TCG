maxWidth = clamp(sprite_width*array_length(global.hand)/1.2,0,room_width/2);
if (status == 1) && (oldCardAmount != array_length(global.hand)){
	status = 0;
}
oldCardAmount = array_length(global.hand);

if (status == 0){
	var handArrayOffset = 0;
	handPosition = -1;
	var handPositionTemp = handPosition;
	var handPositionArrayTemp = [];
	array_copy(handPositionArrayTemp,0,global.hand,0,array_length(global.hand));
	var handPositionArrayOrder = [];
	for(var i = 0; i < array_length(global.hand); i++){
		var handSmallestID = -1;
		var handSmallest = infinity;
		for(var ii = 0; ii < array_length(handPositionArrayTemp); ii++){
			if (handPositionArrayTemp[ii] < handSmallest){
				handSmallest = handPositionArrayTemp[ii];
				handSmallestID = ii;
			}
			if (ii + handArrayOffset == arrayPosition){
				handPositionTemp = ii;
			}
			if (ii + 1 == array_length(handPositionArrayTemp)){
				array_push(handPositionArrayOrder,handSmallest);
				if (handSmallestID == handPositionTemp){
					handPosition = array_length(handPositionArrayOrder)-1;
				}
			}

		}
		
		if (handSmallestID < handPositionTemp){	
			handArrayOffset++;
		} else if !(handSmallestID > handPositionTemp){
			break;
		}
		array_delete(handPositionArrayTemp,handSmallestID,1)
		
	}
	
	if (array_length(global.hand) == 1){
		targetX = cardPositionCenter - sprite_width/2;
	} else{
		targetX = distribute(maxWidth,handPosition,array_length(global.hand),cardPositionCenter) - sprite_width/2;	
	}
	status = 1;
}


if (selected){
	targetZ = 0;
	targetY = room_height-sprite_height-160;
} else if (status == 1){
	targetY = room_height-sprite_height;
}
x = lerp(x, targetX, moveSpeed);
y = lerp(y, targetY, moveSpeed);
z = lerp(z, targetZ, 0.1);

hoverable = (abs(x - targetX) <= 16) && (abs(y - targetY) <= 16)
selectable = hoverable;

if (hovered) || (selected){
	if (!selected) targetZ = -48;
	depth = -infinity;
	image_alpha = lerp(image_alpha,0.90,0.08);
} else{
	targetZ = 0;
	image_alpha = lerp(image_alpha,0.95,0.08);
	depth = startDepth-handPosition;
}

//show_debug_message($"{id} - {handPosition}");