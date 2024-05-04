randomize();
#macro SUB_VERSION "alpha"

enum CARD{
	CHANTAL,
	DAVID
}

enum CHARACTER{
	SOLOMON,
	CHARLES,
	ABBY,
	KIM
}

enum ELEMENT{
	GIGACHAD,
	BOZO,
	DUMBASS,
	OLD,
	e4,
	e5,
	e6,
	OMNI,
	DAVID
}

#macro COLOR_GIGACHAD c_silver
#macro COLOR_BOZO c_maroon
#macro COLOR_DUMBASS c_aqua
#macro COLOR_OLD c_green
#macro COLOR_4 c_white // Placeholder \
#macro COLOR_5 c_white //              |
#macro COLOR_6 c_white //             /
#macro COLOR_OMNI c_white
#macro COLOR_DAVID c_white

#macro ICON_GIGACHAD sIconGigachad
#macro ICON_BOZO sIconBozo
#macro ICON_DUMBASS sPlaceholder
#macro ICON_OLD sIconOld
#macro ICON_4 sPlaceholder
#macro ICON_5 sPlaceholder
#macro ICON_6 sPlaceholder
#macro ICON_DAVID sPlaceholder


enum STATE {
	MENU_MAIN,
	MENU_GAME,
	MENU_MATCHMAKING,
	MENU_DECK,
	MENU_ACCOUNT,
	MENU_PAUSE,
	GAME_START,
	GAME_MAIN,
	GAME_DICE,
	MATCHMAKING,
	TOTAL
}

#macro DEBUG_MODE false
#macro Debug:DEBUG_MODE true
if (!DEBUG_MODE){
	audio_group_load(audiogroup_music);
}

scribble_font_set_default("fDefault");

