if (request_is_succesful(versionCheckRequest)){
	var _newVersion = json_decode(async_load[?"result"]);
	//_newVersion = string_delete(_newVersion,1,1);
	//_newVersion = string_delete(_newVersion,string_length(_newVersion),1);
	
	show_debug_message(_newVersion[?"sub-version"]);
	show_debug_message(_newVersion[?"version"]);
	
	global.newVersion = _newVersion[?"version"];
	
	var _sub = string_delete(SUB_VERSION,1,1);
	if _sub != _newVersion[?"sub-version"]{
		if (_sub == "alpha"){
			if (_newVersion[?"sub-version"] == "beta") global.isNewVersion = true;
			else if (_newVersion[?"sub-version"] == "") global.isNewVersion = true;
		} else if (_sub == "beta") && (_newVersion[?"sub-version"] == "") global.isNewVersion = true;
	}
	
	if (!global.isNewVersion){
		var _new = string_split(_newVersion[?"version"],".");
		var _old = string_split(GM_version,".");
	
		while(array_length(_new) > array_length(_old)){
			array_push(_old,"0");
		}
		while(array_length(_old) > array_length(_new)){
			array_push(_new,"0");
		}
	
	
		for (var i = 0; i < array_length(_new); i++){
			if real(_new[i]) > real(_old[i]){
				global.isNewVersion = true;
				break;
			} else if (real(_old[i])) > real(_new[i]){
				break;
			}
		}
	
		if (!global.isNewVersion) alarm_set(1,600);
	}
}

