/// @desc 2s Loop

ini_open("info.ini");
var _sub = ini_read_string("Version", "sub-version", "");
var _ver = ini_read_string("Version", "version", "0");
ini_close();
if (is_newer_version(_ver,_sub,GM_version,SUB_VERSION) == 1){
	instance_create_depth(x,y,0,oUpdatePopup);
	updatePopupShowed = true;
} else if (!updatePopupShowed) alarm_set(1, 120);
