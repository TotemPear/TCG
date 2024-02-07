#region Initialize Globals
global.hand = [];
global.currentCharacters = [];
global.currentEnemyCharacters = [];
global.hoveredObjects = [];
global.currentSelected = noone;
global.skillsShown = false;
global.state = STATE.MENU_MAIN;

global.againstAI = false;
global.username = "Guest" = string(irandom_range(0,9999))
global.logedIn = false;
#endregion
hoveredID = noone;
#region Music
#region Playlists
musicPlaylistNormal = array_shuffle([
	[mJazz00,"Confidence Man"],
	[mJazz01,"Hustle and Bustle"],
	[mJazz02,"Con Artist"],
	//[mJazz03,"Mischief Abound"],
	[mJazz04,"Soiree"],
	[mJazz05,"Introduction"],
	[mJazz06,"Game A"],
	[mJazz10,"Sidewinder"],
	[mJazz12,"Too Good Too Bad"],
	[mJazz14,"N.Y. Rush"],
	[mJazz15,"Odd - Ones"],
	[mJazz17,"Jazz Quartet"],
]);

musicPlaylistDanger = array_shuffle([
	[mJazz13,"Bad Dog! No Biscuits!"],
	[mJazz11,"The Seatbelts - Tanks!"],
]);

musicPlaylistClutch = array_shuffle([
	[mJazz16,"Clutch"],
	[mJazz09,"Snap Out"],
	[mJazz07,"G.P."],
	[mJazz08,"Catch me if you can"],
])

musicPlaylistChill = array_shuffle([
	[mJazz19,"I'm 60"],
	[mJazz20,"Yes Girl"],
	[mJazz18,"Piano Bar"],
	[mJazz21,"White Day In The Blue"],
])
#endregion

isChangingSongs = false;
musicCurrent = 0;
playMusic = true;


/// @function music_set_playlist(playlist, [shuffle])
/// @arg {array} playlist
/// @arg {bool} shuffle
function music_set_playlist(_playlist, _shuffle = false){
	if (_shuffle) musicCurrentPlaylist = array_shuffle(_playlist);
	else musicCurrentPlaylist = _playlist;
	
	musicCurrent = 0;
}

music_set_playlist(musicPlaylistNormal);

musicCurrentPlaying = -1;
musicNewIndex = musicCurrentPlaylist[musicCurrent][0];
musicNewLoop = false;
musicNewGain = 0;
canChangeMusic = true;

/// @function music_play_song([index], [loop], [gain])
/// @arg {Asset.GMSound} index defaults to: musicCurrentPlaylist[musicCurrent][0]
/// @arg {bool} loop
/// @arg {real} gain
function music_play_song(_index = musicCurrentPlaylist[musicCurrent][0], _loop = false, _gain = 0){
	musicNewIndex = _index;
	musicNewLoop = _loop;
	musicNewGain = _gain
	if (playMusic) && (!audio_is_playing(_index)){
		if (!audio_is_playing(musicCurrentPlaying)) {
			musicCurrentPlaying = audio_play_sound(_index,0,_loop,_gain);
			musicTextTimer = musicTextTimerLength;
		}
		else{
			isChangingSongs = true;
			musicTextTimer = 0;
			
		}
	}
}

/// @function music_get_song_name([index], [playlist])
/// @arg {real} index
/// @arg {array} playlist
/// @pure
function music_get_song_name(_index = musicCurrent, _playlist = musicCurrentPlaylist){
	return (_playlist[_index][1]);
}

musicTextX = 8;
musicTextY = room_height+8;
musicTextYOffset = 8;
musicTextSpeed = 0.02;
musicTextFont = "fBig";
musicTextColor = "c_white";
musicTextSprite = "sMusicIcon";
musicTextTimerLength = 400;
musicTextTimer = musicTextTimerLength;

#endregion

switch_state(STATE.MENU_MAIN);

versionCheckRequest = undefined;

global.isNewVersion = false;
global.newVersion = -1;

versionCheckRequest = request_make("system","GET");

