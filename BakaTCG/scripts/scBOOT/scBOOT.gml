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

enum STATE {
	MENU_MAIN,
	MENU_GAME,
	MENU_MATCHMAKING,
	MENU_DECK,
	MENU_ACCOUNT,
	MENU_PAUSE,
	GAME,
	MATCHMAKING,
	TOTAL
}

#macro DEBUG_MODE false
#macro Debug:DEBUG_MODE true
if (!DEBUG_MODE){
	audio_group_load(audiogroup_music);
}

scribble_font_set_default("fDefault");

