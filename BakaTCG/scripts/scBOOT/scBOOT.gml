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

global.elementColours = [
	c_silver, // 0
	c_maroon, // 1
	c_aqua,   // 2
	c_green,  // 3    _____________
	c_white,  // 4---/             \
	c_white,  // 5---| Placeholder |
	c_white,  // 6---\_____________/
	c_white,  // 7
	c_white   // 8
];

global.elementIcons = [
	sIconGigachad, // 0
	sIconBozo,     // 1
	sPlaceholder,  // 2
	sIconOld,      // 3
	sPlaceholder,  // 4
	sPlaceholder,  // 5
	sPlaceholder,  // 6
	sPlaceholder,  // 7
	sPlaceholder   // 8
];

global.elementNames = [
	"Gigachad",
	"Bozo",
	"Dumb",
	"Old",
	"e4",
	"e5",
	"e6",
	"Omni",
	"David"
]

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

if (false){
	audio_group_load(audiogroup_music);
}

scribble_font_set_default("fDefault");

