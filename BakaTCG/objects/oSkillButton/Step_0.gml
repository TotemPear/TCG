if (global.currentSelected != characterID) && (status == 0) {
	if (global.currentSelected != noone) && (global.currentSelected == id) {
		with (characterID){
			stat = 2;
			usingSkill = other.skillID;
		}
	}
	global.currentSelected = noone;
	status = 1;
}

if (status == 1){
	global.skillsShown = false;
	
	instance_destroy();
}


