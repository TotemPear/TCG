/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	global.discord_initialized = true;
	
	//window_set_caption("We're ready!");
	ready = true;
	//show_debug_message("date: " + string(date_current_datetime()));
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more(global.RPSmallImageText, global.RPBigImageText, false);
	
	// bruh
	//np_setpresence_buttons(0, "Get the game", "https://github.com/TotemPear/TCG/releases/download/v0.0.4-alpha/BakaTCG-Installer.zip");
	//np_setpresence_buttons(1, "Russian Facebook", "https://vk.com/");
	// DISCORD_MAX_BUTTONS == 2, so only allowed IDs are 0 and 1.
	
	//np_setpresence() should ALWAYS come the last!!
	
	np_setpresence(global.RPState,global.RPDetails,global.RPBigImage,global.RPSmallImage);
	
	// passing a URL will add this sprite asynchronously via *internets*
	//sprite_add(np_get_avatar_url(async_load[? "user_id"], async_load[? "avatar"]), 1, false, false, 0, 0);
	
	alarm_set(1,360);
}