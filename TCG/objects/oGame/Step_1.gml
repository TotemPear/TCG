/// @desc Check for internet connection

global.connected = os_is_network_connected();

if (!global.connected) && (!instance_exists(oWifiLogo)) {
	instance_create_depth(0,0,depth,oWifiLogo);
	show_debug_message("yeah");
}
