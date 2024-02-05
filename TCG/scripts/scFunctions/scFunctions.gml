/// @function approach(start, end, shift)
/// @arg {real} start
/// @arg {real} end
/// @arg {real} amount
/// @pure
function approach(_start, _end, _amount){
	if (_start < _end)
	{
	    _start += _amount;
	    if (_start > _end)
	        return _end;
	}
	else
	{
	    _start -= _amount;
	    if (_start < _end)
	        return _end;
	}
	return _start;
}

/// @function add_hovered([depth}, [id])
/// @desc Adds an object to the hoverable list. If the object has the lowest depth. Its "hovered" variable will be set to true.
/// @arg {real} [depth] Optional argument indicating the depth of the object to add to the list.
/// @arg {id.Instance} [id] Optional argument indicating the id of the object to add to the list.
/// @arg {string} [var] Optional arugment indicating the name of the variable to set to true or false.
function add_hovered(_depth = depth,_id = id){
	for(var i = 0; i < array_length(global.hoveredObjects); i++){
		if (_id == global.hoveredObjects[i][1]){
			return false;
		}
	}
	array_push(global.hoveredObjects,[_depth,_id]);
	return true;
}

/// @function remove_hovered([id])
/// @arg {id.Instance} [id] Optional argument indicating the id of the object to remove from the list.
function remove_hovered(_id = id){
	for(var i = 0; i < array_length(global.hoveredObjects); i++){
		if (global.hoveredObjects[i][1] == _id){
			array_delete(global.hoveredObjects,i,1);
			return true;
		}else if (i+1 == array_length(global.hoveredObjects)){
			return false;
		}
	}
}

/// @function get_hovered()
/// @desc Returns the object with the lowest depth in the global.hoveredObjects array.
/// @pure
function get_hovered(){
	var _min = infinity;
	var _id = noone;
	for(var i = 0; i < array_length(global.hoveredObjects); i++){
		if (global.hoveredObjects[i][0] < _min){
			_min = global.hoveredObjects[i][0];
			_id = global.hoveredObjects[i][1];
		}
	}
	return _id;
}

/// @function distribute(width, order, num, center)
/// @arg {real} width Width of the distribution.
/// @arg {real} order Current object's order in the distribution.
/// @arg {real} num Number of objects to be distributed.
/// @arg {real} center Center of the distribution.
function distribute(_width,_order,_num,_center){
	return (_order * (_width/(_num-1))) + _center - (_width/2);
}

/// @function make_hoverable(condition, depth, id, var)
/// @arg {bool} [condition] Optional argument indicating a condition that if set to false will remove the object from the list.
/// @arg {real} [depth] Optional argument indicating the depth of the object to add or remove from the list.
/// @arg {id.Instance} [id] Optional argument indicating the id of the object to add or remove from the list.
/// @arg {string} [var] Optional arugment indicating the name of the variable to set to true or false.
function make_hoverable(_condition = true,_depth = depth,_id = id){
	if position_meeting(mouse_x,mouse_y,_id) && (_condition){
		add_hovered(_depth,_id);
	} else{
		remove_hovered(_id);
	}
}

/// @function make_selectable([condition])
/// @arg {bool} [condition]
function make_selectable(_condition = true){
	if (global.currentSelected != id){
		with (global.currentSelected){
			selected = false;
		}
	}
	global.currentSelected = id;
	with (global.currentSelected) {
		selected = true;
	}
}

/// @function function(image_index, image_speed, image_timer)
/// @arg {string} image_index
/// @arg {string} image_speed
/// @arg {string} image_timer
/// @arg {string} image_number
function do_animation(_image_index,_image_speed,_image_timer,_image_number){
	if (variable_instance_get(id,_image_speed) != 0) && (variable_instance_get(id,_image_number) != 1){
		if (variable_instance_get(id,_image_timer) <= 0){
			variable_instance_set(id,_image_index,variable_instance_get(id,_image_index)+1);
			if !(variable_instance_get(id,_image_index) < variable_instance_get(id,_image_number)){
				variable_instance_set(id,_image_index,0);
			}
			variable_instance_set(id,_image_timer,variable_instance_get(id,_image_speed));
		}
		variable_instance_set(id,_image_timer,variable_instance_get(id,_image_timer)-1);
	}
}

function ease_in_out(_time, _begin, _change, _duration){
	_time /= _duration/2;
	if (_time < 1) return _change/2*_time*_time + _begin;
	_time--;
	return -_change/2 * (_time * (_time-2) -1) + _begin;
}

function switch_state(_state, _arg1 = undefined, _arg2 = undefined, _arg3 = undefined){
	with (oGame){
		global.state = _state
		stateArgument1 = _arg1
		stateArgument2 = _arg2
		stateArgument3 = _arg3
	
		alarm_set(0,1);
		switch global.state{
			case STATE.MENU_MAIN:
				if (room != rMenu) room_goto(rMenu);

				break;
			case STATE.MENU_DECK:
				if (room != rMenu) room_goto(rMenu);
			
				break;
			case STATE.MENU_ACCOUNT:
				if (room != rMenu) room_goto(rMenu);
			
				break;
			case STATE.MENU_PAUSE:
			
				break;
			case STATE.GAME:
				if (room != rGame) room_goto(rGame);

				break;
		}
	}
}