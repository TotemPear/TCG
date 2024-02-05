if (keyboard_check_pressed(ord("R"))){
	game_restart();
}

var _currenthovered = get_hovered();
if (_currenthovered != hoveredID){
	variable_instance_set(hoveredID,"hovered", false);
	hoveredID = _currenthovered;
	variable_instance_set(hoveredID,"hovered", true);
	if (hoveredID == noone){
		window_set_cursor(cr_default);
	} else{
		window_set_cursor(cr_handpoint);
	}
}

if (hoveredID == noone){
	if (mouse_check_button_pressed(mb_left)){
		with (global.currentSelected){
			selected = false;
		}
		global.currentSelected = noone;
	}
}

if (playMusic) && (!audio_is_playing(musicCurrentPlaying)){
	musicCurrent++;
	if (musicCurrent = array_length(musicCurrentPlaylist)) musicCurrent = 0;
	
	music_play_song();
	
} else if (playMusic) && (!isChangingSongs){
	var _audioFadeInTime = 10; //Seconds
	audio_sound_gain(musicCurrentPlaying,0.25,_audioFadeInTime*1000);
	musicTextTimer--;
}

if (isChangingSongs){
	audio_sound_gain(musicCurrentPlaying,0,200);
	if (audio_sound_get_gain(musicCurrentPlaying) == 0){
		musicCurrentPlaying = audio_play_sound(musicNewIndex,0,musicNewLoop,musicNewGain);
		musicTextTimer = musicTextTimerLength;
		isChangingSongs = false;
	}
}

if (!global.newVersion) && (versionCheckRequest == undefined){
	
}


