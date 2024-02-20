// Music Text
if(playMusic){
	if (musicTextTimer > 0){
		musicTextY = lerp(musicTextY, room_height - string_height_scribble($"[{musicTextSprite}] {music_get_song_name()} [{musicTextSprite}]")-musicTextYOffset, musicTextSpeed);
	} else{
		musicTextY = lerp(musicTextY, room_height+8,musicTextSpeed);
	}

	if (abs(musicTextY-(room_height)) > 1) || (musicTextTimer > 0){
		var scribble_object = scribble($"[{musicTextColor}][{musicTextFont}][{musicTextSprite}] {music_get_song_name()}[{musicTextSprite}]");
		scribble_object.draw(musicTextX,musicTextY);
	}
}


