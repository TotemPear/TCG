/// @function make_request(url, type, [body])
/// @arg {string} url
/// @arg {string} type
/// @arg {string} body
function request_make(_url,_type,_body = ""){
	if (_body != ""){
		var _jsonNote = json_encode(_body);
	} else{
		_jsonNote = "";
	}
	var _map = ds_map_create()
	ds_map_add(_map, "Content-Type", "application/json");
	var _request = http_request("https://baka-tcg-default-rtdb.firebaseio.com/"+_url+"/.json", string_upper(_type), _map, _jsonNote);
	ds_map_destroy(_map);
	return _request;
}

/// @function request_get_result(request_id)
/// @arg {ID.DsMap} request_id
/// @arg {string} failure_string
/// @pure
function request_get_result(_request, _failure = "Failure"){
	if async_load[?"id"] == _request{
		if async_load[?"status"] == 0{
			return async_load[?"result"];
		
		} else{
			return _failure;
		}
	}
	return undefined;
}

/// @function request_is_succesful(request_id)
/// @arg {ID.DsMap} request_id
/// @pure
function request_is_succesful(_request){
	if async_load[? "id"] == _request{
		if async_load[?"status"] == 0{
			return true;
		}
	}
	return false;
}
