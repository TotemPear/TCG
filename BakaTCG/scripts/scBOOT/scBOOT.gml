randomize();

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

//#macro ELEMENT_COLOR[ELEMENT.GIGACHAD] c_silver
//#macro ELEMENT_COLOR[ELEMENT.BOZO] c_maroon
//#macro ELEMENT_COLOR[ELEMENT.DUMBASS] c_aqua
//#macro ELEMENT_COLOR[ELEMENT.OLD] c_green
//#macro ELEMENT_COLOR[4] c_white
//#macro ELEMENT_COLOR[5] c_white
//#macro ELEMENT_COLOR[6] c_white
//#macro ELEMENT_COLOR[ELEMENT.OMNI] c_white
//#macro ELEMENT_COLOR[ELEMENT.DAVID] c_white

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

