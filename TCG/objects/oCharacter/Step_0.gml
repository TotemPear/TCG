if (status == 0){
	if (!enemy) var _array = global.currentCharacters
	else var _array = global.currentEnemyCharacters
	handPosition = -1;
	if (array_length(_array) == 1){			// ONE CHARACTERS
		handPosition = 0;
		targetX = cardPositionCenter - sprite_width/2;
	} else if (array_length(_array) == 2){  // TWO CHARACTERS
		if (_array[0] < _array[1]){
			if (arrayPosition == 0) handPosition = 0;
			else handPosition = 1;
		} else{
			if (arrayPosition == 0) handPosition = 1;
			else handPosition = 0;
		}
		targetX = distribute(sprite_width*2*1.2,handPosition,2,cardPositionCenter) - sprite_width/2;
	} else{									// THREE CHARACTERS
		var _smallest = infinity;
		var _biggest = -infinity;
		var _smallestID = -1;
		var _biggestID = -1;
		for(var i = 0; i < 3; i++){
			if (_array[i] < _smallest){
				_smallest = _array[i];
				_smallestID = i;
			} else if (_array[i] > _biggest){
				_biggest = _array[i];
				_biggestID = i;
			}
		}
		if (arrayPosition == _smallestID){
			handPosition = 0;
		} else if (arrayPosition == _biggestID){
			handPosition = 2;
		} else{
			handPosition = 1;
		}
		targetX = distribute(sprite_width*3*1.2,handPosition,3,cardPositionCenter) - sprite_width/2;
	}
	status = 1;
}

x = lerp(x, targetX, moveSpeed);
y = lerp(y, targetY, moveSpeed);
z = lerp(z, targetZ, 0.1);

hoverable = (abs(x - targetX) <= 16) && (abs(y - targetY) <= 16);
selectable = hoverable;


//show_debug_message($"{handPosition} - {name}");