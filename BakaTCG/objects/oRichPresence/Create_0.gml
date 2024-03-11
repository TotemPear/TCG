/// @description Initialize Discord.

#macro DISCORD_APP_ID "1216529865617182770"

ready = false;

alarm[0] = 60 * 5;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}