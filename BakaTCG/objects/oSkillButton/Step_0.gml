if (global.currentSelected != characterID) && (status == 0) {
	if (global.currentSelected == noone) status = 1; 
	else if (global.currentSelected.object_index != object_index) status = 1;
}

if (status == 1){
	global.skillsShown = false;
	
	instance_destroy();
}


